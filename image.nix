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
  tag = "u117bfe540323";

  upstream = {
    api = "f0ee29c1ebbbeae2c7e29a9347e62f68c86c5ef2";
    admin = "990c1827d81b0778d2ceca274c6c828f4a9e3487";
    portal = "25c9eda889c4625b3328ab55aad134cc7b52ca92";
  };
}
