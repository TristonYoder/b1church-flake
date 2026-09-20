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
  tag = "u4ea6d3cfac62";

  upstream = {
    api = "879276725548f79fe97c898df758002cb0a3cc4a";
    admin = "27e866ded946ba94e4bb8809e0b1c753a71dff6d";
    portal = "91d207f17f979da202913a651b11e39495615743";
  };
}
