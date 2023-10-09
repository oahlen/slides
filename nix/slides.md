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
* Bloated, works in layers, not sofware features
* Requires internet access

<!-- Build commands in Dockerfiles end up as metadata in the resulting image -->

---

# Reproducible?
* 2 people using the same docker image => same results
* 2 people building the same Dockerfile => (very often) different results

---

![bg 50%](nixos-original.svg)

---

# Nix - package manager
* Cross platform (*nix, MacOS)
* 

---

![bg 80%](user-environments.png)

---

# Nix - language
* Functional and pure
* Lazy
* Declarative
* Domain specific

<!-- Domain specific but turing complete, not a suitable as a general purpose language -->

---

# Basic python dev shell

```nix
{ pkgs ? import <nixpkgs> {}
}:
pkgs.mkShell {
  name="dev-environment";
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

