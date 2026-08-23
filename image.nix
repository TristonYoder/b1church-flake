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
  tag = "u61b2414b1078";

  upstream = {
    api = "977aaed4bac657d534e57ef773ad8a5d1dd0027b";
    admin = "8a23996f8163c20faf04c3e2f69fe9a3f6387831";
    portal = "52049f574239a0331e565a6d0b079260dc9951d1";
  };
}
