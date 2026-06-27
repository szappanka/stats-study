---
layout: default
title: Feladatok
---

# Feladatok

## Mathematical Statistics – Concept questions

**Instructions.** Answer briefly but precisely. These questions are designed to test conceptual understanding: correct interpretation, method choice, model assumptions, and recognition of common statistical mistakes.

---

### 1. (3 points)

**Situation.** A dataset contains the following variables: student ID number, exam score in points, satisfaction rating from 1 to 5, and room temperature measured in degrees Celsius.

**Task.** For each variable, identify the level of measurement (mérési szint) or variable type. Then choose one variable for which taking an arithmetic mean (számtani átlag) would be questionable, and briefly explain why.

<details class="solution" markdown="1">

**Változók osztályozása:**

| Változó | Mérési szint | Miért |
|---|---|---|
| Student ID number | Nominal (nominális) | A számok címkék, nem mennyiségek |
| Exam score (points) | Ratio / Interval (arány / intervallum) | Egyenlő különbségek, a nulla általában értelmes referencia — de kontextustól függ |
| Satisfaction rating (1–5) | Ordinal (ordinális) | A sorrend értelmes, de a kategóriák közötti távolságok nem feltétlenül egyenlők |
| Room temperature (°C) | Interval (intervallum) | Egyenlő különbségek, de a nulla konvencionális (0°C ≠ nincs hőmérséklet) |

**Mikor kérdéses az átlag:**
- **Student ID:** az átlag értelmetlen — a számok tetszőleges kódok, nem mennyiségek
- **Satisfaction rating:** szintén kérdéses — az átlag számítása egyenlő távolságot feltételez a kategóriák között, ami ordinális adatnál nem garantált

</details>

---

### 2. (3 points)

**Situation.** Suppose that the monthly electricity consumptions of households are modelled as independent observations from a normal distribution (eloszlás) with unknown mean μ and unknown variance σ². A random sample of 80 households gives an average monthly electricity consumption of 236 kWh.

**Task.** Identify the relevant parameter (paraméter) of the distribution (eloszlás) and the sample statistic (mintastatisztika) in this situation. Explain why another random sample of 80 households would probably give a different average.

<details class="solution" markdown="1">

> **Distribution vs. populáció:** A *distribution* (eloszlás) a matematikai modellt jelenti — itt N(μ, σ²), amiből a megfigyelések származnak. A *populáció* az összes háztartást jelenti a valóságban. A μ paraméter mindkettőhöz kötődik: egyszerre az eloszlás várható értéke és a populáció tényleges átlagos fogyasztása.

---

**Paraméter (parameter):** egy olyan szám, amely a teljes populációt vagy a modellt jellemzi.
- μ — a háztartások valódi várható havi villamosenergia-fogyasztása (a teljes populációban)
- Rögzített, de ismeretlen (fixed but unknown)
- Mintáról mintára nem változik

**Mintastatisztika (sample statistic):** egy olyan szám, amelyet a mintából számítunk ki, és a paraméter becslésére szolgál.
- X̄ = 236 kWh — a 80 háztartásból számított mintaátlag
- Ismert, de véletlen (known but random) — csak μ becslése

**Miért adna más átlagot egy másik minta:**
- Különböző háztartások kerülnének a mintába, mindegyik a saját fogyasztásával
- A mintaátlag mintáról mintára ingadozik — ezt nevezzük mintavételi ingadozásnak (sampling variability)
- A μ paraméter rögzített marad, de az X̄ statisztika véletlen az adatok megfigyelése előtt

</details>

---

### 3. (4 points)

**Situation.** A report says: "A 95% confidence interval (konfidencia-intervallum) for the mean waiting time is [18.2, 21.6] minutes."

**Task.** Decide which interpretations are correct and correct the wrong ones.

(a) There is a 95% probability that this particular interval contains the true mean (valódi várható érték).

(b) If we repeated the same sampling procedure (mintavételi eljárás) many times, about 95% of the intervals constructed (kiszámított) in this way would contain the true mean (valódi várható érték).

(c) About 95% of individual waiting times are between 18.2 and 21.6 minutes.

(d) The interval gives plausible (elfogadható, az adatokkal összhangban lévő) values for the unknown mean waiting time, not for every individual observation (egyedi megfigyelés).

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **Confidence interval (konfidenciaintervallum)** → az **átlagra** vonatkozik — hol van a valódi populációs átlag?
- **Prediction interval (predikciós intervallum)** → az **egyéni értékekre** vonatkozik — hol lesz egy konkrét új megfigyelés?
- **Long-run reliability (hosszú távú megbízhatóság)** → a 95% nem egy konkrét intervallumra vonatkozik, hanem arra hogy sokszori ismétlésnél az intervallumok 95%-a tartalmazza a valódi átlagot

---

**(a) Helytelen (incorrect)**

Miután az adatokat megfigyeltük és az intervallumot kiszámoltuk, az már fix — vagy tartalmazza a valódi átlagot, vagy nem. A 95% nem erre a konkrét intervallumra vonatkozik, hanem a módszer hosszú távú megbízhatóságára (long-run reliability).

**(b) Helyes (correct)**

Ez a klasszikus frequentista értelmezés (frequentist interpretation): ha sokszor megismételjük a mintavételt és minden alkalommal kiszámítjuk az intervallumot, azok kb. 95%-a tartalmazza a valódi átlagot (true mean).

**(c) Helytelen (incorrect)**

A confidence interval az **átlagra** vonatkozik, nem az egyéni megfigyelésekre. Ez összekeveri a confidence interval-t a prediction interval-lal — az egyéni értékek sokkal jobban szórnak mint az átlag, ezért egy prediction interval sokkal szélesebb lenne.

**(d) Helyes (correct)**

Pontosan leírja mit jelent a konfidenciaintervallum: az ismeretlen átlag plauzibilis/elfogadható értékeit adja meg, nem az egyéni megfigyelésekét.

</details>

---

### 4. (3 points)

**Situation.** In a test of \\(H_0 : \mu = 100\\) against \\(H_1 : \mu \neq 100\\), the computed p-value is 0.032.

**Task.** What is the decision at significance level \\(\alpha = 0.05\\)? What is the decision at \\(\alpha = 0.01\\)? Explain why the sentence "the probability that \\(H_0\\) is true is 3.2%" is not a correct interpretation of the p-value.

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **p-value (p-érték)** → annak valószínűsége, hogy H0 igaz feltételezése mellett legalább ennyire szélsőséges adatot kapnánk
- **Significance level / α (szignifikanciaszint)** → a döntési küszöb: ha p < α → elutasítjuk H0-t
- **Prosecutor's fallacy** → a feltételes valószínűség megfordítása: P(adat \| H0) összetévesztése P(H0 \| adat)-tal

---

**Döntések:**

- \\(\alpha = 0.05\\): p = 0.032 < 0.05 → **elutasítjuk H0-t (reject H0)**
- \\(\alpha = 0.01\\): p = 0.032 > 0.01 → **nem utasítjuk el H0-t (fail to reject H0)**

**Miért helytelen a "H0 igaz valószínűsége 3.2%":**

A p-érték kiszámításakor feltesszük hogy H0 igaz, és azt mérjük hogy mekkora valószínűséggel kapnánk legalább ennyire szélsőséges adatot:

$$p = P(\text{legalább ilyen szélsőséges adat} \mid H_0 \text{ igaz})$$

A helytelen mondat viszont ezt állítja:

$$P(H_0 \text{ igaz} \mid \text{adat}) = 3.2\%$$

Ez megfordítja a feltételes valószínűséget (prosecutor's fallacy) — a p-érték nem mondja meg mekkora valószínűséggel igaz H0, csak azt hogy mennyire meglepő lenne az adatunk, ha H0 igaz lenne.

</details>

---

### 5. (3 points)

**Situation.** Suppose a null hypothesis is rejected at significance level \\(\alpha = 0.05\\).

**Task.** What can we conclude about the decision at \\(\alpha = 0.10\\)? What can we conclude about the decision at \\(\alpha = 0.01\\)? Give a short explanation using the relation between the p-value and \\(\alpha\\).

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- Ha H0-t elutasítottuk α=0.05-nél → biztosan tudjuk hogy p < 0.05
- Nagyobb α (lazább küszöb) → könnyebb elutasítani H0-t
- Kisebb α (szigorúbb küszöb) → nehezebb elutasítani H0-t

---

**α = 0.10-nél:**

Ha p < 0.05, akkor biztosan p < 0.10 is → **biztosan elutasítjuk H0-t (reject H0)**

**α = 0.01-nél:**

Nem tudunk dönteni — csak annyit tudunk hogy p < 0.05, de a pontos értéket nem ismerjük:
- Ha pl. p = 0.008 → p < 0.01 → elutasítjuk H0-t
- Ha pl. p = 0.03 → p > 0.01 → nem utasítjuk el H0-t

A döntés csak "lefelé" (lazább α irányába) terjeszthető ki biztosan, "felfelé" (szigorúbb α irányába) nem.

</details>

---

### 6. (3 points)

**Situation.** A smoke alarm is treated as a hypothesis test. The null hypothesis is "there is no dangerous smoke", and the alarm rings when the null hypothesis is rejected.

**Task.** In this context, describe a Type I error and a Type II error. Which error becomes more likely if the alarm is made much less sensitive? Briefly justify your answer.

<details class="solution" markdown="1">

**Kulcsfogalmak:**

| | H0 igaz | H0 hamis |
|---|---|---|
| Nem utasítjuk el H0-t | Helyes döntés | **Type II error (II. típusú hiba)** — hamis negatív (false negative) |
| Elutasítjuk H0-t | **Type I error (I. típusú hiba)** — hamis pozitív (false positive) | Helyes döntés |

- A két hibatípus egymással szemben áll: ha az egyiket csökkented, a másik nő

---

**Type I error (I. típusú hiba):**

H0 igaz, de a jelző mégis csörög → nincs veszélyes füst, de az alarm mégis jelez → **hamis riasztás (false alarm)**

**Type II error (II. típusú hiba):**

H0 hamis, de a jelző nem csörög → van veszélyes füst, de az alarm nem jelez → **elmulasztott észlelés (missed detection)**

**Kevésbé érzékeny jelző:**

A jelző ritkábban csörög → kevesebb hamis riasztás (I. típusú hiba csökken), de több elmulasztott észlelés (II. típusú hiba nő). A két hibatípus között mindig trade-off van.

</details>

---

### 7. (3 points)

**Situation.** A researcher wants to use a one-sample t-confidence interval (konfidenciaintervallum) for an unknown mean (ismeretlen várható érték) when the variance (variancia/szórás négyzete) is unknown.

**Task.** Explain why the Student t-distribution (t-eloszlás) appears instead of the standard normal distribution (standard normális eloszlás). What role does the sample size (mintaméret) play in this choice?

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **σ (population standard deviation)** → a populáció valódi szórása — fix, de ismeretlen
- **S (sample standard deviation)** → a mintából becsült szórás — mintáról mintára ingadozik
- **Degrees of freedom / szabadságfok** → megmutatja mennyi "szabad" (független) információnk van S becslésére

---

**Miért t-eloszlás és nem normális:**

Ha σ ismert, a standardizált mintaátlag normális eloszlást követ:

$$Z = \frac{\bar{X} - \mu}{\sigma/\sqrt{n}} \sim \mathcal{N}(0,1)$$

Ha σ nem ismert, a mintából becsült S szórással helyettesítjük:

$$T = \frac{\bar{X} - \mu}{S/\sqrt{n}} \sim t(n-1)$$

Ez azért okoz eltérést, mert S **mintáról mintára ingadozik** — minden mintánál más S-t kapnánk. Tehát most két véletlen dolog van a képletben: X̄ is ingadozik, ÉS S is ingadozik. Ez a kettős bizonytalanság (extra uncertainty) azt eredményezi, hogy a végeredmény nem normális eloszlású többé, hanem **szélesebb szélű t-eloszlású**.

**Feltétel:** a t-eloszlás használatához is feltesszük hogy a populáció normális eloszlású (vagy elég nagy a minta, hogy a centrális határeloszlás-tétel miatt ez ne számítson).

---

**A szabadságfok (degrees of freedom) és a mintaméret szerepe:**

Az S kiszámításához felhasználjuk X̄-t is — ez "elvesz" egy szabadságfokot:

$$S = \sqrt{\frac{\sum(x_i - \bar{X})^2}{n-1}}$$

- Ha **σ ismert** → nem kell becsülni → mind az n megfigyelés "szabad" → normális eloszlás
- Ha **σ ismeretlen, S-sel becsüljük** → X̄ elvesz egy szabadságfokot → csak n-1 "szabad" adat marad → t-eloszlás t(n-1) szabadságfokkal

A szabadságfok határozza meg a t-eloszlás alakját:
- **Kis n** → kis szabadságfok → t-eloszlás szélesebb szélű → szélesebb konfidenciaintervallum
- **Nagy n** → nagy szabadságfok → S becslése megbízhatóbb → t-eloszlás közelít a normálishoz

Nagy mintánál (kb. n > 30) a t-eloszlás és a normális eloszlás között már alig van különbség.

</details>

---

### 8. (3 points)

**Situation.** A researcher fits the simple linear regression model (egyszerű lineáris regresszió)

$$Y_i = \beta_0 + \beta_1 x_i + \varepsilon_i$$

where \\(Y_i\\) is the final exam score and \\(x_i\\) is the number of hours studied. The estimated slope (becsült meredekség) is positive. A residual-versus-fitted plot (reziduum-plot) shows a clear curved pattern (ívelt mintázat) rather than a random cloud (véletlen szóródás).

**Task.** Interpret \\(\beta_1\\) in words, explain what the curved residual pattern (ívelt mintázat a reziduum-plotban) suggests, and decide whether the positive slope alone proves that studying more causes higher exam scores.

<details class="solution" markdown="1">

</details>

---

### 9. (3 points)

**Situation.** A daily time series (napi idősor) records the number of visitors to a website. The plot shows a long-term upward trend (hosszú távú növekvő trend) and a clear weekly pattern (egyértelmű heti mintázat).

**Task.** Is weak stationarity (gyenge stacionaritás) plausible for the original series? Name one transformation (transzformáció) or modelling step that could make the series closer to stationary. What would a large positive autocorrelation (autokorreláció) at lag 7 suggest?

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **Weak stationarity (gyenge stacionaritás)** → az idősor "ugyanolyan" marad idővel — nincs trend, nincs ismétlődő mintázat
- **Autocorrelation (autokorreláció)** → mennyire függ össze egy időpont értéke egy korábbi időpont értékével
- **Lag** → az időbeli távolság két megfigyelés között (pl. lag 7 = 7 nappal korábbi érték)

**Mire kell a stacionaritás:**
A legtöbb idősor modell (pl. ARIMA) csak stacionárius adaton működik megbízhatóan. Ha az adatban trend vagy szezonalitás van, a modell rossz előrejelzéseket ad — ezért kell először stacionáriussá tenni a sort.

**Stacionaritás feltételei:**
1. **Állandó átlag (constant mean)** — az idősor átlaga nem változik idővel (nincs trend)
2. **Állandó szórás (constant variance)** — az értékek ingadozása nem nő vagy csökken idővel
3. **Autokorreláció csak a lagnál függ** — az összefüggés két időpont között csak a köztük lévő távolságtól függ, nem attól mikor vagyunk

---

**Plausible-e (ésszerű-e feltételezni) a gyenge stacionaritás?**

Nem plausible, két okból:
- **Növekvő trend** → az átlag folyamatosan nő → **1. feltétel sérül**
- **Heti mintázat** → szisztematikus ismétlődő ciklus → **3. feltétel sérül**

**Transzformáció a stacionaritáshoz:**

- **Differenciálás (first differencing)** → minden értékből kivonjuk az előző értéket → eltávolítja a trendet
- **Szezonális differenciálás (seasonal differencing, lag 7)** → minden értékből kivonjuk a 7 nappal korábbit → eltávolítja a heti mintázatot

**Nagy pozitív autokorreláció lag 7-nél:**

Azt jelenti hogy a mai látogatószám szisztematikusan hasonló a 7 nappal ezelőttihez — vagyis **heti szezonalitás (weekly seasonality)** van. Pl. minden hétfőn hasonló a forgalom mint az előző hétfőn. Ez megerősíti hogy a heti mintázat valódi és szisztematikus, nem véletlen ingadozás.

</details>

---

### 10. (2 points)

**Situation.** A company tests 20 different website variants (weboldal-variáns), each at the 5% significance level (szignifikanciaszint), and then announces the one variant for which p = 0.04.

**Task.** What is the statistical problem (statisztikai probléma) with this reasoning? Name one way to make the analysis more reliable (megbízhatóbbá tenni).

<details class="solution" markdown="1">

**Kulcsfogalmak:**
- **Multiple testing problem (többszörös tesztelés problémája)** → ha sok tesztet futtatsz egyszerre, megnő az esélye hogy véletlenül találsz szignifikáns eredményt
- **p-hacking** → sok tesztet futtatsz, és csak a szignifikáns eredményt jelented be
- **Bonferroni-correction (Bonferroni-korrekció)** → az α küszöböt elosztod a tesztek számával: α/m

---

**Mi a probléma:**

Ha 20 tesztet futtatsz α=0.05-tel, minden egyes tesztnél 5% az esélye hogy **véletlenül** szignifikáns eredményt kapsz — még ha valójában nincs is igazi hatás. Ha ezt 20-szor csinálod, a valószínűsége hogy **legalább egyszer** véletlenül szignifikáns eredményt kapsz:

$$P(\text{legalább egy hamis pozitív}) = 1 - (1-0.05)^{20} \approx 64\%$$

Tehát 64% az esélye hogy legalább egy eredmény véletlenből szignifikáns — és a cég pont ezt az egyet jelenti be. Ez **p-hacking** — nem valódi hatást találtak, hanem véletlent.

**Megoldás — Bonferroni-korrekció:**

α/m = 0.05/20 = 0.0025 küszöböt kellene használni minden egyes tesztnél. Ekkor a p=0.04 már **nem lenne szignifikáns** (0.04 > 0.0025).

Másik megoldás: előzetesen rögzíteni melyik variánst tesztelik (pre-registration), és a többit exploratívként kezelni.

</details>

---

## Mathematical Statistics – Case-based concept exam

**Instructions.** Answer briefly but precisely. Each question is worth 3 points. The point is statistical understanding: interpretation, method choice, assumptions, diagnostics, and common mistakes.

**Case story – The laptop-sticker confidence census (laptopmatrica megbízhatósági felmérés).** A research team investigates laptop stickers and exam confidence (vizsgamagabiztosság). The target population (célpopuláció) is all students attending review sessions (vizsgafelkészítő foglalkozások) before the exam, while the available dataset (elérhető adatkészlet) is 220 review-session attendances (foglalkozás-látogatások). Each row is one student-attendance (egy diák-foglalkozás párosítás). The spreadsheet contains laptop observation code (laptopmegfigyelési kód), sticker theme (matrica témája), exam confidence from 1 to 5 (vizsgamagabiztosság 1-5 skálán), number of stickers (matricák száma), a yes/no variable (igen/nem változó) indicating whether had a statistics sticker (volt-e statisztika matricája), and the time series weekly average confidence rating (heti átlagos magabiztossági értékelés idősora). The team wants a responsible conclusion (következtetés), not a headline that sounds impressive only because it has a decimal point.

---

### 1. (3 points)

**Situation.** In this dataset there are 96 rows. The variables are laptop observation code, sticker theme, exam confidence from 1 to 5, number of stickers, and the yes/no indicator for whether had a statistics sticker. A very enthusiastic intern wants to average every column because 'averages look scientific'.

**Task.** Identify the population, the sample, and the observational unit. Then classify the variables, and name one variable whose arithmetic mean would be meaningless or at least questionable.

<details class="solution" markdown="1">

**Population, sample, observational unit (populáció, minta, megfigyelési egység):**
- **Population (populáció):** all students attending review sessions before the exam — az összes diák aki vizsgafelkészítő foglalkozáson vett részt
- **Sample (minta):** the 96 rows in the dataset — a 96 soros adathalmaz, ami a 220-ból van kivéve
- **Observational unit (megfigyelési egység):** one student-attendance — egy diák egy foglalkozáson való részvétele

**Variable classification (változók osztályozása):**

| Variable | Level of measurement (mérési szint) | Miért |
|---|---|---|
| Laptop observation code | Nominal (nominális) | Azonosító kód, nem mennyiség |
| Sticker theme | Nominal (nominális) | Kategóriák, nincs sorrend |
| Exam confidence (1–5) | Ordinal (ordinális) | Van sorrend, de a távolságok nem feltétlenül egyenlők |
| Number of stickers | Ratio (arány) | Egyenlő különbségek, valódi nulla (0 matrica = nincs matrica) |
| Yes/no statistics sticker | Nominal (nominális) | Két kategória (igen/nem), nincs mennyiség |

**Mikor értelmetlen az átlag:**
- **Laptop observation code:** az átlag értelmetlen — a számok tetszőleges kódok (labels), nem mennyiségek
- **Sticker theme:** az átlag értelmetlen — kategóriák, nincs numerikus jelentésük
- **Yes/no statistics sticker:** az átlag értelmetlen — két kategória (igen/nem), nem mennyiség
- **Exam confidence (1–5):** kérdéses — az átlag feltételezi hogy a távolságok egyenlők a kategóriák között, ami ordinális adatnál nem garantált

</details>

---

### 2. (3 points)

**Situation.** A five-row pilot sample (ötsorosminta) of number of stickers is: 16, 18, 19, 21, 43. A short report gives only the sample mean (mintaátlag) and announces that the typical case (tipikus eset) has been found.

**Task.** Compute the sample mean (mintaátlag) and the median (medián). Which one is more robust (robusztusabb) in this small sample, and what is the exact warning against the naive report (naiv jelentés)?

<details class="solution" markdown="1">

**Számítások:**
- **Sample mean (mintaátlag):** (16 + 18 + 19 + 21 + 43) / 5 = 117 / 5 = **23.4**
- **Median (medián):** a középső érték rendezett sorban: 16, 18, **19**, 21, 43 → **19**

**Melyik robusztusabb (more robust):**

A medián robusztusabb ebben az esetben, mert a 43-as érték egy kiugró érték (outlier) ami felfelé húzza az átlagot (23.4), így az átlag nem jellemzi a tipikus esetet. A medián (19) nem érzékeny a kiugró értékekre — csak a középső értéket veszi figyelembe.

**Warning against the naive report (figyelmeztetés a naiv jelentés ellen):**

Két okból helytelen azt mondani hogy "the typical case has been found":
- **Kis minta (small sample)** — 5 sor alapján nem lehet általánosítani a populációra, a mintavételi ingadozás (sampling variability) nagy
- **Kiugró érték (outlier)** — a 43-as érték torzítja az átlagot, ezért az átlag nem jellemzi a tipikus esetet. A medián jobb leíró statisztika lenne ebben az esetben

</details>

---

### 3. (3 points)

**Situation.** After giving out harmless 'I survived variance' stickers, a 95% confidence interval for the mean change in number of stickers is [0.5, 1.7]. The corresponding two-sided test of \\(H_0 : \mu = 0\\) gives p = 0.009. A headline draft says: 'We have measured the exact improvement of every individual case.'

**Task.** Decide at \\(\alpha = 0.05\\) and \\(\alpha = 0.01\\). Use the interval as a cross-check at the 5% level. Then correct the headline.

<details class="solution" markdown="1">

</details>

---

### 4. (3 points)

**Situation.** Another hypothesis test in the same project gives p = 0.004. A colleague says: 'So the null hypothesis is true with probability 99.6%, and false with probability 0.4%.'

**Task.** State the decisions at \\(\alpha = 0.10\\), \\(\alpha = 0.05\\), and \\(\alpha = 0.01\\). Then explain precisely why the colleague's p-value interpretation is wrong.

<details class="solution" markdown="1">

</details>

---

### 5. (3 points)

**Situation.** The distribution of number of stickers is strongly skewed. Two independent groups have sizes n1 = 31 and n2 = 32. A colleague proposes a standard two-sample t-test only because the sample sizes are not tiny and because the boxplot 'looks funny but friendly'.

**Task.** What should be checked before accepting this? Name one robust or nonparametric alternative and say what changes in interpretation.

<details class="solution" markdown="1">

</details>

---

### 6. (3 points)

**Situation.** A simple linear regression predicts exam confidence rating from number of laptop stickers. The fitted slope is -0.31, SE = 0.14, approximate 95% CI = [-0.58, -0.04], p = 0.026, and R-squared = 0.21. A poster draft claims that one more unit of number of laptop stickers magically causes the outcome to change.

**Task.** Interpret the slope. Decide at \\(\alpha = 0.05\\) and \\(\alpha = 0.01\\) whether the slope differs from 0. Does this regression alone prove a causal effect?

<details class="solution" markdown="1">

</details>

---

### 7. (3 points)

**Situation.** A follow-up multiple regression adds hours studied, time period, and one control variable to the previous model. R-squared changes from 0.24 to 0.34, adjusted R-squared is 0.2, the p-value for laptop stickers becomes 0.041, VIF for laptop stickers is 6.8, and the residual plot shows a curved pattern. A dashboard celebrates only the larger R-squared.

**Task.** What would you say about model improvement, the coefficient test at \\(\alpha = 0.05\\), multicollinearity, and the residual pattern? Why is the naive sentence 'higher R-squared means the model is automatically valid' wrong?

<details class="solution" markdown="1">

</details>

---

### 8. (3 points)

**Situation.** The time series weekly average confidence rating shows confidence trend near the exam. The sample autocorrelation at lag 7 is 0.39. The Ljung-Box test on fitted residuals gives p = 0.031, and a Dickey-Fuller-type unit-root test gives p = 0.04. Someone wants to use all three numbers as if they answered the same question.

**Task.** Interpret the lag-7 autocorrelation. What are the null hypotheses of the two tests, and what are the decisions at \\(\alpha = 0.05\\)? Why are these not the same diagnostic question?

<details class="solution" markdown="1">

</details>

---

### 9. (3 points)

**Situation.** A dashboard says method A is better overall. In easy cases, A has 76/95 successes and B has 41/45 successes. In hard cases, A has 10/45 successes and B has 25/85 successes. The dashboard ignores the easy/hard split because the overall bar chart looks cleaner.

**Task.** Compute the within-stratum success rates. What naive conclusion is dangerous, and what should be done before making a recommendation?

<details class="solution" markdown="1">

</details>

---

### 10. (3 points)

**Situation.** Two estimators of a target value θ are compared in a simulation where the true value is θ = 100. Estimator A has simulation mean 100.2 and standard error 8. Estimator B has simulation mean 96.5 and standard error 3.1. A naive analyst says: 'B is automatically better because its standard error is smaller.'

**Task.** Compute the approximate bias and MSE = bias² + variance for both estimators, using SE squared as the variance. Is the naive sentence correct as stated?

<details class="solution" markdown="1">

</details>
