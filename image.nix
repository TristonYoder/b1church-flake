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
  tag = "u0a09fafba793";

  upstream = {
    api = "a93bf82470969d4ffe44fe638461503fee4c5ae9";
    admin = "20a5077c65f65bf7b805c1f48a875ff76ba3c434";
    portal = "dfe3139a66d2e7e920bed1c3c9f4bd404c9341de";
  };
}
