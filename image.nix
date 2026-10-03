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
  tag = "ub7d10de2d59a";

  upstream = {
    api = "7cf7c54be2b0cf8bd8bb560b9d3ee6c6701e9cdc";
    admin = "f4ff489d6fad9850f24e2269d3b54966f06b3c4b";
    portal = "5ee43132ea080f371975dfb18607625374f90506";
  };
}
