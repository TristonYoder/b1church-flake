# Single source of truth for the deployment's public URLs.
#
# These are consumed twice, and it is essential they agree:
#   - by .github/workflows/build.yml, which bakes them into the frontend
#     images (Vite and Next inline REACT_APP_* / NEXT_PUBLIC_* at build time —
#     they are NOT read at runtime)
#   - by modules/b1church.nix, as the defaults for `domain` and friends, and
#     as the values the Api is told to stamp into the URLs it returns
#
# Changing anything here requires rebuilding the images. The module asserts
# that the deployed `domain` still matches `builtDomain` so a mismatch fails
# at eval rather than silently producing an admin UI that calls the wrong API.
{
  domain = "b1.plotiphar.com";

  # Member portal sites are served at <church>.<portalBaseDomain>. B1App
  # resolves the tenant from the host / x-site header (its next.config.mjs
  # rewrites), so one container serves every church.
  portalBaseDomain = "b1.plotiphar.com";

  # Path under `domain` where the Api is mounted. The Api is a plain Express
  # monolith mounting /membership, /attendance, /content, /doing, /giving,
  # /messaging and /reporting — all relative — so prefix-stripping is safe,
  # and it makes the API same-origin with the admin UI.
  apiPath = "/api";
}
