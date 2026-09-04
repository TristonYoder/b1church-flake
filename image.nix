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
  tag = "uc5b5d4fe9ec0";

  upstream = {
    api = "05d3376a3745f272efe4cd1993508d1303b660ae";
    admin = "37b399ad32e3e38e9654c807835770e07a49e753";
    portal = "10e87834159f4174a3eb83db98161fa000332af7";
  };
}
