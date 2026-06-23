---
title: Házi feladat
layout: default
---

## Házi feladat védés — felkészülés

### 1. feladat — Kruskal-Wallis + post-hoc

**Mit csináltam:** 5 kaktuszcsoport öntözési igényét hasonlítottam össze. Kruskal-Wallis teszt (H=134.63, p<0.05), majd 10 páronkénti Mann-Whitney post-hoc teszt.

**Miért Kruskal-Wallis és nem ANOVA?**
Nem tudtam biztosan hogy az adatok normális eloszlást követnek. A Kruskal-Wallis az ANOVA nemparaméteres megfelelője — nem feltételezi a normalitást, csak legalább ordinális skálát és független csoportokat.

**Mit jelent a szignifikáns Kruskal-Wallis eredmény?**
- Mit mond: legalább két csoport eloszlása különbözik egymástól
- Mit NEM mond: hogy pontosan melyik két csoport különbözik — erre valók a post-hoc tesztek

**A post-hoc korrekció hiánya — várható kérdés vizsgán**

10 Mann-Whitney tesztet futtattam α=0.05-tel, de nem alkalmaztam Bonferroni-korrekciót. Ez problémás:

$$P(\text{legalább egy hamis pozitív}) = 1 - (1-0.05)^{10} \approx 40\%$$

Bonferroni-korrekcióval \\(\alpha/10 = 0.005\\) küszöböt kellett volna használnom. Az eredmények valószínűleg valódiak (H=134.63 nagyon nagy érték), de a korrekció elvégzése módszertanilag szükséges lett volna.

---

### 2. feladat — Többszörös lineáris regresszió

**Mit csináltam:** Y = kaktusz éves növekedése (cm), X1 = napsütéses órák száma, X2 = öntözés mennyisége (cl). OLS regressziót illesztettem.

**Miért regresszió?**
Két numerikus változó (X1, X2) hatását vizsgáltam egy numerikus változóra (Y) — ez regresszió, nem ANOVA vagy t-teszt.

**A logikai sorrend:**
1. Adatok megismerése (leíró statisztikák, szóródiagram)
2. Modell illesztése (OLS becslés)
3. Együtthatók értelmezése
4. Standardizált együtthatók
5. Predikció
6. Konfidencia- és predikciós intervallum
7. R² és adjusted R²
8. F-teszt (modell egésze)
9. t-tesztek (együtthatók külön-külön)
10. VIF (multikollinearitás)
11. Reziduumdiagnosztika (Gauss-Markov feltételek)

---

#### OLS becslés — becsült modell

$$\hat{Y} = 0.226 + 4.122 \cdot X_1 - 0.232 \cdot X_2$$

| Változó | Együttható | p-érték | Szignifikáns? |
|---|---|---|---|
| Konstans (β₀) | 0.226 | 0.920 | Nem |
| X1 (napsütés) | 4.122 | 0.000 | Igen |
| X2 (öntözés) | -0.232 | 0.000 | Igen |

**Együtthatók értelmezése:**
- \\(\hat\beta_1 = 4.122\\): minden plusz napsütéses óra átlagosan 4.122 cm-rel **növeli** a növekedést, ha az öntözés változatlan
- \\(\hat\beta_2 = -0.232\\): minden plusz cl öntözés átlagosan 0.232 cm-rel **csökkenti** a növekedést, ha a napsütés változatlan
- Konstans: nem szignifikáns (p=0.920) — az alapnövekedés nem tér el érdemben nullától

**Miért negatív az öntözés együtthatója?**
Biológiailag magyarázható túlöntözéssel — a kaktuszok sivatagi növények, sok öntözés káros. A VIF értékek kizárják a multikollinearitást mint magyarázatot.

---

#### Standardizált együtthatók

A standardizált együttható (\\(\beta^*\\)) azt mutatja, mennyit változik Y (szórásban mérve) ha x egy szórásnyit nő. Az abszolút értékek alapján hasonlítható össze melyik változónak nagyobb a hatása — amelyiknek nagyobb \\(|\beta^*|\\), annak nagyobb a hatása.

---

#### Predikció (X1=6, X2=30)

$$\hat{Y} = 0.226 + 4.122 \cdot 6 - 0.232 \cdot 30 = 0.226 + 24.732 - 6.960 = 17.998 \text{ cm}$$

- **Konfidenciaintervallum:** az átlagos növekedésre vonatkozik ilyen X1, X2 értékeknél — szűkebb
- **Predikciós intervallum:** egy konkrét egyedi kaktusz növekedésére vonatkozik — mindig szélesebb

---

#### R² és adjusted R²

- **R² = 0.841** — a napsütés és öntözés együttesen a növekedés varianciájának 84.1%-át magyarázza
- **Adjusted R² = 0.834** — közel van az R²-hoz, mindkét változó valóban hasznos a modellben

Több magyarázó változónál mindig adjusted R²-t kell nézni — az R² önmagában mindig nő ha új változót adsz hozzá, még ha az lényegtelen is.

---

#### F-teszt (modell egésze)

**F = 124.47, p = 1.66e-19**

\\(H_0\colon \beta_1 = \beta_2 = 0\\) (egyik változónak sincs hatása)
\\(H_1\colon\\) legalább egy együttható nem nulla

p << 0.05 → elutasítjuk H0-t → a modell egésze szignifikáns.

**Különbség az F-teszt és t-tesztek között:**
- F-teszt → a modell egészét teszteli (legalább egy változó hat-e?)
- t-tesztek → minden együtthatót külön-külön tesztelnek

**Különbség a kis F-teszttől (szórások egyenlősége):**
- Kis F-teszt → két csoport varianciáját hasonlítja → kétmintás t-teszt előtt
- Regressziós F-teszt → a modell szignifikanciáját teszteli → illesztés után

---

#### VIF — multikollinearitás

| Változó | VIF |
|---|---|
| X1 (napsütés) | 1.004 |
| X2 (öntözés) | 1.004 |

VIF ≈ 1 → nincs multikollinearitás — a napsütés és öntözés gyakorlatilag független egymástól. Ez megerősíti hogy a negatív öntözés együttható nem multikollinearitásból adódik, hanem valódi negatív kapcsolatot tükröz.

---

#### Reziduumdiagnosztika — Gauss-Markov feltételek ellenőrzése

| Feltétel | Mit jelent | Teszt | Eredmény | Teljesül? |
|---|---|---|---|---|
| Nullátlag | Modell nem téved szisztematikusan | Reziduumok átlaga | ≈0 | Igen |
| Normalitás | Reziduumok normális eloszlásúak | Shapiro-Wilk | p=0.012 | Határeset |
| Normalitás | Reziduumok normális eloszlásúak | KS teszt | p=0.500 | Igen |
| Függetlenség | Reziduumok nem korrelálnak egymással | Durbin-Watson | 1.734 | Igen |
| Homoszcedaszticitás | Reziduumok szórása állandó | Breusch-Pagan | p=0.978 | Igen |

**Shapiro-Wilk vs KS ellentmondás — várható kérdés vizsgán:**
A Shapiro-Wilk érzékenyebb kis mintákon és elutasítja a normalitást (p=0.012). A KS teszt nem utasítja el (p=0.500). Mivel n=50 elég nagy minta, a centrális határeloszlás-tétel miatt a t-tesztek és F-teszt eredményei megbízhatóak maradnak kisebb normalitás-eltérés esetén is — a Shapiro-Wilk megbízhatóbb kis mintán, de itt a minta elég nagy hogy ez ne legyen kritikus.

### 3. feladat — Idősor elemzés

**Mit csináltam:** Heti kaktusz értékesítési adatokat modelleztük háromféle módszerrel:
1. Determinisztikus trend modell
2. Exponenciális simítás
3. ARIMA(1,1,1)

---

#### 1. Determinisztikus trend modell

**Mit jelent:** OLS regressziót illesztettem az időre (Y ~ idő) — egyenest húztam az adatokra. Ez a legegyszerűbb idősor modell: feltételezi hogy a növekedés lineáris és állandó ütemű.

**Eredmények:**
- R² = 0.933 → a modell a variancia 93.3%-át magyarázza
- F = 673.0, p ≈ 0 → a modell szignifikáns
- Előrejelzés: 51-55. hétre lineárisan növekvő értékek (97.36 → 103.41 db)

**Reziduumdiagnosztika:**

| Feltétel | Teszt | Eredmény | Teljesül? |
|---|---|---|---|
| Nullátlag | Átlag | ≈0 | Igen |
| Normalitás | Shapiro-Wilk | p=0.851 | Igen |
| Normalitás | KS teszt | p=0.853 | Igen |
| Függetlenség | Durbin-Watson | 2.079 | Igen |
| Homoszcedaszticitás | Breusch-Pagan | p=0.554 | Igen |

Minden feltétel teljesül — a determinisztikus trend modell jól illeszkedik az adatra.

---

#### 2. Exponenciális simítás

**Mit jelent:** A múltbeli értékekre épülő előrejelzési módszer, ahol a közelebbi múlt fontosabb mint a régebbi. Két paramétere van:

- **Alpha (α)** — mennyire figyel az újabb adatokra:
  - α közel 1 → szinte csak a legutóbbi értéket nézi → gyorsan reagál, de ingadozó
  - α közel 0 → a régebbi értékek is fontosak → lassan reagál, simább előrejelzés

- **Beta (β)** — mennyire követi a trend változását:
  - β közel 1 → gyorsan követi a trend változását
  - β közel 0 → stabil, állandó trendet feltételez

**Eredmények:**
- Alpha = 0, Beta = 0
- R² = 0.933
- Előrejelzés: ugyanaz mint a determinisztikus modellnél (97.36 → 103.41 db)

**Miért alpha=0 és beta=0?**

Alpha=0 azt jelenti hogy a modell nem frissíti az előrejelzést az új adatok alapján — csak a kezdeti trendbecslésre támaszkodik. Beta=0 azt jelenti hogy a trend meredeksége nem változik. Ez magyarázza hogy az előrejelzések egyeznek a determinisztikus modell eredményeivel — az idősor erős lineáris trendje miatt a szoftver ezt a paraméterkombinációt találta optimálisnak.

---

#### 3. ARIMA(1,1,1)

**Mit jelent az ARIMA(p,d,q)?**

Az ARIMA három részből áll:
- **AR(p)** — autoregresszív rész: a jelenlegi érték függ az előző p értéktől
- **I(d)** — differenciálás: d-szer differenciáljuk a sort hogy stacionáriussá tegyük
- **MA(q)** — mozgóátlag rész: a jelenlegi érték függ az előző q hiba(reziduum) értéktől

Tehát ARIMA(1,1,1): 1 AR tag, 1-szeres differenciálás, 1 MA tag.

**Miért kell a differenciálás (d=1)?**

Az eredeti idősorban trend volt — ez nem stacionárius. Az 1-szeres differenciálás eltávolítja a trendet (minden értékből kivonjuk az előzőt), így a sor stacionáriussá válik.

**ARIMA eredmények:**

| Paraméter | Együttható | p-érték | Szignifikáns? |
|---|---|---|---|
| ar.L1 | -0.217 | 0.504 | Nem |
| ma.L1 | -0.320 | 0.315 | Nem |
| sigma² | 56.582 | 0.000 | Igen |

**Várható kérdés vizsgán: az ar.L1 és ma.L1 paraméterek nem szignifikánsak — mit jelent ez?**

Azt jelenti hogy az AR és MA tagok nem adnak szignifikáns hozzájárulást a modellhez — ezek a paraméterek nem különböznek szignifikánsan nullától. Ez arra utal hogy az ARIMA(1,1,1) talán túl bonyolult modell erre az adatra, és egy egyszerűbb modell (pl. csak differenciálás, ARIMA(0,1,0)) is elegendő lett volna.

**Reziduumdiagnosztika:**

| Feltétel | Teszt | Eredmény | Teljesül? |
|---|---|---|---|
| Nullátlag | Átlag | 2.977 (nem nulla!) | Nem |
| Normalitás | Shapiro-Wilk | p=0.235 | Igen |
| Függetlenség | Durbin-Watson | 1.885 | Igen |
| Homoszcedaszticitás | Breusch-Pagan | p=0.393 | Igen |

**Várható kérdés vizsgán: a reziduumok átlaga 2.977, nem nulla — mit jelent ez?**

Ez azt jelenti hogy a nullátlag feltétele nem teljesül — a modell szisztematikusan alulbecsli az értékeket. Ez azért van, mert az ARIMA differenciálással kezeli a trendet, de ha a trend erős lineáris, a differenciálás után is maradhat szisztematikus eltérés. Megoldás lehetett volna: explicit trend tag hozzáadása a modellhez, vagy más d érték választása.

---

#### A három modell összehasonlítása

| Modell | R² | Reziduumok átlaga | Feltételek |
|---|---|---|---|
| Determinisztikus trend | 0.933 | ≈0 | Mind teljesül |
| Exponenciális simítás | 0.933 | ≈0 | Mind teljesül |
| ARIMA(1,1,1) | — | 2.977 | Nullátlag nem teljesül |

A determinisztikus trend és exponenciális simítás modellek jobban illeszkednek erre az adatra — az ARIMA nem kezeli jól az erős lineáris trendet differenciálással.