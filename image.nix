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
  tag = "u1bcf43e2f75e";

  upstream = {
    api = "73757e2e9d133fccdbf12c2628f963b4a25b0b96";
    admin = "2aad6678ecd7675c54f6d0c536abc22ba304c1c1";
    portal = "97b0843df74bf60015ee40aaba4c9b1da4f9c6ba";
  };
}
