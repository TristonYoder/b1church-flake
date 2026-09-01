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
  tag = "u3b1518a271de";

  upstream = {
    api = "b43765b39876499220203cb302d3cbafe4aec837";
    admin = "28288db6ef616d52adfd6427d05184e0f5676edb";
    portal = "e533b0e66e28c9c7ae6d5235e9c987c44a7cc64e";
  };
}
