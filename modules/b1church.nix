# Self-hosted ChurchApps stack — four containers, mirroring upstream's
# docker-compose.yml:
#   mysql   — MySQL 8.4, seven logical databases (one per API module)
#   api     — ChurchApps/Api, an Express modular monolith on :8084
#   admin   — ChurchApps/B1Admin, a Vite SPA (staff-facing admin UI)
#   portal  — ChurchApps/B1App, a Next.js member portal (multi-tenant)
#
# This module deliberately stops at the containers. It publishes them on
# loopback ports and leaves reverse proxying, TLS and DNS to the consumer, so
# the flake stays evaluable on its own and does not depend on any particular
# host's proxy abstraction.
#
# IMAGES: ChurchApps publishes none — ghcr.io/churchapps/* denies pulls and
# their Docker Hub org is empty, so upstream's compose builds from Git
# contexts at `up` time. This repo's nightly workflow builds them ahead of
# time and commits the published tag to ../image.nix.
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.b1church;

  deployment = import ../deployment.nix;
  image = import ../image.nix;

  apiBase = "https://${cfg.domain}${deployment.apiPath}";
  contentRoot = "${apiBase}/content";
  socketUrl = "wss://${cfg.domain}${deployment.apiPath}";
  adminUrl = "https://${cfg.domain}";

  dataDir = cfg.dataDir;
  imageFor = component: "${image.registry}-${component}:${image.tag}";
in
{
  options.services.b1church = {
    enable = mkEnableOption "B1 Church self-hosted ChurchApps stack";

    domain = mkOption {
      type = types.str;
      default = deployment.domain;
      description = ''
        Hostname serving the admin UI, with the Api mounted under
        ${deployment.apiPath}. Baked into the frontend images at build time,
        so overriding it here without rebuilding them produces an admin UI
        that calls the wrong API — asserted against below.
      '';
    };

    portalBaseDomain = mkOption {
      type = types.str;
      default = deployment.portalBaseDomain;
      description = "Base domain for member portal sites (<church>.<this>).";
    };

    corsOrigin = mkOption {
      type = types.str;
      default = "*";
      description = ''
        CORS_ORIGIN for the Api — a comma-separated list of exact origins, or
        "*". Defaults to "*" (upstream's default) because the Api matches
        origins with an exact `includes()` check and so cannot express the
        wildcard subdomain the member portal is served from. Auth is a Bearer
        JWT rather than a cookie, so a permissive origin does not by itself
        let a third-party site act as a signed-in user.
      '';
    };

    supportEmail = mkOption {
      type = types.str;
      default = "";
      description = "Address used as the From/reply-to for transactional mail.";
    };

    smtp = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Configure an SMTP relay for transactional mail. While disabled the
          Api starts and registration works — the first account still becomes
          server admin — but password resets and member invites are generated
          with nowhere to send them. The Api treats an unset MAIL_SYSTEM as an
          explicit "no mail provider" and reports it via its server-health
          endpoint, so this is a supported state rather than a latent failure.

          Enabling additionally requires SMTP_USER and SMTP_PASS in
          apiSecretFile.
        '';
      };
      host = mkOption {
        type = types.str;
        default = "";
        description = "SMTP relay hostname.";
      };
      port = mkOption {
        type = types.port;
        default = 587;
        description = "SMTP port. 587 is STARTTLS, 465 is implicit TLS (set secure = true).";
      };
      secure = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to use implicit TLS (port 465) rather than STARTTLS.";
      };
    };

    dbSecretFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = ''
        KEY=VALUE file shared by the mysql and api containers. Must define
        MYSQL_ROOT_PASSWORD and the eight *_CONNECTION_STRING values, which
        embed that same password — one file so they cannot drift apart.

        Use a password made only of URL-safe characters: it is substituted
        into mysql:// URLs, and anything needing percent-encoding corrupts
        every connection string.
      '';
    };

    apiSecretFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = ''
        KEY=VALUE file defining JWT_SECRET and ENCRYPTION_KEY (32 chars,
        matching upstream's own default length), plus SMTP_USER/SMTP_PASS when
        smtp.enable is set. Changing ENCRYPTION_KEY after first boot makes
        existing encrypted columns unreadable — treat it as permanent once the
        stack holds data.
      '';
    };

    imageTag = mkOption {
      type = types.nullOr types.str;
      default = image.tag;
      description = ''
        Image tag to deploy. Defaults to the tag the nightly build committed
        to image.nix, so upgrading is `nix flake update` on this input rather
        than editing a string. Override only to roll back to a known-good tag.
      '';
    };

    dataDir = mkOption {
      type = types.str;
      default = "/var/lib/b1church";
      description = ''
        Parent for MySQL data, uploaded content and snapshots. Put this on a
        snapshotted filesystem — it holds every church's records.
      '';
    };

    apiPort = mkOption {
      type = types.port;
      default = 8084;
      description = "Loopback host port for the Api container.";
    };

    adminPort = mkOption {
      type = types.port;
      default = 3101;
      description = "Loopback host port for the B1Admin container.";
    };

    portalPort = mkOption {
      type = types.port;
      default = 3102;
      description = "Loopback host port for the B1App member portal container.";
    };

    snapshots = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Daily mysqldump plus a tar of uploaded content.";
      };
      retentionDays = mkOption {
        type = types.int;
        default = 14;
        description = "How long to keep snapshot files.";
      };
    };

    # ── Read-only, for consumers ──────────────────────────────────────────
    apiPath = mkOption {
      type = types.str;
      readOnly = true;
      default = deployment.apiPath;
      description = ''
        Path prefix the Api must be served under, for the consumer's reverse
        proxy to strip. Read-only: it is baked into the frontend images, so it
        is a property of the build, not a deployment choice.
      '';
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.imageTag != null;
        message = ''
          services.b1church.imageTag is null — the nightly build has not
          published any images yet, so there is nothing to deploy. Run the
          "Build B1 Church images" workflow, then update this flake input.
        '';
      }
      {
        # The frontends inline their API URLs during `vite build` / `next
        # build`. A domain override here would not reach them.
        assertion = cfg.domain == deployment.domain;
        message = ''
          services.b1church.domain is "${cfg.domain}" but the images were
          built for "${deployment.domain}". These URLs are baked in at image
          build time and are not read at runtime, so the admin UI would call
          the wrong API. Change domain in this flake's deployment.nix and
          rebuild the images instead.
        '';
      }
      {
        assertion = cfg.portalBaseDomain == deployment.portalBaseDomain;
        message = ''
          services.b1church.portalBaseDomain is "${cfg.portalBaseDomain}" but
          the images were built for "${deployment.portalBaseDomain}". Change
          it in this flake's deployment.nix and rebuild the images.
        '';
      }
      {
        assertion = cfg.dbSecretFile != null;
        message = "services.b1church.dbSecretFile must be set.";
      }
      {
        assertion = cfg.apiSecretFile != null;
        message = "services.b1church.apiSecretFile must be set.";
      }
      {
        assertion = cfg.smtp.enable -> cfg.smtp.host != "";
        message = "services.b1church.smtp.enable is set but smtp.host is empty.";
      }
    ];

    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };
    virtualisation.oci-containers.backend = "docker";

    # ── Storage ───────────────────────────────────────────────────────────
    systemd.tmpfiles.rules = [
      "d ${dataDir} 0700 root root -"
      # MySQL's container user is uid/gid 999.
      "d ${dataDir}/mysql 0700 999 999 -"
      "d ${dataDir}/content 0755 root root -"
      "d ${dataDir}/snapshots 0700 root root -"
    ];

    # ── MySQL ─────────────────────────────────────────────────────────────
    virtualisation.oci-containers.containers."b1church-mysql" = {
      image = "mysql:8.4";
      environmentFiles = [ cfg.dbSecretFile ];
      volumes = [ "${dataDir}/mysql:/var/lib/mysql:rw" ];
      log-driver = "journald";
      extraOptions = [
        "--network-alias=mysql"
        "--network=b1church_default"
        "--health-cmd=mysqladmin ping -h 127.0.0.1 -uroot -p\"$MYSQL_ROOT_PASSWORD\""
        "--health-interval=5s"
        "--health-timeout=5s"
        "--health-retries=30"
      ];
    };

    # ── Api ───────────────────────────────────────────────────────────────
    virtualisation.oci-containers.containers."b1church-api" = {
      image = imageFor "api";
      environmentFiles = [
        cfg.apiSecretFile
        # The *_CONNECTION_STRING values — same file MySQL reads its root
        # password from.
        cfg.dbSecretFile
      ];
      environment = {
        ENVIRONMENT = "docker";
        # Turns on the self-hosted code path: local auth, and the first
        # account registered becomes the server admin.
        SELF_HOSTED = "1";
        SERVER_PORT = "8084";

        CORS_ORIGIN = cfg.corsOrigin;

        # Uploads go to a bind-mounted directory rather than S3, and the Api
        # serves them back from express.static("content"). CONTENT_ROOT is
        # stamped into the URLs it returns, so it must be externally reachable.
        FILE_STORE = "disk";
        DELIVERY_PROVIDER = "local";
        CONTENT_ROOT = contentRoot;

        SOCKET_URL = socketUrl;
        B1ADMIN_ROOT = adminUrl;

        SUPPORT_EMAIL = cfg.supportEmail;
      }
      # Leaving MAIL_SYSTEM unset is what disables outbound mail.
      // optionalAttrs cfg.smtp.enable {
        MAIL_SYSTEM = "SMTP";
        SMTP_HOST = cfg.smtp.host;
        SMTP_PORT = toString cfg.smtp.port;
        SMTP_SECURE = boolToString cfg.smtp.secure;
      };
      volumes = [ "${dataDir}/content:/app/content:rw" ];
      ports = [ "127.0.0.1:${toString cfg.apiPort}:8084/tcp" ];
      log-driver = "journald";
      extraOptions = [ "--network-alias=api" "--network=b1church_default" ];
    };

    # ── B1Admin (SPA) ─────────────────────────────────────────────────────
    # All configuration was baked in at image build time; the container only
    # serves the built bundle.
    virtualisation.oci-containers.containers."b1church-admin" = {
      image = imageFor "admin";
      environment.PORT = "3101";
      ports = [ "127.0.0.1:${toString cfg.adminPort}:3101/tcp" ];
      log-driver = "journald";
      extraOptions = [ "--network-alias=admin" "--network=b1church_default" ];
    };

    # ── B1App (member portal) ─────────────────────────────────────────────
    virtualisation.oci-containers.containers."b1church-portal" = {
      image = imageFor "portal";
      environment.PORT = "3000";
      ports = [ "127.0.0.1:${toString cfg.portalPort}:3000/tcp" ];
      log-driver = "journald";
      extraOptions = [ "--network-alias=portal" "--network=b1church_default" ];
    };

    # ── Ordering ──────────────────────────────────────────────────────────
    systemd.services."docker-network-b1church_default" = {
      path = [ pkgs.docker ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStop = "docker network rm -f b1church_default";
      };
      script = ''
        docker network inspect b1church_default || docker network create b1church_default
      '';
      partOf = [ "b1church-root.target" ];
      wantedBy = [ "b1church-root.target" ];
    };

    # oci-containers has no equivalent of compose's `depends_on: condition:
    # service_healthy`, and the Api exits rather than retrying if its seven
    # module connections fail at boot. Gate on the container healthcheck.
    systemd.services."b1church-wait-mysql" = {
      description = "Wait for B1 Church MySQL to report healthy";
      path = [ pkgs.docker ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        TimeoutStartSec = "5min";
      };
      script = ''
        set -eu
        for _ in $(seq 1 150); do
          status=$(docker inspect -f '{{.State.Health.Status}}' b1church-mysql 2>/dev/null || echo starting)
          [ "$status" = "healthy" ] && exit 0
          sleep 2
        done
        echo "b1church-mysql did not become healthy in time" >&2
        exit 1
      '';
      after = [ "docker-b1church-mysql.service" ];
      requires = [ "docker-b1church-mysql.service" ];
      partOf = [ "b1church-root.target" ];
      wantedBy = [ "b1church-root.target" ];
    };

    systemd.services."docker-b1church-mysql" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartSec = mkOverride 90 "10s";
      };
      after = [ "docker-network-b1church_default.service" ];
      requires = [ "docker-network-b1church_default.service" ];
      partOf = [ "b1church-root.target" ];
      wantedBy = [ "b1church-root.target" ];
    };

    systemd.services."docker-b1church-api" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartSec = mkOverride 90 "10s";
      };
      after = [ "b1church-wait-mysql.service" ];
      requires = [ "b1church-wait-mysql.service" ];
      partOf = [ "b1church-root.target" ];
      wantedBy = [ "b1church-root.target" ];
    };

    systemd.services."docker-b1church-admin" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartSec = mkOverride 90 "10s";
      };
      after = [ "docker-network-b1church_default.service" ];
      requires = [ "docker-network-b1church_default.service" ];
      partOf = [ "b1church-root.target" ];
      wantedBy = [ "b1church-root.target" ];
    };

    systemd.services."docker-b1church-portal" = {
      serviceConfig = {
        Restart = mkOverride 90 "always";
        RestartSec = mkOverride 90 "10s";
      };
      after = [ "docker-network-b1church_default.service" ];
      requires = [ "docker-network-b1church_default.service" ];
      partOf = [ "b1church-root.target" ];
      wantedBy = [ "b1church-root.target" ];
    };

    systemd.targets."b1church-root" = {
      unitConfig.Description = "B1 Church self-hosted ChurchApps stack";
      wantedBy = [ "multi-user.target" ];
    };

    # ── Snapshots ─────────────────────────────────────────────────────────
    systemd.services."b1church-snapshot" = mkIf cfg.snapshots.enable {
      description = "Daily snapshot of B1 Church databases and uploaded content";
      path = [ pkgs.docker pkgs.gzip pkgs.gnutar pkgs.findutils pkgs.coreutils ];
      after = [ "docker-b1church-mysql.service" ];
      requires = [ "docker-b1church-mysql.service" ];
      serviceConfig = {
        Type = "oneshot";
        TimeoutStartSec = "1h";
        SyslogIdentifier = "b1church-snapshot";
      };
      script = ''
        set -euo pipefail

        DEST=${dataDir}/snapshots
        STAMP="$(date +%Y-%m-%d)"

        # Run mysqldump inside the container so the root password comes from
        # that container's own environment — it never lands on the host
        # filesystem or in this script. --single-transaction keeps the dump
        # consistent without locking out the running Api.
        docker exec b1church-mysql sh -c \
          'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" --single-transaction --all-databases' \
          | gzip -c > "$DEST/db-$STAMP.sql.gz.partial"
        mv "$DEST/db-$STAMP.sql.gz.partial" "$DEST/db-$STAMP.sql.gz"

        # Uploaded files. Taken live rather than stopping the Api: these are
        # whole files written once, and everything relational that needs a
        # point-in-time view is in the dump above.
        tar czf "$DEST/content-$STAMP.tar.gz.partial" -C ${dataDir}/content .
        mv "$DEST/content-$STAMP.tar.gz.partial" "$DEST/content-$STAMP.tar.gz"

        # `set -o pipefail` means the mv is skipped if a dump dies mid-write,
        # so a truncated file is never promoted to a real snapshot name; the
        # .partial sweep cleans those up.
        find "$DEST" -maxdepth 1 -type f -name '*.gz' -mtime +${toString cfg.snapshots.retentionDays} -delete
        find "$DEST" -maxdepth 1 -type f -name '*.partial' -mtime +1 -delete
      '';
    };

    systemd.timers."b1church-snapshot" = mkIf cfg.snapshots.enable {
      description = "Run the B1 Church snapshot daily";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
        RandomizedDelaySec = "30min";
      };
    };
  };
}
