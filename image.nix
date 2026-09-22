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
  tag = "u32c6549d556e";

  upstream = {
    api = "b00ef98a23d15c646bb553024309391ffb4495d9";
    admin = "e57f6c94b4a0de9a9abccced123c219ab8f558ab";
    portal = "a1cb4fb8ac8e852cc3bfb94edc15be67f3a41bcf";
  };
}
