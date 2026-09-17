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
  tag = "ubd9bd802a381";

  upstream = {
    api = "0794c00ac16121d8c3f7ec8fc1a258c19421c5d0";
    admin = "281e3ba951ea1d2ea6f4d444f75bd8d1ac1514fa";
    portal = "d47816492e363c98319afe1b29d01660e384a67b";
  };
}
