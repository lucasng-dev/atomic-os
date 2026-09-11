# Atomic OS

[![Build OS](https://github.com/lucasng-dev/atomic-os/actions/workflows/build.yaml/badge.svg)](https://github.com/lucasng-dev/atomic-os/actions/workflows/build.yaml)

Custom operating system image based on [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) and [BlueBuild](https://github.com/blue-build/template).

## Rebase existing installation _(unsigned)_

```sh
bootc switch ghcr.io/lucasng-dev/atomic-gnome:latest
```

## Rebase existing installation _(signed)_

```sh
bootc switch --enforce-container-sigpolicy ghcr.io/lucasng-dev/atomic-gnome:latest
```

## Build container from local recipe

```sh
bluebuild build recipes/atomic-gnome.yaml
```

## Build ISO from remote image

```sh
bluebuild generate-iso --output-dir isos --iso-name atomic-gnome.iso image ghcr.io/lucasng-dev/atomic-gnome:latest
```

## Build ISO from local recipe

```sh
bluebuild generate-iso --output-dir isos --iso-name atomic-gnome.iso recipe recipes/atomic-gnome.yaml
```
