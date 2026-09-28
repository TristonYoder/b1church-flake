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
  tag = "u227a2faa82b4";

  upstream = {
    api = "bc28b89b94b23483afbdb1f966473fef01f7a64d";
    admin = "84edb4edc278e7330bf2cd3ee0b16997cbb5af3c";
    portal = "36103a2ac478b12db5e843a4fc2ba622cc5ba68e";
  };
}
