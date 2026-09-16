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
  tag = "u2db7ec232008";

  upstream = {
    api = "42e94317bcc33e3464652cbbbfdeaf874eba545f";
    admin = "c3bfd73fc1eb7a84cacbc1683a8e5252872ed303";
    portal = "a868fc49a204f7748d7aa641fe624f9a8a46c99f";
  };
}
