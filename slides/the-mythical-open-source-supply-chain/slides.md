---
title: The Mythical Open Source Supply Chain
description: Open source is not a supply chain, what does it mean for us as consumers?
author: Oscar Ahlén
keywords:
  - open_source
  - security
  - sustainability
  - AI
theme: aurora-light
size: 16:9
transition: fade 0.2s
paginate: true
_class: lead
---

# The Mythical Open Source Supply Chain

TODO

part 1 defintion

* questions how uses open source
* "Open source is everywhere" slide
* So what is open source slide?
* Some slide about history?
* How it usually works (communities/licenses etc.)
* Levels of projects, RED Hat/company backed, foundations, smaller communities, one man shows

part 2 - supply chain myth
* "Now this talk is called supply chain myth" slide
* defintion of a real supply chain
  * feels like it could apply here slide ...
* Slide proving the proposition wrong, table comparing the critical differences
* Dig a bit deeper into licenses and obligations/compliance

part 3 - Impact security

* "Now that we have established open source as not a supply chain"
  * how does it affect security, compliance, and sustainability
* security incidents often involve open source components
  * "easy" to check/reason about
  * Used in **a lot** of places
* List some famous attacks, XZ, heartbleed
* Show schematic of security levels/attack surface -> Hardware -> OS -> language -> libraries

part 4 - Impact AI

* "Must talk about AI"
* Why AI is a problem in open source
 * "stealing"
 * DDOS/flooding projects with PRs, splitting/weakening communities
 * Used for exploting/attacking open source infrastructure and components

part 5 what can we do
* slide about how to reason about open source
* what can we do to protect ourselves/our customers as consultants
  * sbom, license management, reduce attack surfaces
* how can we give back to the community?
* Final thoughts

---

<!-- _class: lead -->

# Vem använder Open Source?

---

## Open Source finns överallt

Du använder det varje dag

- Din telefon kör Linux (Android) eller en BSD-baserad kärna (iOS)
- Din bank kör open source databaser och web servrar
- Your car's infotainment system, your router, your smart TV
- The internet itself runs on open source (DNS, HTTP, TLS, BGP…)

**There is no "opting out"**

---

## Agenda

1. What is open source?
2. The "supply chain" framing — and why it's wrong
3. Security: real risks, real incidents
4. AI and open source
5. Maintainer burnout & sustainability
6. What can we all do?

---

<!-- _class: lead -->

# Part 1: What Is Open Source?

---

## Free as in freedom

- Source code is publicly available and modifiable
- Born from the hacker culture of the 60s–70s
- Richard Stallman & the GNU Project (1983): software freedom as a principle
- Linus Torvalds & Linux (1991): pragmatic, collaborative development

> *"Free software is a matter of liberty, not price."*
> — Richard Stallman

---


## How open source works

- Volunteers and companies publish code under permissive licenses
- Anyone can use, study, modify and redistribute
- Contributions happen through pull requests, bug reports, mailing lists
- Governance ranges from a single maintainer to foundations (Apache, Linux Foundation, CNCF…)

> Key point: **it is not a product. It is a gift.**

---

<!-- _class: lead -->

# Part 2: The "Supply Chain" — A Myth

---

## Where did "supply chain" come from?

- Manufacturing analogy: raw materials → factories → finished product
- Applied to software after high-profile incidents (SolarWinds 2020, Log4Shell 2021, XZ Utils 2024)
- Governments and compliance frameworks picked it up: SBOM, EO 14028, CRA…

The framing *feels* intuitive — but it doesn't fit open source

---

## What a real supply chain looks like

| Supply chain | Open source |
|---|---|
| Contractual relationship | Voluntary contribution |
| Warranty & liability | No warranty (read the license!) |
| Quality gates & SLAs | Best-effort, community-driven |
| You pay, they deliver | You take, they gave |

---

## Read the license

Nearly every open source license includes a clause like this:

> *"THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,*
> *EXPRESS OR IMPLIED…"*
> — MIT License

You have no supplier. You have a benefactor.

Calling it a "supply chain" implies obligations that **do not exist**.

---

## Why the framing matters

Treating open source as a supply chain leads to:

- Compliance theatre instead of actual security work
- Pressure on unpaid maintainers to meet enterprise SLAs
- Focus on auditing rather than contributing
- Missing the root cause: **underfunded, overworked humans**

---

<!-- _class: lead -->

# Part 3: Security — Real Risks

---

## Incidents worth knowing

- **Log4Shell (2021)** — Log4j, maintained by a handful of volunteers, used by millions of systems
- **XZ Utils backdoor (2024)** — a patient, multi-year social engineering attack on a single maintainer
- **event-stream (2018)** — malicious code injected after maintainer handed off npm package
- **Polyfill.io (2024)** — CDN domain acquired, scripts weaponised

Common thread: **the humans, not the code**

---

## Linux CVEs: a closer look

Linux has CVEs — lots of them. But context matters:

- Real issues, responsibly disclosed, patched quickly
- The kernel security team responds faster than most commercial vendors
- High CVE count often reflects *better* disclosure culture, not worse code

A proprietary product with fewer CVEs may simply have fewer people looking

---

## The actual attack surface

```
your system
  └── OS packages              ← distro maintains, patches fast
        └── language ecosystem ← ⚠️ high risk
              └── transitive dependencies
                    └── maintained by: 1 person, unpaid  ← ⚠️ very high risk
```

The risk is not the code — it's the **concentration of trust**
in under-resourced people

---

<!-- _class: lead -->

# Part 4: AI and Open Source

---

## AI was trained on open source

- LLMs are trained on billions of lines of open source code
- The models powering Copilot, Cursor, CodeWhisperer… learned from freely given work
- Licensing questions remain largely unresolved

AI companies owe a debt to the commons

---

## AI is now contributing to open source

- AI-generated PRs, issues, and comments are increasing rapidly
- Quality varies wildly; maintainer review burden grows
- Subtle bugs and vulnerabilities can slip through at scale

**More code, same (or fewer) reviewers**

---

## AI-assisted attacks

- Attackers use AI to find vulnerabilities faster
- Synthetic personas for social engineering (XZ-style attacks at scale)
- Automated typosquatting and malicious package generation

The threat model is changing — defences must too

---

<!-- _class: lead -->

# Part 5: Maintainer Burnout & Sustainability

---

## The tragedy of the commons

- Open source is a shared resource
- Everyone extracts value; few contribute back
- Critical infrastructure maintained by individuals on goodwill and spare time

> *"We put a lot of work into this library. If you're using it for profit,*
> *please consider sponsoring us."*
> — README.md, read by no one

---

## What burnout looks like

- Maintainers fielding support requests from Fortune 500 companies — for free
- Security disclosures landing in personal inboxes with days-long SLA demands
- The XZ Utils attacker *exploited* a burned-out maintainer's desperate need for help

This is not a technical problem. It is a **social and economic** one.

---

## Sustainability models (and their limits)

| Model | Examples | Challenge |
|---|---|---|
| Corporate backing | React, Kubernetes, Android | Interests can diverge |
| Foundations | Linux, Apache, Python | Membership fees ≠ maintainer pay |
| Open-core / dual license | Redis, MySQL, MongoDB | Community fractures |
| Donations / sponsorship | curl, many small libs | Rarely enough |

No silver bullet — but doing nothing is the worst option

---

<!-- _class: lead -->

# Part 6: What Can We All Do?

---

## Open source is in everyone's interest

If you use open source (you do), you have a stake in its health

- **Businesses:** cheaper to contribute upstream than to fork and maintain privately
- **Governments:** public money → public code; fund critical infrastructure
- **Developers:** report bugs, review PRs, write docs, answer questions
- **Everyone:** sponsor maintainers (GitHub Sponsors, Open Collective, thanks.dev)

---

## Practical steps

- Audit what you actually depend on — know your critical paths
- Contribute fixes upstream instead of patching locally
- Give maintainers credit, time, and money
- Advocate internally: open source work counts as real work
- Support policy that funds open source (Sovereign Tech Fund, NLnet…)

---

## Reframe the conversation

| Instead of… | Say… |
|---|---|
| "Supply chain risk" | "Dependency health" |
| "Vendor compliance" | "Community investment" |
| "SBOM audit" | "Know what you owe" |
| "Patch SLA" | "Fund the maintainer" |

---

<!-- _class: lead -->

# There is no supply chain.

# There is only the commons —

# and we all live here.

---
