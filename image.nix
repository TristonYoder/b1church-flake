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
  tag = "u6de87c5a1175";

  upstream = {
    api = "e16e6f8002fcbba6cd4dce76d407c17eb5ebd126";
    admin = "9ae3bf3cf7180bc6160e832afa3baf1b06b2a799";
    portal = "31426b0765d0dddf2c17a3ffa90ee38bb0cb0755";
  };
}
