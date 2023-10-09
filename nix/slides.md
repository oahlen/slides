---
title: Deterministiska byggen med Nix
description: TBD
author: Oscar Ahlén
keywords: nix
theme: default
_class: lead
paginate: true
size: 16:9
---

# Deterministiska byggen med Nix

How I learned to love the dev shell 🤘

---

![bg 50%](my_machine.jpg)

---

# Dev containers
* Containerize development evironment, packages, environment variables, etc.
* Every developer (preferrably) uses the exakt same packages
* Documentation for setting up dev environment always up to date
  * Fast onboarding of new devs

---
![bg left:40% 80%](docker.svg)

# Docker? (for image builds)
* Security, hard to verify actual contents
* Performance, poor use of caching
* Bloated, works in layers, not software features
* Requires internet access
  * No hermetic builds ... more on that later ...

<!-- Build commands in Dockerfiles end up as metadata in the resulting image -->

---

# Reproducible?
* 2 people using the same docker image => same results
* 2 people building the same Dockerfile => (very often) different results
* Non dev container scenarios even worse
  * Different distros, slight differences in libraries/build flags etc.

---


# Nix - tool

![bg left:40% 80%](nixos-original.svg)

* Cross platform reproducbile package manager and build system
  * (*nix, MacOS, WSL)
* PhD thesis project by Eelco Dolsta (2006)
  * First stable release in 2012
* Atomic + efficient rollbacks
---

# Nix - language
* Functional and pure
* Lazy
* Declarative
* Domain specific

<!-- Domain specific but turing complete, not a suitable as a general purpose language -->

---

# NixOS - distribution
* Full GNU/Linux distribution implemented by nix
* MSc thesis project by Armijn Hemel (2006)
* Uses nix as both a package and configuration manager
* Fully leverages the nixpkgs monorepo ...

---

![bg 75%](nixpkgs.png)

---

# How does it work?!

---

![bg 80%](fhs.png)

---

# FHS
* Lends itself poorly for reproducibility:
  * /lib/libudev.so ... bad
  * /lib/libudev.so.1.6.3 ... better but many unkowns like build flags
  * What if we want different versions of the same library?

---

# Nix build process
* Compute a package derivation based on some nix expression ex `default.nix`. This file includes:
  * mentions of all the files and other packages that will be required during the build
  * build instructions for actually building the package,
  * some metainformation about the package,
  * a store path (prefix) under which the package will be installed
    * /nix/store/<hash>-<name>-<version>
    * ex. **/nix/store/d29dgx2kc94dlq8h85phzlx01x7ajhjv-firefox-118.0.1**/bin/firefox

<!-- 160 bit hash used for path (32 chars) -->
<!-- derivation + all inputs determines the hash, secret sauce in caching -->
<!-- Memory safety paradigm for the file system -->

---

![bg 100%](nix-expression.png)

---
```nix
{
  pkgs,
  nuget-packageslock2nix,
}:
pkgs.buildDotnetModule {
  pname = "dotnetapp";
  version = "1.0.0";

  projectFile = "DotnetApp.csproj";
  nugetDeps = nuget-packageslock2nix.lib {
    system = "x86_64-linux";
    name = "dotnetapp";
    lockfiles = [
      ./packages.lock.json
    ];
  };

  src = ./.;

  dotnet-sdk = pkgs.dotnetCorePackages.sdk_7_0;
  dotnet-runtime = pkgs.dotnetCorePackages.aspnetcore_7_0;
  selfContainedBuild = false;

  useDotnetFromEnv = true;

  meta = with pkgs.lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}
```

---

![bg 100%](nix-instantiate.png)

---

# Nix store

---

![bg 25%](nix-store-1.png)

---

![bg 80%](user-environments.png)

---

# Pros
* reproducibility ... duh
* Binary caching, hash can be calculated beforehand
* Multiple version simultaniosuly
* Isolated builds => non-privieleged builds
* Small footprint/backups

---

![bg 80%](charlie.jpg)

---

# Basic python dev shell

```nix
{ pkgs ? import <nixpkgs> {}
}:
pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python3Packages.virtualenv
    pkgs.nodejs
    pkgs.yarn
  ];
}
```

---

# Cons?
* Steep learning curve
  * New toolchain
  * New language
* Many existing tools/projects may not be suitable for reproducibility in current form
* Documentation (organization) could be better
* Powerful tool, but more powerful if everyone in a team uses it

---

![bg 30%](rabbit_hole.jpg)

