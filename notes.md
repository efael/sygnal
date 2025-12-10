# Vanilla way

Vanilla version is not building because pyproject is expecting sort of "vanilla"
approach from developer to maintain instead of poetry or uv and refer to whatever
x2nix for proper support.

### The last crashout

```
> * Getting build dependencies for wheel...
>
> Traceback (most recent call last):
>   File "/nix/store/m3ppxy345vbsincqmc3irvg70gvglmzl-python3.13-pyproject-hooks-1.2.0/lib/python3.13/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
>     raise BackendUnavailable(
>     ...<4 lines>...
>     )
> pyproject_hooks._impl.BackendUnavailable: Cannot import 'poetry.core.masonry.api'
>
> ERROR Backend 'poetry.core.masonry.api' is not available.
```

### Possible solution

For the original element-hq/sygnal project and rewrite it to "vanilla" way of managing dependencies.

# Poetry2nix way

Poetry depends on very outdated nixpkgs. Also, due to the project being deprecated,
hashes and many library references are lacking such as rust reliant dependency hashes.

### The last crashout

```
error: No hash was found while vendoring the git dependency unicode_names2-0.6.0. You can add
a hash through the `outputHashes` argument of `importCargoLock`:

outputHashes = {
  "unicode_names2-0.6.0" = "<hash>";
};

If you use `buildRustPackage`, you can add this attribute to the `cargoLock`
attribute set.
```

### Possible solution

Forking poetry2nix and keeping hashes and whatever signatures up-to-date.
