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
  tag = "uc8916612c2bb";

  upstream = {
    api = "f50af24c1fdd575caf1572ed989ed9d7be61946c";
    admin = "b3e2801cf19c0645ce5b756cd692a7bc0d36a732";
    portal = "32b1bd3a3d89ebe952ed082baee9aaac5f59afe4";
  };
}
