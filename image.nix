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
  tag = "u252d24e7f313";

  upstream = {
    api = "2df94ab8806c577bbce859344f96967425cab2a7";
    admin = "4d2371e282fb08719699de418349b7a0e858aab5";
    portal = "9bd2f38b46667b1f48edad2eb4669819d2dd8ee0";
  };
}
