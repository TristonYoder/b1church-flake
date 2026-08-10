# Written by .github/workflows/build.yml — do not edit by hand.
#
# The nightly build publishes SHA-tagged images and commits the tag here, so
# this repo's git revision *is* the deployed version: consumers pin it through
# flake.lock and upgrade with `nix flake update b1church`.
#
# `tag = null` means no build has published yet; the module refuses to
# evaluate rather than deploying a tag no registry serves.
{
  registry = "ghcr.io/tristonyoder/b1church";
  tag = null;

  # Upstream commits the above tag was built from, for provenance.
  upstream = {
    api = null;
    admin = null;
    portal = null;
  };
}
