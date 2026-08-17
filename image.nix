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
  tag = "u862615486d23";

  upstream = {
    api = "17fccf9809303d5cb0208ab40f23aeb6d78d3572";
    admin = "04cb67408fb41a44f48c9b038dbc65d30c83c5a7";
    portal = "9206416e6004c71c1de3f9ff94888268033b8d60";
  };
}
