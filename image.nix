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
  tag = "u9f0d558db0f2";

  upstream = {
    api = "ee2be179208d347c73c2e5091cd628c92e67a566";
    admin = "f935a6f3774712884dcb1d3903b3e1e7494c6a48";
    portal = "5d69dc3e6c45dcece94b043fce3a685a934ae24a";
  };
}
