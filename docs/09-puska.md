---
title: Felismerési puska
layout: default
---

# Felismerési puska – Matstat teszt választás

## 1. Hány csoport / minta?
- 1 minta → egymintás teszt
- 2 független csoport → kétmintás teszt
- 2 csoport, ugyanazok az alanyok (előtte-utána) → páros teszt
- 3+ független csoport → ANOVA vagy Kruskal-Wallis
- 3+ csoport, ismételt mérés ugyanazon alanyokon → Repeated-measures ANOVA vagy Friedman

## 2. Ismert-e a szórás / normális-e az eloszlás?
- Ismert szórás → z-teszt
- Ismeretlen szórás, normális vagy nagy minta → t-teszt
- Nem tudjuk hogy normális, vagy kicsi a minta és nem normális → nemparaméteres alternatíva

## 3. Változó típusa

**Paraméteres** (numerikus, normális vagy nagy minta)

Példák: testmagasság (cm), vérnyomás, hőmérséklet, reakcióidő (ezredmásodperc), jövedelem nagy mintán

**Nemparaméteres** (ordinális VAGY numerikus de nem normális)
- Ordinális példák: elégedettségi pontszám 1-5, fájdalom skála 1-10, iskolai végzettség szintje
- Nem normális numerikus példák: jövedelem kis mintán (ferde eloszlás), várakozási idő, korlátos skála sok szélsőértékkel

**Kategorikus** (gyakoriság alapú, nincs sorrend)

Példák: nem (férfi/nő), vércsoport, párt amire szavazott, igen/nem válasz, beteg/egészséges státusz

Itt nem átlagot hasonlítunk, hanem gyakoriságokat/arányokat

## 4. Mit kérdez a feladat?
- Eltér-e az átlag/medián egy adott értéktől → egymintás teszt
- Különböznek-e a csoportok átlagai/eloszlásai → kétmintás vagy többmintás teszt
- Függ-e két kategorikus változó egymástól → χ²-függetlenségvizsgálat
- Illeszkedik-e az adat egy eloszlásra → Kolmogorov-Smirnov vagy χ²-illeszkedésvizsgálat
- Van-e kapcsolat/hatás két numerikus változó között → regresszió
- Van-e trend/szezonalitás → idősor diagnosztika (Dickey-Fuller, Ljung-Box)
- Kicsi a minta, extrém pontos eredmény kell → egzakt teszt (Fisher exact, Lady Tasting Tea)

## 5. Szórások egyenlősége (két csoportnál) - csak paraméteresnél (t-teszt esetén)
- Ha feltesszük hogy egyenlő a szórás → sima kétmintás t-teszt
- Ha nem feltesszük → Welch-teszt
- A szórások egyenlőségét magát az F-teszttel vizsgáljuk
- Ha nemparaméteres útra mentél (2-3. lépésben), ez a pont nem releváns

## 6. Paraméteres vs nemparaméteres párok

| Paraméteres | Nemparaméteres megfelelő | Mikor |
|---|---|---|
| Egymintás t-teszt | Wilcoxon signed-rank (egymintás) / sign test | 1 minta |
| Páros t-teszt | Wilcoxon signed-rank teszt | 2 csoport, ugyanazok az alanyok |
| Kétmintás t-teszt | Mann-Whitney (= Wilcoxon rank-sum) | 2 független csoport |
| ANOVA | Kruskal-Wallis | 3+ független csoport |
| Repeated-measures ANOVA | Friedman teszt | 3+ csoport, ugyanazok az alanyok |

## 7. Hipotézisfelírás szabálya
- H0 mindig egyenlőséget tartalmaz, ez a "nincs különbség / nincs hatás" állapot
- H1 az amit ki akarunk mutatni, ez tartalmazza a "van különbség / van hatás" állítást
- Kétoldali, ha a szöveg csak annyit kérdez: különbözik-e, eltér-e
- Egyoldali, ha a szöveg irányt mond: nagyobb-e, csökkenti-e, javít-e, legalább annyi-e
- H0-ba mindig az kerül, amit a kutató meg akar cáfolni, nem a saját állítása
