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
  tag = "u5bd73dcae7dc";

  upstream = {
    api = "79a7347cc5151f734c907a2959487c13acf03039";
    admin = "d676e6d252e4076c0239a98e6acbfc0d68299599";
    portal = "0619fd97194c209c9d0be97eb3f82b61705c14d1";
  };
}
