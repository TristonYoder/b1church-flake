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
  tag = "ua0e11e37275c";

  upstream = {
    api = "42142701816558edf2bf4d42dd873c7493a076cf";
    admin = "9ab0913fc1eecab2722e039feaf1fdd0a02c3fdc";
    portal = "9a887a976b75620750a93c75630893556d936965";
  };
}
