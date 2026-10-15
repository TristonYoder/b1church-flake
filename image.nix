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
  tag = "uec4ef98ec323";

  upstream = {
    api = "42aa718a44313c710b11ae61b35acace7679362f";
    admin = "b899c8fdde7e5a9f0dacfe61680176e419f158f9";
    portal = "835656706836e6b65aa5da1aa2cfaea0e5cbd647";
  };
}
