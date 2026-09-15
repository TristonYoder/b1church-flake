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
  tag = "u127201440f4a";

  upstream = {
    api = "4771a02f3a666857642deee6103bd6230c94b65f";
    admin = "c46a0c9084533f653106ef9cd45fbd46801e5b73";
    portal = "e51a45636c9686e14f96a6564a3b38c9084e8eb1";
  };
}
