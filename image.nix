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
  tag = "u85aecb154245";

  upstream = {
    api = "7215724de0f539563a60083b55fe7649bc1d1042";
    admin = "41830ee10002bb7351fe33607adb87e9c572a1da";
    portal = "8389b24bfd1d37af0096ab0b45d7b67783c15fb9";
  };
}
