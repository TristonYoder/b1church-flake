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
  tag = "u2d34835a982e";

  upstream = {
    api = "190096b3dbdca399c44e1325f2111b8f79189c26";
    admin = "04846fba17b428f90ac895835af625f327181c21";
    portal = "4e3104bb1142ce264a82412a08d4ba91407c0ae4";
  };
}
