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
  tag = "u9361e35b20df";

  upstream = {
    api = "8a4e725dad3c2b385c26ca8e33b245a3cc7de15a";
    admin = "d7461088c205753fe7a257c6f2d2e78ed7690e85";
    portal = "2d82ff65d6d584135bf42834401ef2599e101979";
  };
}
