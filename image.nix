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
  tag = "u60f440b2a8ab";

  upstream = {
    api = "dac971106ee0e90f823a115b061b83e885909ff0";
    admin = "2b60488b7197b36c2919e56da15591cc6614af5c";
    portal = "151cf39336d19657367ac54c13c88bc3291df812";
  };
}
