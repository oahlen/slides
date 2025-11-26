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

# Do you want to build a snowflake?

---

# Flakes

* Effort to modernize nix projects with better tooling
* Provides well defined entrypoints for programs and tools
* Allows pinning of dependencies

---

# Home-Manager

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

---
