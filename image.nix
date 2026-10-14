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
  tag = "u50de98361628";

  upstream = {
    api = "c674cc476aa43827977dafeada086e9d5664b6c0";
    admin = "d676e6d252e4076c0239a98e6acbfc0d68299599";
    portal = "0619fd97194c209c9d0be97eb3f82b61705c14d1";
  };
}
