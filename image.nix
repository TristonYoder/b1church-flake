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
  tag = "ub2af281d04f4";

  upstream = {
    api = "e92b9aaa8b2a398afd87119edfb394157e888dda";
    admin = "f00a7a2811da7ef931a2c5f98df9ed02c89e7e2a";
    portal = "1c7af703b1d32eac8964b35b06bb27621906f26d";
  };
}
