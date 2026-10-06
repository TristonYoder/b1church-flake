# Written by .github/workflows/build.yml — do not edit by hand.
#
# The nightly build publishes tagged images and commits the tag here,
# so this repo's git revision *is* the deployed version: consumers pin
# it through flake.lock and upgrade with `nix flake update b1church`.
#
# The tag is derived from the three upstream commits below, so it only
# changes when upstream does.
{
  registry = "ghcr.io/tristonyoder/b1church";
  tag = "u2489bea17ec8";

  upstream = {
    api = "7e9cdd385408bd7b01fc6cb8328f1d0263860177";
    admin = "b93531c614c6a94c085960a280c27f5f2d9687db";
    portal = "da7486a493d82808fee4db0100f9422761125a78";
  };
}
