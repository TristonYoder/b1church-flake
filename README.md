# b1church-flake

Self-hosted [ChurchApps](https://github.com/ChurchApps) stack for `b1.plotiphar.com` —
container builds and the NixOS module that deploys them, in one repo so the two
can't disagree.

Nothing here is forked. The nightly workflow resolves upstream `main`, builds,
and publishes.

**The images are not Nix-built.** Despite the repo name, all three are built
from upstream's own `Dockerfile`s (`FROM node:22-slim`, Debian + yarn) with
buildx. Nix here is the deployment module plus `nix eval` supplying build args
— it is not in the containers. Packaging these as Nix derivations would mean
repackaging yarn 4 / Vite / Next toolchains and rebreaking on every upstream
dependency bump, which defeats tracking `main`.

| Image | Upstream | Role |
|---|---|---|
| `ghcr.io/tristonyoder/b1church-api` | `ChurchApps/Api` | Express modular monolith, port 8084 |
| `ghcr.io/tristonyoder/b1church-admin` | `ChurchApps/B1Admin` | Vite SPA, staff admin UI |
| `ghcr.io/tristonyoder/b1church-portal` | `ChurchApps/B1App` | Next.js member portal, multi-tenant |

## How versioning works

`.github/workflows/build.yml` runs nightly, derives one tag from the three
upstream commit SHAs, and commits it to [`image.nix`](image.nix). **This repo's
git revision is the deployed version** — consumers pin it via `flake.lock` and
upgrade with `nix flake update b1church`.

Because the tag is a function of the upstream SHAs, a night where nothing
changed upstream produces the same tag and the run exits early. Lock churn
tracks real upstream change, not the calendar.

`image.tag = null` (the initial state) makes the module refuse to evaluate
rather than deploy a tag no registry serves.

## Build-time URLs

The two frontends are **not** runtime-configurable — Vite and Next inline
`REACT_APP_*` / `NEXT_PUBLIC_*` during `build`. [`deployment.nix`](deployment.nix)
is the single source of truth: the workflow reads it via `nix eval .#buildArgs`
and the NixOS module reads it for its defaults, so a change can't reach one and
miss the other. The module additionally asserts that the deployed `domain`
still matches what the images were built for.

Changing `deployment.nix` therefore requires a rebuild, not just a switch.

One upstream gap is patched here: B1Admin reads `REACT_APP_B1_WEBSITE_URL` in
`src/helpers/EnvironmentHelper.ts`, but its `Dockerfile` declares no matching
`ARG`, so a `--build-arg` is silently dropped. The workflow writes it into a
`.env` in the build context, where Vite's `loadEnv` picks it up. Without that,
the admin UI links members at `staging.b1.church`.

## Consuming it

```nix
# flake.nix
inputs.b1church.url = "github:TristonYoder/b1church-flake";

# host modules
b1church.nixosModules.default
```

```nix
services.b1church = {
  enable = true;
  dbSecretFile = config.age.secrets.b1church-db-secrets.path;
  apiSecretFile = config.age.secrets.b1church-api-secrets.path;
  dataDir = "/data/docker-appdata/b1church";
};
```

The module stops at the containers, publishing them on loopback ports
(`apiPort`, `adminPort`, `portalPort`). Reverse proxying, TLS and DNS are the
consumer's job — that's what keeps this flake evaluable on its own. The Api
must be served under `services.b1church.apiPath` (read-only; it's baked into
the images) with the prefix stripped.

## Operating notes

- **First registration becomes server admin**, and registration stays open
  afterwards. Register immediately once the hostname is publicly routable.
- **Mail is off by default.** The Api treats an unset `MAIL_SYSTEM` as an
  explicit "no mail provider" and reports it via server health; registration
  works, password resets and invites go nowhere. Set `smtp.enable` plus
  `SMTP_USER`/`SMTP_PASS` in the api secret file to turn it on.
- **`ENCRYPTION_KEY` is permanent** once the stack holds data — changing it
  makes existing encrypted columns unreadable.
- **The MySQL password must be URL-safe.** It's substituted into `mysql://`
  URLs; anything needing percent-encoding corrupts all eight connection
  strings.
