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
  tag = "u52947fcd8c71";

  upstream = {
    api = "5a3384cda0d182794e3c93be013f4f9b21cac4f6";
    admin = "fe195d236a361fece5b07940d8129c5e6e8b089c";
    portal = "31426b0765d0dddf2c17a3ffa90ee38bb0cb0755";
  };
}
