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
  .img-left {
    display: flex;
    align-items: center;
    gap: 1.5em;
  }
---

<!-- _class: lead bg-title -->

# The Mythical Open Source Supply Chain

![bg](assets/images/crates.jpg)

<!-- Tycker det är en viktig fråga -->
<!-- Open source ligger mig närmt om hjärtat -->

---

<!-- _class: lead -->

<!-- Part 1 - Open Source Definition -->

# Vem använder Open Source?

---

<div class="img-left">

![w:250](assets/images/globe.svg)

<div>

## Open Source finns överallt

Du använder det varje dag

* Din telefon kör Linux (Android) eller en BSD-baserad kärna (iOS)
* Tjänster du använder kör open source databaser och webbservrar
* Bilar, smart-TV:ar och wearables kör open source
* Internets fundament bygger på det: (DNS, HTTP, TLS, etc.)

</div>

</div>

---

## Oss konsulter

Vi möter det i princip på varje uppdrag

* Language toolchains - kompilatorer, pakethanterare, runtimes
* Servermjukvara - operativsystem, molntjänster
* Kodbibliotek - allt från små hjälpfunktioner till stora ramverk

<!-- Osannolikt med proprietära toolchains/ramverk när man pratar om "generisk" utveckling -->
<!-- Nästan omöjligt att leverera ett projekt utan att röra open source -->

---

<!-- _class: lead -->

<style scoped>
p {
  font-size: 1.5em;
}
</style>

**There is no "opting out"**

<!-- Open Source är *de facto* standard för att bygga moderna system -->

---

<div class="img-left">

![w:250](assets/images/open-book.svg)

<div>

## Definition

Med Open Source står det dig *fritt* att:

* Använda mjukvara oavsett syfte
* Undersöka mjukvaras källkod
* Ändra mjukvarans källkod
* Paketera om eller distribuera mjukvaran

</div>

</div>

<!-- Ok, förklara då vad det är ... -->
<!-- Definitionen är något luddig men man pratar om "Spirit of Open Source" -->

---

<!-- _class: lead bg-title -->

# Free as in speech ... not beer

![bg](assets/images/beer.jpg)

<!-- Ett missförstånd vi kommer dyka djupare i -->

---

<!-- _class: lead -->

## Software is built by Communities

> A group of people sharing the same goals, ideas or values

---

## Motivation

* Svårt (omöjligt) att bygga allt själv
* Lättare att bygga och underhålla något tillsammans
* Man vill bidra eller göra ekosystemet bättre
* Personliga anledningar - **Det är roligt**

<!-- Might be considered strange by some -->

---

<div class="img-left">

![w:250](assets/images/thinking-face.svg)

<div>

## Hur fungerar det?

* Frivilliga och företag publicerar kod med "permissive licenses"
* Alla kan använda, studera och ändra källkoden
* Bidrag sker genom pull requests, buggrapporter och diskussioner
* Styrningen varierar, från soloprojekt till stora stiftelser


</div>

</div>

---

<!-- _class: lead -->

## Läs licenstexten ...

```
MIT License

Copyright (c) 2026 John Open Source

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files
(the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions ...
```

---

## Vilken licens gäller?

![bg 80%](assets/images/licenses.jpg)

<!-- License types -->

---

<!-- Part 2 - Security Perspective -->

<!-- _class: lead bg-title -->

# Open Source och Säkerhet

![bg](assets/images/security.jpg)

---

<div class="img-left">

![w:250](assets/images/siren.svg)

<div>

## Incidenter

* **Heartbleed (2014)** - en TLS-bugg som lät angripare läsa ut data från servrar
* **Log4Shell (2021)** - remote code execution via ett populärt loggramverk (Log4j)
* **XZ Utils Backdoor (2024)** - Social engineering attack mot en utbränd maintainer
* Som användare är det inte alltid uppenbart att du är exponerad

</div>

</div>

---

![bg 55%](assets/images/layers.png)

<!-- Explain how you as a user can be exposed -->

---

<div class="img-left">

![w:250](assets/images/worried-face.svg)

<div>

## Ska man oroa sig?

* I större open source projekt tas säkerhet generellt seriöst
* En lång CVE-lista är *ofta* ett tecken på transparens, inte otrygghet
* Linux har korta ledtider för patching, bättre än många kommersiella alternativ
* ... men allt är en fråga om resurser

</div>

</div>

<!-- A proprietary product with fewer CVEs may simply have fewer people looking -->

---

<!-- Part 3 - The Myth -->

<!-- _class: lead bg-title -->

# The Supply Chain Myth

![bg 100%](assets/images/containers.jpg)

---

![bg 40%](assets/images/modern-infrastructure.png)

<!-- Classic from XKCD -->

---

<div class="img-left">

![w:250](assets/images/boxes.png)

<div>

## Leveranskedja

* Naturligt språk när vi pratar om tillverkning
* Ett vanligare språkbruk efter kända incidenter/säkerhetshål
* Passar bra in på hur företag och myndigheter benämner beroenden
* Men är det korrekt?

<!-- * Känns intuitivt att applicera på mjukvara -->
<!-- * Vi planerar, bygger, testar och skeppar mjukvara ... -->

</div>

</div>

---

<!-- _class: lead -->

## Missförståndet

```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

<!-- "WITHOUT WARRANTY" är det intressanta här -->

---

<!-- _class: lead -->

<style scoped>
p {
  font-size: 1.3em;
}

strong {
  color: #ffac70;
}
</style>

Du har ingen leverantör men kanske en **välgörare**

*Supply Chain* implicerar förpliktelser som inte existerar

---

<!-- _class: lead -->

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

<!-- _class: lead -->

## Organisation

| Modell | Exempel | Utmaningar |
|---|---|---|
| Corporate backed | Kubernetes | Intressekonflikter |
| Stiftelser | Linux, Apache | Kostnader / Ekonomi |
| Multi-licens | Redis, MongoDB | Splittring |
| Donationer / sponsring | curl | Burnout |


<!-- Vi gräver lite djupare hur styrning/governance faktiskt brukar fungera -->
<!-- Viktigt som konsument av open source att förstå dess implikationer -->

---

<!-- Part 4 - Tragedy of the commons -->

<!-- _class: lead bg-title -->

# The tragedy of the commons

![bg](assets/images/tragedy.jpg)

<!-- Ideén att när en resurs är delad och kan gagna individen på bekostnad av allmänheten är det rationellt för individen att överanvända den tar slut för alla -->

---

## En gemensam resurs

* Open source är en gemensam resurs
* Många får ut värde, få bidrar tillbaka
* Kritisk infrastruktur i samhället förvaltas i praktiken av frivilliga

<!-- Om alla tänker att någon annan sköter underhållet - vem gör det då? -->
<!-- Här kommer vi tillbaka till free beer analogin, frihet, inte gratis öl -->

---

## Problematiken

* Open source communities under press:
  * Företag/användare förväntar sig gratis underhåll
  * Attacker mot open source projekt, ibland statlig inblandning
  * AI-hets (möjligheter men också risker)
* Socioekonomisk problemställning snarare än teknisk

---

<!-- Part 5 - AI och Open Source -->

<!-- _class: lead bg-title -->

# AI och Open Source

![bg](assets/images/ai.jpg)

---

<div class="img-left">

![w:250](assets/images/robot.svg)

<div>

## Nuläget

* LLMs har tränats till stor del på öppen källkod
* AI-företag har gjort stora vinster på jobb som communityn gjort gratis
* AI bidrar nu aktivt till öppna källkodsprojekt
* Vad säger egentligen licenserna om det här?

</div>

</div>

---

## Risker

* AI duktig på att hitta sårbarheter
  * Fördel angripare ...
* Mer kod, lika många eller färre reviewers
* Slop PRs - Ökad press på maintainers
* AI kan generera kod, men bygger inte långsiktigt förtroende
* Communities kommer behöva tänka om i en AI-centrerad värld

<!-- AI dålig på att bygga communities, leder ofta till one man shows -->
<!-- En intrinsisk risk mot open source - inte värt att samarbeta och utbyta idéer -->

---

![bg 40%](assets/images/modern-infrastructure-2.png)

---

<!-- Part 6 - What can we do? -->

<!-- _class: lead bg-title -->

# Vad kan vi göra?

![bg](assets/images/typing.jpg)

---

<!-- _class: lead -->

Utvecklartid är en **värdefull** resurs

---

<div class="img-left">

![w:250](assets/images/thinking-face.svg)

<div>

## Vad kan vi göra?

* Förstå problematiken
* Skapa förståelse för vilka open source-beroenden du eller kunden faktiskt har
* Väg riskerna mot fördelarna med att bygga på open source
* Bidra tillbaka kod istället för att patcha lokalt, ge credit
* Bidra med tid/pengar (Sovereign Tech Fund)

</div>

</div>

---

## Ligger i allas intresse

* Billigare och bättre att bygga saker tillsammans
* Offentlig sektor: publika medel → publik kod
* Svårt att uppnå digital suveränitet utan open source
* Välgörenheten du fick gratis, kan du inte ta för given imorgon

<!-- Flera europeriska länder tittar på att gå över till open source -->

---
