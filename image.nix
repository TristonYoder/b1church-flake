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
  tag = "u3abdaf9e6ab0";

  upstream = {
    api = "8a4e725dad3c2b385c26ca8e33b245a3cc7de15a";
    admin = "f7ff51b9e407a6073cfa46aff4757f8a66af512c";
    portal = "ed820c22b7b44aa22e05278460e965144f868b0a";
  };
}
