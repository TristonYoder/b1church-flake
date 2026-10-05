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
  tag = "ub96b5a356c37";

  upstream = {
    api = "15005da08299ec261877f4fc150d83c835475f84";
    admin = "3157bff3cce2811ad305fe2c8fb9887e4d71909d";
    portal = "54d0e909a83482bbc1d81b7dd25879b5e13d536d";
  };
}
