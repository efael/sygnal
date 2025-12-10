final: prev: {
  jaeger-client = prev.callPackage ./deps/jaeger-client.nix {};
  opentracing = prev.callPackage ./deps/opentracing.nix {};
}
