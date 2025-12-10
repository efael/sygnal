{
  # lib,
  # buildPythonPackage,
  # fetchPypi,
  # pythonAtLeast,
  # isPy27,
  # futures ? null,
  # gevent,
  # mock,
  # pytestCheckHook,
  # tornado,
  # six,
  pkgs,
}:
pkgs.python3Packages.buildPythonPackage rec {
  pname = "opentracing";
  version = "2.4.0";
  format = "setuptools";

  # incompatible with asyncio changes in 3.11 and deprecated
  # https://github.com/opentracing/specification/issues/163
  # disabled = pkgs.python3.pythonAtLeast "3.11";

  doCheck = false;

  src = pkgs.fetchPypi {
    inherit pname version;
    sha256 = "a173117e6ef580d55874734d1fa7ecb6f3655160b8b8974a2a1e98e5ec9c840d";
  };

  # propagatedBuildInputs = pkgs.lib.optional pkgs.python2.isPy27 pkgs.python2Packages.futures;

  nativeCheckInputs = with pkgs.python3Packages; [
    gevent
    mock
    pytestCheckHook
    six
    tornado
  ];

  meta = with pkgs.lib; {
    homepage = "https://github.com/opentracing/opentracing-python";
    description = "Platform API for OpenTracing";
    license = licenses.asl20;
    maintainers = with maintainers; [rakesh4g];
  };
}
