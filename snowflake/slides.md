---
title: Do you want to build a snowflake?
description: TBD
author: Oscar Ahlén
keywords: nix
theme: default
class: invert
paginate: true
size: 16:9
---

# Do you want to build a snow(flake)?

The road to a better dev environment

---

![bg 100%](my_machine.jpg)

---

![bg left:40% 80%](want.webp)

# What do we want?

* Access to as many (up to date) packages/SDKs/toolchains as possible
* Have a way of restoring the exact same package state on multiple machines
  * Including config/env variables
* Way of keeping inventory of what we use
  * Both a resource and security concern
Using as few tools as possible ...

---

# Dev containers

* Containerize development environment, packages, environment variables, etc.
* Every developer (preferably) uses the exact same packages
* Documentation for setting up dev environment always up to date
  * Fast onboarding of new devs

---

![bg left:40% 80%](docker.svg)

# Docker? (for image builds)

* Security, hard to verify actual contents
* Performance, poor use of caching
* Bloated: works in layers, not software features
* Requires internet access to work

<!-- Poor software bill of materials -->
<!-- Caching, Nix does a much better job -->
<!-- Build commands in Dockerfiles end up as metadata in the resulting image -->

---

# Reproducible?

```dockerfile
FROM ubuntu

RUN set -eux;
	apt-get update;
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
	; \
	rm -rf /var/lib/apt/lists/*

COPY . /app

CMD /app/app
```

<!-- ubuntu what? -->
<!-- Chain commands to follow best practices -->
<!-- apt-get is non determenistic/temporal -->
<!-- How is app even built and what version/packages was used?  -->

---

# Reproducible?

```dockerfile
FROM ubuntu # Ubuntu what exactly?

RUN set -eux;
	apt-get update; # apt-get is non determenistic and temporal
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
	; \
	rm -rf /var/lib/apt/lists/* # Cleaning up our garbage I see

COPY . /app # What environment even built this???

CMD /app/app
```

---

![bg left:30% 80%](thinking.png)

# Reproducible?

* 2 people using the same docker image => same results
* 2 people building the same Dockerfile => (very often) different results
* Non dev container scenarios even worse
  * Different distros, slight differences in libraries/build flags etc.

---

# Nix

![bg left:40% 80%](nixos.svg)

* Cross platform reproducible package manager and build system
* PhD thesis project by Eelco Dolsta (2006)

---

![bg left:40% 80%](nixos.svg)

# Works on

* *nix like operating systems
* WSL
* MacOS
* NixOS - distro built entirely on Nix

---

![bg left:40% 80%](nixos.svg)

# Features

* Concurrent and isolated installations of software
* Atomic upgrades
* Rollbacks

---

![bg 60%](trinity.avif)

---

# Nix is a programming language

```nix
  fib = n:
    let
      acc = a: b: i:
        if i == n then a else acc b (a + b) (i + 1);
    in
    if n < 2 then n else acc 0 1 0;
```

---

![bg 75%](nixpkgs.png)

---

![bg left:35% 80%](bash.png)

# Development shells

* The Nix answer to dev containers
* Clever use of env variables and symlinks contruct the exact desired environment
* Can be likened to starting a shell ... like bash for example

---

![bg left:25% 80%](lambda.svg)

# Flakes

* Effort to modernize nix projects with better tooling
* Provides well defined entrypoints for programs and tools
* Allows pinning of dependencies
* Essentially a function taking inputs and producing outputs

---

# Basic flake

``` nix
{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    {
      packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
      packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    };
}
```

---

# Flake projects

* Zed Editor
* Helix Editor
* opencode
* Polars
* rust-analyzer
* Cosmic Desktop
* Hyprland
* zoxide

---

# Home-Manager

* System for generating NixOS like configuration on generic Linux distributions

---

![bg 75%](charlie.jpg)

---

# The good

* Fully determenistic and reproducible software
  * No hidden gotchas
* Cross platform package manager
* Portable development environments
* Rollbacks, easy to revert since software is described as code

---

# The not so good

* Steep learning curve
* Documentation (organization) could be better
* Sometimes hard to migrate software builds to determenistic behavior

---

# Let's begin

https://github.com/oahlen/snowflake
