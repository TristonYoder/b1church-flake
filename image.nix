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
  tag = "u8af7bd2fca7f";

  upstream = {
    api = "648610cf0d6ecfe03c82fec11f38d8793cb46871";
    admin = "7cbacbbdb860bfa6ec33097b6664272a59cd51b7";
    portal = "33d9408689f2f56a3a769c37ee4e1cdda419a3f1";
  };
}
