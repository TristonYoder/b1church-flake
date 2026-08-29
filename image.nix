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
  tag = "ue693b0f6b043";

  upstream = {
    api = "bb471d64f9989330e7ebf4e31c870af83fcb0182";
    admin = "29aac6e7cb211e495f69d8b5d91efbfb4f8e2451";
    portal = "0689f2e01d4d679a87213a72d13cd9dc264b343f";
  };
}
