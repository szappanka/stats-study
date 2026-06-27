---
layout: default
title: Házi védés
---

# Házi védés

## Output/code excerpts from the submitted homework (a beadott házi feladatból)

### Task 1. One-way comparison (egycsoportos összehasonlítás)
Data file: `data_task1_variant1.csv` — response (függő változó): monthly watering requirement (havi öntözési igény, cl). 

**Group summary (csoportösszefoglaló):**

| Group (csoport) | n | Mean (átlag) | SD (szórás) |
|---|---|---|---|
| desk cactus | 50 | 58.173 | 8.398 |
| flowering cactus | 50 | 66.672 | 7.149 |
| green cactus | 50 | 35.691 | 12.226 |
| large cactus | 50 | 41.432 | 14.619 |
| mini cactus | 50 | 47.294 | 11.206 |

**Teszteredmények:**
- ANOVA: F = 64.520, p = 3.370e−37
- Kruskal-Wallis: H = 134.627, p = 3.987e−28
- Assumption checks (feltételek ellenőrzése):
  - Shapiro p-values range from 0.0926 (green cactus) to 0.6696 (mini cactus)
  - Levene p = 0.0001
  - Bartlett p = 3.762e−06
- Tukey HSD selected pairs (kiválasztott párok):
  - flowering cactus–green cactus: diff=−30.981, p_adj=0.000e+00 **(rejected / elutasítva)**
  - flowering cactus–large cactus: diff=−25.240, p_adj=0.000e+00 **(rejected / elutasítva)**
  - green cactus–large cactus: diff=5.741, p_adj=0.0739 **(not rejected / nem utasítva el)**
  - large cactus–mini cactus: diff=5.862, p_adj=0.0642 **(not rejected / nem utasítva el)**

---

### Task 2. Multiple regression (többszörös lineáris regresszió)
Y = annual cactus growth (éves kaktusznövekedés, cm), X1 = sunny hours per day (napi napsütéses órák), X2 = weekly watering (heti öntözés, cl). Data file: `data_task2_variant1.csv`

**Fitted model (becsült modell):**

$$\hat{Y} = 0.2262 + 4.1222 X_1 - 0.2315 X_2$$

| Parameter | Estimate | SE | p-value | 95% CI |
|---|---|---|---|---|
| Intercept | 0.2262 | 2.2434 | 0.9201 | [−4.287, 4.739] |
| X1 | 4.1222 | 0.3167 | 3.365e−17 | [3.485, 4.759] |
| X2 | −0.2315 | 0.0239 | 8.314e−13 | [−0.279, −0.184] |

**Fit:**
- R² = 0.8412, adjusted R² = 0.8344
- Global F = 124.468, p = 1.664e−19
- Standardized coefficients (standardizált együtthatók): X1 = 0.7582, X2 = −0.5653
- Prediction at X1=6.000, X2=30.000: Ŷ = 18.0138
- 95% CI for mean [16.114, 19.913], 95% PI [7.554, 28.474]
- Diagnostics: VIF(X1) = 1.004, VIF(X2) = 1.004
- Residual Shapiro p = 0.0121, Durbin-Watson = 1.734, Breusch-Pagan p = 0.9784, σ² = 26.142

---

### Task 3. Time-series modelling (idősor modellezés)
Office cactus sales. Data file: `data_task3_variant1.csv`

**Deterministic trend (determinisztikus trend):**
- value = 20.2987 + 1.5110·time
- slope p = 6.805e−30, R² = 0.9334
- next forecast = 97.361 with 95% PI [84.928, 109.795]
- Trend residuals: Shapiro p = 0.8508, DW = 2.079, Ljung-Box p = 0.5089
- First forecasts: 94.573, 94.573, 94.573

**SES (Simple Exponential Smoothing):** α = 0.2280

**ARIMA(1,1,1):**
- AIC = 343.096
- Ljung-Box p = 0.3764
- First forecasts: 94.078, 94.892, 94.715

---

## Questions (kérdések)

### 1. Task 1: cactus group hypotheses (3 points)

**Question.** Write \\(H_0\\) and \\(H_1\\) with the cactus groups (kaktuszcsoportokkal) and use the ANOVA output (ANOVA eredmény) for the 5% global decision (5%-os globális döntés) in words.

**Mit kérdez:** Írd fel a hipotéziseket a konkrét kaktuszcsoportok nevével, majd az ANOVA output alapján hozz döntést α=0.05-nél.

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **H0 (nullhipotézis)** → nincs különbség a csoportok között
- **H1 (alternatív hipotézis)** → legalább két csoport különbözik
- **ANOVA F-teszt** → a modell egészének szignifikanciáját teszteli — van-e különbség valahol a csoportok átlagai között?

---

**Hipotézisek:**

$$H_0: \mu_{\text{desk}} = \mu_{\text{flowering}} = \mu_{\text{green}} = \mu_{\text{large}} = \mu_{\text{mini}}$$

(mind az öt kaktuszcsoport havi öntözési igényének várható értéke egyenlő)

$$H_1: \text{legalább két csoport várható értéke különbözik egymástól}$$

**Döntés α=0.05-nél:**

F = 64.520, p = 3.370e−37 << 0.05 → **elutasítjuk H0-t (reject H0)**

A legalább két kaktuszcsoport havi öntözési igénye szignifikánsan különbözik egymástól. A p-érték rendkívül kicsi, az eredmény erősen szignifikáns.

</details>

---

### 2. Task 1: assumptions and nonparametric check (3 points)

**Question.** Interpret the Shapiro range (Shapiro tartomány), Levene p-value (Levene p-érték), and Bartlett p-value (Bartlett p-érték). Why is it useful that Kruskal-Wallis gives a similar global conclusion (hasonló globális következtetés)?

**Mit kérdez:** Értelmezd a három feltétel-ellenőrző teszt eredményét, és magyarázd meg miért hasznos hogy a Kruskal-Wallis ugyanolyan következtetésre jut.

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **Shapiro-Wilk teszt** → normalitást (normality) ellenőriz csoportonként. H0: a csoport normális eloszlású. Ha p > 0.05 → nem utasítjuk el a normalitást
- **Levene teszt** → a csoportok szórásának egyenlőségét (homogeneity of variance / homoszcedaszticitás) ellenőrzi. H0: minden csoport szórása egyenlő
- **Bartlett teszt** → szintén a szórások egyenlőségét ellenőrzi, de érzékenyebb a normalitás sérülésére
- **Kruskal-Wallis** → az ANOVA nemparaméteres párja, nem feltételezi a normalitást és az egyenlő szórást

---

**Shapiro-Wilk tartomány értelmezése:**

A Shapiro p-értékek 0.0926 (green cactus) és 0.6696 (mini cactus) között mozognak. Minden csoport p-értéke > 0.05 → **nem utasítjuk el a normalitást** egyik csoportnál sem. A normalitás feltétele elfogadható.

**Levene p-érték értelmezése:**

Levene p = 0.0001 < 0.05 → **elutasítjuk H0-t** → a csoportok szórásai **nem egyenlők (heteroszcedaszticitás)**. Ez az ANOVA egyik feltételének (egyenlő varianciák) sérülését jelenti.

**Bartlett p-érték értelmezése:**

Bartlett p = 3.762e−06 < 0.05 → **elutasítjuk H0-t** → megerősíti a Levene eredményt: a szórások szignifikánsan különböznek. A Bartlett teszt érzékenyebb a normalitás sérülésére, de itt a normalitás teljesül, tehát ez az eredmény megbízható.

**Miért hasznos a Kruskal-Wallis hasonló következtetése:**

Mivel a szórások egyenlőségének feltétele sérül (Levene és Bartlett p < 0.05), az ANOVA eredménye megkérdőjelezhető. A Kruskal-Wallis nem feltételezi sem a normalitást, sem az egyenlő szórást — és szintén szignifikáns eredményt adott (H = 134.627, p = 3.987e−28). Ez **megerősíti** az ANOVA következtetését: a különbség valódi, nem a feltételek sérüléséből adódik.

</details>

---

### 3. Task 1: pairwise modelling (2 points)

**Question.** Choose one rejected (elutasított) and one non-rejected (nem elutasított) selected Tukey pair (Tukey pár). Explain exactly what is and is not concluded (mi következik és mi nem) for their watering requirements (öntözési igény).

**Mit kérdez:** Válassz egy szignifikáns és egy nem szignifikáns Tukey párt, és magyarázd el pontosan mit jelent mindkét eredmény.

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **Tukey HSD (Honestly Significant Difference)** → post-hoc teszt ami páronként hasonlítja a csoportokat, és korrigál a többszörös tesztelésre (multiple testing correction)
- **p_adj** → korrigált p-érték (adjusted p-value) — figyelembe veszi hogy sok párt tesztelünk egyszerre
- **diff** → a két csoport átlagának különbsége (cl-ben)

---

**Elutasított pár (rejected pair) — flowering cactus vs green cactus:**

diff = −30.981, p_adj = 0.000e+00 < 0.05 → **elutasítjuk H0-t**

A flowering cactus átlagos havi öntözési igénye (66.672 cl) szignifikánsan **nagyobb** mint a green cactusé (35.691 cl) — a különbség kb. 31 cl. Ez a különbség nem tulajdonítható véletlennek.

**Mit NEM lehet ebből következtetni:** nem mondhatjuk hogy minden egyes flowering cactus több öntözést igényel mint minden egyes green cactus — csak az átlagok különböznek szignifikánsan.

---

**Nem elutasított pár (non-rejected pair) — green cactus vs large cactus:**

diff = 5.741, p_adj = 0.0739 > 0.05 → **nem utasítjuk el H0-t (fail to reject H0)**

Nincs elegendő statisztikai bizonyíték arra, hogy a green cactus és a large cactus átlagos öntözési igénye különbözne egymástól α=0.05-nél.

**Mit NEM lehet ebből következtetni:** ez nem jelenti hogy a két csoport öntözési igénye **egyenlő** — csak azt, hogy az adatok nem nyújtanak elég erős bizonyítékot a különbségre. A különbség lehet valódi, de a teszt nem tudta kimutatni (esetleg nagyobb mintával igen).

</details>

---

### 4. Task 2: cactus-growth coefficients (3 points)

**Question.** Interpret the sunny-hours (napsütéses órák) and watering coefficients (öntözési együttható), explicitly holding the other predictor fixed (a másik változót rögzítve tartva). Then interpret the signs of the standardized coefficients (standardizált együtthatók előjelei).

**Mit kérdez:** Értelmezd β₁ és β₂ együtthatókat a konkrét kaktuszos kontextusban, majd magyarázd a standardizált együtthatók előjeleit.

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **Coefficient / β (együttható)** → mennyit változik Y átlagosan, ha az adott X eggyel nő, a többi változó változatlan mellett (ceteris paribus)
- **Standardized coefficient / β* (standardizált együttható)** → mennyit változik Y (szórásban mérve), ha X egy szórásnyit nő — összehasonlíthatóvá teszi a különböző mértékegységű változókat
- **Sign (előjel)** → pozitív = növeli Y-t, negatív = csökkenti Y-t

---

**β₁ = 4.1222 (napsütéses órák) értelmezése:**

Minden plusz napsütéses óra átlagosan **4.12 cm-rel növeli** a kaktusz éves növekedését, ha a heti öntözés mennyisége változatlan marad. A hatás erősen szignifikáns (p = 3.365e−17).

**β₂ = −0.2315 (heti öntözés) értelmezése:**

Minden plusz cl heti öntözés átlagosan **0.23 cm-rel csökkenti** a kaktusz éves növekedését, ha a napsütéses órák száma változatlan marad. A negatív előjel magyarázható a kaktuszok természetével — sivatagi növények, a túlöntözés káros lehet számukra. A hatás erősen szignifikáns (p = 8.314e−13).

**Standardizált együtthatók előjeleinek értelmezése:**

- X1 standardizált β* = 0.7582 → **pozitív** — a napsütés növeli a növekedést
- X2 standardizált β* = −0.5653 → **negatív** — az öntözés csökkenti a növekedést

Az abszolút értékek alapján a napsütésnek (|0.7582|) nagyobb hatása van a növekedésre mint az öntözésnek (|0.5653|).

</details>

---

### 5. Task 2: prediction at the requested cactus (3 points)

**Question.** Substitute (helyettesítsd be) X1 = 6.000, X2 = 30.000 into the fitted model (becsült modellbe). Explain why the PI (prediction interval / predikciós intervallum) is wider than the CI (confidence interval / konfidenciaintervallum).

**Mit kérdez:** Számítsd ki a becsült növekedést X1=6, X2=30-nál, majd magyarázd el miért szélesebb a predikciós intervallum a konfidenciaintervallumnál.

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **Confidence interval / CI (konfidenciaintervallum)** → az átlagos Y értékre vonatkozik egy adott X1, X2-nél — hol van az átlagos növekedés ilyen körülmények között?
- **Prediction interval / PI (predikciós intervallum)** → egy konkrét egyedi kaktusz Y értékére vonatkozik — hol lesz egy adott kaktusz növekedése?
- A PI mindig szélesebb mint a CI, mert az egyéni értékek sokkal jobban szórnak mint az átlag

---

**Predikció (prediction):**

$$\hat{Y} = 0.2262 + 4.1222 \cdot 6 - 0.2315 \cdot 30 = 0.2262 + 24.7332 - 6.9450 = 18.0144 \approx 18.01 \text{ cm}$$

**95% CI for mean [16.114, 19.913]:** az összes ilyen körülmények között növekvő kaktusz **átlagos** növekedése várhatóan 16.1 és 19.9 cm között van.

**95% PI [7.554, 28.474]:** egy konkrét egyedi kaktusz növekedése X1=6, X2=30 esetén várhatóan 7.6 és 28.5 cm között lesz.

**Miért szélesebb a PI mint a CI:**

- A CI csak a **becslési bizonytalanságot** tükrözi — mennyire pontosan ismerjük az átlagot
- A PI a becslési bizonytalanságon **felül** tartalmazza az egyéni értékek természetes szóródását (σ² = 26.142) is
- Egy egyedi kaktusz növekedése sokkal jobban eltérhet az átlagtól mint maga az átlag — ezért a PI sokkal szélesebb

</details>

---

### 6. Task 2: multicollinearity warning (3 points)

**Question.** VIF(X1) = 1.004 is displayed. Convert it to an approximate auxiliary \\(R_j^2\\) (segéd R²) and explain why this makes coefficient interpretation (együttható értelmezése) delicate (kényes/bizonytalan).

**Mit kérdez:** Számítsd ki az auxiliary R²-t a VIF-ből, és magyarázd el miért teszi bizonytalanná a VIF az együtthatók értelmezését általában — és mit jelent itt a konkrét VIF=1.004 érték.

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **VIF (Variance Inflation Factor)** → azt méri, mennyire magyarázható az egyik X a többi X-szel. VIF = 1/(1−R²_j)
- **Auxiliary R² / R²_j (segéd R²)** → mennyire magyarázható X1 a többi magyarázó változóval (itt X2-vel)
- **Multicollinearity (multikollinearitás)** → ha a magyarázó változók erősen korrelálnak egymással, a becslések bizonytalanná válnak

---

**Auxiliary R² kiszámítása:**

$$VIF = \frac{1}{1 - R_j^2} \implies R_j^2 = 1 - \frac{1}{VIF} = 1 - \frac{1}{1.004} \approx 1 - 0.996 = 0.004$$

Tehát X1-et X2 mindössze **0.4%-ban magyarázza** — a két változó szinte teljesen független egymástól.

**Miért teszi általában bizonytalanná a VIF az együtthatók értelmezését:**

Ha a VIF nagy (pl. VIF > 5 vagy > 10), az azt jelenti hogy az egyik X erősen magyarázható a többi X-szel. Ilyenkor:
- A β becslések nagy szórásúak — bizonytalanok
- Az együtthatók előjele torzulhat
- Nehéz megmondani melyik változónak mekkora az önálló hatása

**Mit jelent itt a VIF = 1.004:**

A mi esetünkben VIF = 1.004 ≈ 1 — ez a **legjobb lehetséges érték**, nincs multikollinearitás. X1 (napsütés) és X2 (öntözés) szinte teljesen független egymástól. Tehát az együtthatók értelmezése **nem kényes** ebben a modellben — a VIF nem okoz problémát.

</details>

---

### 7. Task 3: cactus-shop forecasts (3 points)

**Question.** Interpret the deterministic trend slope (determinisztikus trend meredeksége) and the SES smoothing parameter (SES simítási paraméter). What does the ARIMA Ljung-Box p-value (Ljung-Box p-érték) say about whether residual autocorrelation (reziduális autokorreláció) remains?

**Mit kérdez:** Értelmezd a determinisztikus trend meredekségét és az SES alpha paraméterét, majd a Ljung-Box teszt alapján döntsd el van-e még autokorreláció az ARIMA reziduumaiban.

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **Deterministic trend (determinisztikus trend)** → egyenest illeszt az időre (Y ~ idő) — feltételezi hogy a növekedés lineáris és állandó ütemű
- **Slope (meredekség)** → mennyit változik Y átlagosan időegységenként (hetente)
- **SES (Simple Exponential Smoothing)** → a múltbeli értékekre épülő előrejelzési módszer, ahol α szabályozza hogy mennyire figyel az újabb adatokra
- **Ljung-Box teszt** → van-e még autokorreláció a reziduumokban (a modell hiányos-e)?

---

**Determinisztikus trend meredeksége:**

A becsült modell: value = 20.2987 + 1.5110·time

A meredekség = **1.5110** → hetente átlagosan **1.51 db-bal nő** az irodai kaktusz értékesítés. A meredekség erősen szignifikáns (p = 6.805e−30), az R² = 0.9334 → a modell a variancia 93.3%-át magyarázza. A trend erős és lineáris.

**SES simítási paraméter (α = 0.2280):**

Az α = 0.2280 azt jelenti hogy az előrejelzés kb. **22.8%-ban** az utolsó megfigyelt értéken, és **77.2%-ban** a korábbi előrejelzésen alapul. Ez egy viszonylag **alacsony α érték** → a modell lassan reagál a változásokra, simább előrejelzést ad. Ez megfelel egy stabil, lassan változó trendnek.

**ARIMA Ljung-Box p-érték értelmezése:**

Ljung-Box p = 0.3764 > 0.05 → **nem utasítjuk el H0-t**

H0: nincs autokorreláció a reziduumokban. Mivel p > 0.05, az ARIMA(1,1,1) reziduumai **nem mutatnak szignifikáns autokorrelációt** — a modell jól ragadta meg az időbeli mintázatot, nem maradt kihasználatlan struktúra a hibákban.

</details>