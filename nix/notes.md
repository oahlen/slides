# Nix

"It works on my machine" är en känd fras/problemställning med många försök till lösningar.
Nix tar en väldigt unik väg för att lösa detta problem från grunden med många oväntade tillämpningsområden. Säg adjö till dev containers, dotfiles och inkompatibla systembibliotek!

I denna presentation går vi igenom NIx på en hög nivå och hur man skulle kunna komma igång att använda det i sitt dagliga arbete.

## Selling points
* cross platform package manager
* A package manager, a distribution and a language
* reproducible, atomic, rollbacks



## Nix language

* Lazy
* Functional (Haskell like)

# FHS
Lends itself poorly for reproducibility

* /lib/libudev.so ... bad
* /lib/libudev.so.1.6.3 ... better but many unknowns like build flags

## Docker
* 2 people using the same docker image => same results
* 2 people building the same Dockerfile => (often) different results

For every package that Nix builds, it first computes its derivation (this is usually done by evaluating expressions written in Nix language), a file that contains:

* mentions of all the files and other packages that will be required during the build
* build instructions for actually building the package,
* some metainformation about the package,
* most crucially, a store path (prefix) under which the package will be installed, which is of the form /nix/store/<hash>-<name>-<version> (hence the name store path), where hash is a hash of all the other data in the derivation.

Then, it realises that derivation by running build instructions specified in it inside an isolated environment containing the dependencies and only the dependencies of the package.

This way, Nix can guarantee some really important properties:

* Realising the same derivation will always get almost the same output since the build commands only have access to the explicitly specified dependencies. (The output can differ if the build instruction uses some hardware-dependent information, such as current time, /dev/urandom, or CPU performance)
* The same store path (/nix/store/<hash>-<name>-<version>) will always contain the result of exactly the same commands, since <hash> depends on all the variables that are at play while building said package.

Pros:
* reproducibility
* Binary caching, hash can be calculated beforehand
* Multiple version simultaniosuly
* Isolated builds => non-privieleged builds
* Small footprint/backups

# NixOs
* Distribution built upon nix package manager
* Uses nix as both a package and configuration manager


# Nixpkgs
* 80 000 pkgs


grahamc.com/blog/nix-and-layered-docker-images
