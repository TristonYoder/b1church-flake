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
  tag = "uc1a4cdd2ea8e";

  upstream = {
    api = "574ea653b4592b0b27b6030be0f51d1114a1ed4a";
    admin = "ae23961b9c8c2dcd8985d5cb5c3d74bec5532fb9";
    portal = "6d8a922201d9cab577fcb02fdbbfa8d482bad823";
  };
}
