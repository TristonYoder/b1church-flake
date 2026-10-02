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
  tag = "u7ad122d00351";

  upstream = {
    api = "6a6d521e1139fbe2ee6b6980f8007969f4027906";
    admin = "47464f27c03df41081cc311878367d88ef76a964";
    portal = "5ee43132ea080f371975dfb18607625374f90506";
  };
}
