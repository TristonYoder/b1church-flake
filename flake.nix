{
  description = "Self-hosted ChurchApps stack (Api + B1Admin + B1App) — NixOS module and image builds";

  # Deliberately no inputs. This flake produces a NixOS module and a plain
  # attrset of strings, neither of which needs nixpkgs — so consumers add no
  # extra fetch to their evaluation, and there is no lock churn to review.
  outputs = { self }:
    let
      deployment = import ./deployment.nix;
      image = import ./image.nix;

      apiBase = "https://${deployment.domain}${deployment.apiPath}";
    in
    {
      nixosModules.default = import ./modules/b1church.nix;
      nixosModules.b1church = self.nixosModules.default;

      # Consumed by .github/workflows/build.yml via `nix eval --json
      # .#buildArgs`. Keeping these here rather than in the workflow is the
      # point of the exercise: the values baked into the images and the values
      # the module deploys with come from one file.
      buildArgs = {
        # The Api takes all configuration at runtime — no build args.
        api = { };

        admin = {
          REACT_APP_STAGE = "custom";
          REACT_APP_API_BASE = apiBase;
          REACT_APP_CONTENT_ROOT = "${apiBase}/content";
          REACT_APP_MESSAGING_API_SOCKET = "wss://${deployment.domain}${deployment.apiPath}";
          REACT_APP_B1ADMIN_ROOT = "https://${deployment.domain}";
          # "{subdomain}" is a literal placeholder B1Admin substitutes per
          # church at runtime (src/helpers/EnvironmentHelper.ts) — not an
          # interpolation.
          REACT_APP_B1_ROOT = "https://{subdomain}.${deployment.portalBaseDomain}";
        };

        portal = {
          NEXT_PUBLIC_STAGE = "custom";
          NEXT_PUBLIC_API_BASE = apiBase;
          NEXT_PUBLIC_CONTENT_ROOT = "${apiBase}/content";
          NEXT_PUBLIC_MESSAGING_API_SOCKET = "wss://${deployment.domain}${deployment.apiPath}";
          NEXT_PUBLIC_B1ADMIN_ROOT = "https://${deployment.domain}";
        };
      };

      # B1Admin reads REACT_APP_B1_WEBSITE_URL (EnvironmentHelper.ts) but its
      # Dockerfile declares no matching ARG, so --build-arg is silently
      # dropped. The workflow writes these into a .env in the build context
      # instead, where Vite's loadEnv picks them up.
      dotenv.admin = {
        REACT_APP_B1_WEBSITE_URL = "https://{subdomain}.${deployment.portalBaseDomain}";
      };

      inherit deployment image;
    };
}
