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
  tag = "u160721c6c5dd";

  upstream = {
    api = "b3dc32cdbf8d6f63588c224eaf6b499dbb32b092";
    admin = "83c88ca5bd9b8a6ae376ad1881fd82d20820d6af";
    portal = "ed00d62cf5d409a5d844332426380e625458ca94";
  };
}
