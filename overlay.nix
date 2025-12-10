final: prev: {
  # assigning within python3Packages broke the whole set
  # so using parent typical unknown set approach out of no choice
  jaeger-client = prev.callPackage ./deps/jaeger-client.nix {};
  opentracing = prev.callPackage ./deps/opentracing.nix {};
}
