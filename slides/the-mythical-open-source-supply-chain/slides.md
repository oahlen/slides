---
title: The Mythical Open Source Supply Chain
description: Open source is not a supply chain, what does it mean for us as consumers?
author: Oscar Ahlén
keywords:
  - open_source
  - security
  - sustainability
  - AI
theme: aurora-dark
size: 16:9
transition: fade 0.2s
paginate: true
_class: lead
style: |
  section.bg-title h1 {
    display: inline-block;
    color: #fff;
    background: rgba(0, 0, 0, 0.8);
    padding: 0.2em 0.5em;
    border-radius: 0.2em;
    text-shadow: 0 2px 6px rgba(0, 0, 0, 0.8);
  }
---

<!-- _class: lead bg-title -->

# The Mythical Open Source Supply Chain

![bg](assets/images/crates.jpg)

---

<!-- _class: lead -->

<!-- Part 1 - Open Source Defintion -->

# Vem använder Open Source?

---

## Open Source finns överallt

Du använder det varje dag

* Din telefon kör Linux (Android) eller en BSD-baserad kärna (iOS)
* Tjänster du använder kör open source databaser och web servrar
* Dina moderna prylar kör open source, Bilar, smart-TV, wearables
* Internets fundament bygger på det: (DNS, HTTP, TLS, etc.)

<!-- We as consultants use it in our daily job -->

---

<!-- _class: lead -->

<style scoped>
p {
  font-size: 1.5em;
}
</style>

**There is no "opting out"**

<!-- Open Source is the de facto standard for building modern systems -->

---

![bg 40%](assets/images/modern-infrastructure.png)

<!-- Classic from XKCD -->

---

## Defintion

Med Open Source står det dig *fritt* att:

* Använda mjukvara oavsett syfte
* Undersöka mjukvaras källkod
* Ändra mjukvarans källkod
* Paketera om eller distribuera mjukvaran

---

<!-- _class: lead -->

> Free as in speech ... not beer

---

<!-- _class: lead -->

## Software is built by Communities

> A group of people sharing the same goals, ideas or values

---

## Motivation

* Svårt (omöjligt) att bygga allt själv
* Lättare att bygga och underhålla något tillsammans
* Man vill bidra eller göra ekosystemet Lättare
* Personliga anledningar - Det är roligt

<!-- Might be considered strange by some -->

---

## Hur fungerar det?

* Frivilla och företag publiserar kod med "permissive licenses"
* Alla kan använda, studera och ändra källkoden
* Bidrag sker genom pull requests, buggrapporter och diskussioner
* Styrning - Allt från one man shows till stiftelser

---

## Organisation

| Modell | Exempel | Utmaningar |
|---|---|---|
| Corporate backed | Kubernetes | Intressekonflikter |
| Stiftelser | Linux, Apache | Kostnader / Ekonomi |
| Multi-licens | Redis, MongoDB | Splittring |
| Donationer / sponsring | curl | Burnout |

---

## Läs licenstexten ...

```
MIT License

Copyright (c) 2026 John Open Source

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions ...
```

---

## Vilken licens gäller?

![bg 80%](assets/images/licenses.jpg)

<!-- License types -->

---

<!-- _class: lead bg-title -->

# The Supply Chain Myth

![bg 100%](assets/images/containers.jpg)

---

## Leveranskedja

* Naturligt språk när vi pratar om tillverkning
* Känns intuitivt att applicera på mjukvara
* Ett vanligare språkbruk efter kända incidenter/säkerhetshål
* Passar bra in på hur företag och myndigheter benämner beroenden

---

## Missförståndet

```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

<!-- _class: lead -->

Du har ingen levernatör men kanske en **välgörare**

*Supply Chain* implicerar förpiktelser som inte existerar

---

## Jämförelse

| Supply chain | Open source |
|---|---|
| Kontraktsbaserat | Frivilligt bidrag |
| Garanti och SLA | - |
| Kvalitetskontroll | Best-effort, god vilja |
| Jag betalar, du levererar | Jag tar, du ger |


<!-- Risk för compliance theater -->
<!-- Onödigt stress på obetalda utvecklare -->
<!-- Viktigare med audits än att bidra och förbättra -->
<!-- Försämrar open source som helhet -->

---

<!-- Part 3 - Security Perspective -->

<!-- _class: lead bg-title -->

# Open Source och Säkerhet

![bg](assets/images/security.jpg)

---

## Incidenter

* **Heart Bleed (2014)** - Bugg i TLS; angripare kunde exfiltera information ur webservrar
* **Log4Shell (2021)** - Log4j; remote code execution genom populärt loggramverk
* **XZ Utils Backdoor (2024)** - Social engineering attack mot en utbränd maintainer
* Inte alltid uppenbart att du som användare är exponerad.

---

## Ska man orora sig?

* I större open source projekt tas säkerhet generellt seriöst
* Lång CVE-lista ofta ett tecken på transparens/genomögad kod
* Linux - korta ledtider för patching; bättre än många kommerciella aktörer
* ... men allt är en fråga om resurser

<!-- A proprietary product with fewer CVEs may simply have fewer people looking -->

---

![bg 25%](assets/images/layers.png)

---

<!-- Part 4 - AI and Open Source -->

<!-- _class: lead bg-title -->

# Open Source och AI

![bg](assets/images/ai.jpg)

---

## AI och Open Source

* LLMs har tränats till stor del på öppen källkod
* AI-företag har gjort stora vinster på allmänhetens arbete
* Vad säger egentligen licenserna om det här?
* AI bidrar nu aktivt till öppna källkodsprojekt

---

## Risker

* AI duktig på att hitta sårbarheter
  * Fördel angripare ...
* Mer kod, lika många eller färre reviewers
* Slop PRs - Ökad press på maintainers
* AI kan generera kod - sämre på att bygga långsiktighet/förtroende
* Communities kommer behöva tänka om i en AI-centrerad värld

---

![bg 40%](assets/images/modern-infrastructure-2.png)

---

<!-- Part 5 - What can we do? -->

<!-- _class: lead bg-title -->

# Vad kan vi göra?

![bg](assets/images/typing.jpg)

---

<!-- _class: lead -->

Utvecklartid är en **värdefull** resurs

---

## "The tragedy of the commons"

* Open source är en gemensam resurs
* Många får ut värde, få bidrar tillbaka
* Kritiska infrastruktur förvaltas genom goodwill på fritiden

---

## What burnout looks like

- Maintainers fielding support requests from Fortune 500 companies — for free
- Security disclosures landing in personal inboxes with days-long SLA demands
- The XZ Utils attacker *exploited* a burned-out maintainer's desperate need for help

This is not a technical problem. It is a **social and economic** one.

---

---

## Vad kan vi göra?

* Förstå problematiken
* Skapa förståelse för de open source beroenden du/kunden har
* Väg riskerna mot fördelarna med open source beroendekedjor
* Bidra tillbaka kod istället för att patcha lokalt, ge credit
* Bidra med tid/pengar (Sovereign Tech Fund)

---

## Ligger i allas intresse

* Billigare och bättre att bygga saker tillsammans
* Offentlig sektor: publika medel → publik kod
* Digital suveränitet omöjligt eller mycket svårt utan

---
