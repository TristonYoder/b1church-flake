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
  tag = "ua62fbcce9747";

  upstream = {
    api = "bbc45bed65cf9a5d55feea586b2beb4e65226e7d";
    admin = "b335cbe97e8e4e304ab05597174f074c3c9e933d";
    portal = "36551d0a99cd9aabf6404cf8bbce554a1993c679";
  };
}
