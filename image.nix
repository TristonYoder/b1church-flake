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
  tag = "u6af7892fa63a";

  upstream = {
    api = "8a4e725dad3c2b385c26ca8e33b245a3cc7de15a";
    admin = "5f260376dd99a57cd8fd8a58e4fbe8d274a6bed7";
    portal = "2d82ff65d6d584135bf42834401ef2599e101979";
  };
}
