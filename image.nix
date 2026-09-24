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
  tag = "u3ade87a76ffe";

  upstream = {
    api = "1f081470474c6a046abd23c067154b421577f439";
    admin = "7293b277c985efdf6d0e5bae17a37a1830391403";
    portal = "9768bfd6aff89117f35ffba26b15d690430dd39c";
  };
}
