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
  tag = "uaecfda740d83";

  upstream = {
    api = "a82bbe6bd0d22eeaa8af57347d21026ab344b9da";
    admin = "7d74aeeac3e415b7e67b52ee6a3372740f744e12";
    portal = "5ca19ee4ef947235b8ffba9fbb35af42d0dcb41d";
  };
}
