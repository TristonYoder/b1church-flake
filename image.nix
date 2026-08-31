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
  tag = "u60ac37072e58";

  upstream = {
    api = "3763c32f97b1c4836ea284d2df95ed181d80c0ee";
    admin = "86c10f31ea20f8519b8a2d5d340bad7f4864ba0c";
    portal = "46ed8f859f5c27c98b19b608b4df5b44a756a2cb";
  };
}
