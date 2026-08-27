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
  tag = "ubea23f337014";

  upstream = {
    api = "ed749471cc7588f65a63d2941d7ad69ec3b38189";
    admin = "3bf8e8aec0dd324a2b852fef2cd9f8418472fba8";
    portal = "b3ef17260f1d7b8afa21e4da945c6e2d3113879f";
  };
}
