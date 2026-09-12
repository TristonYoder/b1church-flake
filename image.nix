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
  tag = "u817a511b5720";

  upstream = {
    api = "f293dd9ae114850baa0015f83e213e4dbd3fe127";
    admin = "035cb654dba29dba3ae70a7c6443acea1f966052";
    portal = "86cd6ff9a96e9f3222f43b2e93c4447ebc695b54";
  };
}
