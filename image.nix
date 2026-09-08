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
  tag = "u7ce90ae08812";

  upstream = {
    api = "5c0c7a6601c87bcf2e84720e363a481223157621";
    admin = "8a61d5abcebb1feedd6b917ce93395f764741d9b";
    portal = "99abe2b74492674b4084c946e74fc6e0d7ad2a02";
  };
}
