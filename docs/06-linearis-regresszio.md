---
layout: default
title: Lineáris regresszió
---

# Lineáris regresszió

## Miről szól ez a témakör?

Eddig azt vizsgáltuk, hogy két változó **független-e** egymástól. Most egy lépéssel tovább megyünk: ha összefüggés van köztük, szeretnénk ezt az összefüggést **számszerűsíteni és előrejelzésre használni**. Erre való a regresszióanalízis.

---

## Empirikus kovariancia és korreláció

### Miért kell ez?

Mielőtt regressziót illesztünk, érdemes megnézni, mekkora a kapcsolat az X és Y változók között. Erre való a kovariancia és a korrelációs együttható.

<div class="concept" markdown="1">
**Kovariancia (covariance):** két valószínűségi változó együttes változékonyságát méri:

$$\text{cov}(X, Y) = E[(X - EX)(Y - EY)]$$

Tulajdonságok:
- \\(\text{cov}(X, X) = \sigma_X^2\\)
- \\(\text{cov}(X, Y) = E[XY] - EX \cdot EY\\)
- \\(|\text{cov}(X, Y)| \leq \sigma_X \sigma_Y\\)

**Korrelációs együttható (correlation coefficient):** a kovariancia standardizált változata, amely mindig \\([-1, 1]\\) értéket vesz fel:

$$\text{corr}(X, Y) = \frac{\text{cov}(X, Y)}{\sigma_X \sigma_Y}$$

- Ha X és Y független, akkor \\(\text{corr}(X, Y) = 0\\) (de fordítva nem igaz!)
- \\(|\text{corr}(X, Y)| = 1\\) pontosan akkor, ha \\(X = aY + b\\) valamely valós a, b-re
- Minél nagyobb az abszolút értéke, annál erősebb a kapcsolat
</div>

<div class="concept" markdown="1">
**Empirikus kovariancia:** a minta alapján számított kovariancia:

$$C_n(X, Y) = \frac{1}{n}\sum_{i=1}^n (X_i - \bar{X})(Y_i - \bar{Y})$$

**Empirikus korrelációs együttható:**

$$r_n(X, Y) = \frac{C_n(X, Y)}{s_X \cdot s_Y} = \frac{\sum_{i=1}^n (X_i - \bar{X})(Y_i - \bar{Y})}{\sqrt{\sum_{i=1}^n (X_i - \bar{X})^2 \cdot \sum_{i=1}^n (Y_i - \bar{Y})^2}}$$

A korrelációt tesztelni kell, mert véges mintából véletlenszerűen is kaphatunk nullától különböző értéket:

H₀: corr(X,Y) = 0, tesztstatisztika:

$$T = r_n(X, Y) \cdot \sqrt{\frac{n-1}{1 - r_n^2(X, Y)}} \sim t_{n-2} \quad \text{ha H₀ igaz}$$
</div>

<div class="callout trap" markdown="1">
**Figyelem:** Ha X és Y független, akkor a korreláció nulla. De ha a korreláció nulla, az NEM jelenti, hogy X és Y független – lehet köztük nemlineáris kapcsolat.
</div>

---

## Az elméleti regresszió és a regresszióanalízis célja

<div class="concept" markdown="1">
**Regressziós függvény (theoretical regression):** az Y változó feltételes várható értéke adott X értékekre:

$$m(x_1, \ldots, x_p) = E(Y \mid X_1 = x_1, \ldots, X_p = x_p)$$

Ez az a függvény, amely minimalizálja az \\(E((Y - g(X_1, \ldots, X_p))^2)\\) várható négyzetes hibát – tehát ez az "optimális" előrejelző.

A probléma: a valódi eloszlást nem ismerjük, ezért a regressziós függvényt sem tudjuk meghatározni. Ezért becsüljük, és ehhez egy függvénycsaládot (pl. lineáris függvényeket) választunk.
</div>

<div class="concept" markdown="1">
**A regresszióanalízis célja:** numerikus Y (függő változó) és X₁, ..., Xₚ (független változók) közötti funkcionális kapcsolat modellezése és becslése, majd előrejelzésre használása.

- **Függő változó (Y):** a magyarázandó változó (target, response, outcome)
- **Független változók (X₁, ..., Xₚ):** a magyarázó változók (covariates, predictors, features)
</div>

---

## A lineáris regressziós modell

### Az egyszerű lineáris regresszió modellje

<div class="concept" markdown="1">
**Lineáris regressziós modell (egyváltozós eset):**

$$Y_i = a + bX_i + \varepsilon_i \quad (i = 1, \ldots, n)$$

ahol:
- \\(a\\) az intercept (tengelymetszet) – Y értéke, ha X = 0
- \\(b\\) a meredekség – ha X eggyel nő, Y várható értéke b-vel változik
- \\(\varepsilon_i\\) a hibatag

**A hibatagokra vonatkozó feltételek:**
1. \\(E(\varepsilon_i \mid X) = 0\\) – várható értékük nulla
2. \\(\text{Var}(\varepsilon_i \mid X) = \sigma^2\\) – azonos szórásuk van (homoszkedaszticitás)
3. \\(\text{cov}(\varepsilon_i, \varepsilon_j \mid X) = 0\\) – nem korreláltak egymással
4. \\(\varepsilon_i \sim N(0, \sigma^2)\\) – normálisak (hipotézisvizsgálathoz szükséges)
</div>

### A többváltozós lineáris regresszió modellje

<div class="concept" markdown="1">
**Többváltozós lineáris regresszió (MLR):**

$$Y_i = \beta_0 + \beta_1 X_{1,i} + \beta_2 X_{2,i} + \ldots + \beta_k X_{k,i} + \varepsilon_i$$

Mátrix alakban: \\(Y = X\beta + \varepsilon\\), ahol a megoldás:

$$\hat{\beta} = (X^TX)^{-1}X^TY$$

**Feltételek a magyarázó változókra:**
- Nincs köztük lineáris összefüggés (nincs multikollinearitás): rang(X) = k+1

**Feltételek a hibatagokra:** ugyanazok mint az egyváltozós esetben.
</div>

---

## Legkisebb négyzetek módszere (OLS)

<div class="concept" markdown="1">
**Reziduális (reziduum):** a megfigyelt és a modell által becsült érték különbsége:

$$e_i = Y_i - \hat{Y}_i$$

Különbség a hibataghoz képest: a hibatag \\(\varepsilon_i\\) az igazi, elméleti hiba (nem megfigyelhető), míg a reziduális \\(e_i\\) a becsült modellből számított, megfigyelhető különbség.
</div>

### Levezetés egyváltozós esetben

<div class="eljaras" markdown="1">
**Alapötlet:** keressük azt az \\(a\\) és \\(b\\) értéket, amely minimalizálja a reziduálisok négyzetösszegét:

$$L(a, b) = \sum_{i=1}^n (Y_i - a - bX_i)^2$$

**Levezetés:** deriválunk a és b szerint, majd nullává teszünk:

$$\frac{\partial L}{\partial a} = -2\sum_{i=1}^n (Y_i - a - bX_i) = 0$$

$$\frac{\partial L}{\partial b} = -2\sum_{i=1}^n X_i(Y_i - a - bX_i) = 0$$

**Megoldás:**

$$\hat{b} = \frac{\sum_{i=1}^n X_i Y_i - n\bar{X}\bar{Y}}{\sum_{i=1}^n X_i^2 - n\bar{X}^2} = \frac{C_n(X,Y)}{s_X^2} = r_n(X,Y)\frac{s_Y}{s_X}$$

$$\hat{a} = \bar{Y} - \hat{b}\bar{X}$$

Az illesztett értékek: \\(\hat{Y}_i = \hat{a} + \hat{b}X_i\\)
</div>

### Többváltozós eset

<div class="eljaras" markdown="1">
**Mátrix alakban** minimalizáljuk \\(V(\beta) = (Y - X\beta)^T(Y - X\beta)\\)-t:

$$\frac{\partial V}{\partial \beta} = -2X^TY + 2X^TX\beta = 0 \implies \hat{\beta} = (X^TX)^{-1}X^TY$$

A megoldás minimum, mert a második derivált \\(2X^TX \geq 0\\).
</div>

---

## Gauss–Markov-tétel

<div class="tetel" markdown="1">
**Gauss–Markov-tétel:** a lineáris regressziós modell feltételei mellett a legkisebb négyzetek módszerével becsült \\(\hat{a}\\) és \\(\hat{b}\\) (ill. \\(\hat{\beta}\\)):

1. **Torzítatlan:** \\(E[\hat{b}] = b\\), \\(E[\hat{a}] = a\\)
2. **Minimális varianciájú** az összes torzítatlan lineáris becslő között (BLUE: Best Linear Unbiased Estimator)

Ez azt jelenti, hogy az OLS becslők a "legjobb" torzítatlan lineáris becslők – nem lehet torzítatlan lineáris módszerrel jobbat csinálni.
</div>

<div class="callout tip" markdown="1">
**Tipp:** A Gauss–Markov-tétel csak azt mondja, hogy az OLS a legjobb a **lineáris torzítatlan** becslők között. Ha a hibatagok nem normálisak, létezhetnek nemlineáris becslők, amelyek jobbak.
</div>

---

## Regressziós együtthatók és előrejelzés

<div class="concept" markdown="1">
**Az együtthatók értelmezése:**

- \\(\hat{a}\\) (intercept): Y becsült értéke, ha X = 0 (nem mindig van értelme)
- \\(\hat{b}\\) (meredekség): ha X eggyel nő, Y várható értéke \\(\hat{b}\\)-vel változik

**Standardizált együtthatók:** ha a változók különböző mértékegységűek, az együtthatókat nem lehet közvetlenül összehasonlítani. A standardizált együtthatók ezt oldják meg:

$$\hat{b}_i^* = \hat{\beta}_i \cdot \frac{s_i}{s_Y}$$

ahol \\(s_i\\) az i-edik magyarázó változó szórása, \\(s_Y\\) a függő változó szórása. A standardizált együttható megmutatja, hogy egy szórásnyi változás az i-edik változóban mekkora változást okoz Y-ban szórásban mérve.

**Előrejelzés:** új \\(X_{\text{new}}\\) értékre:

$$\hat{Y}_{\text{new}} = \hat{a} + \hat{b}X_{\text{new}}$$
</div>

---

## R² – az illeszkedés mértéke

<div class="tetel" markdown="1">
**Az R² definíciója és levezetése:**

A teljes variabilitást két részre bontjuk:

$$SST = SSR + SSE$$

ahol:
- \\(SST = \sum_{i=1}^n (Y_i - \bar{Y})^2\\) – teljes négyzetösszeg (total variability)
- \\(SSR = \sum_{i=1}^n (\hat{Y}_i - \bar{Y})^2\\) – regresszió által magyarázott rész
- \\(SSE = \sum_{i=1}^n (Y_i - \hat{Y}_i)^2\\) – hibatagok négyzetösszege (magyarázatlan rész)

**Determinációs együttható (R²):** a modell által magyarázott variabilitás aránya:

$$R^2 = \frac{SSR}{SST} = 1 - \frac{SSE}{SST} = 1 - \frac{\text{Var}(\varepsilon)}{\text{Var}(Y)}$$

**Értelmezés:**
- \\(R^2 = 0\\): a modell semmit sem magyaráz
- \\(R^2 = 1\\): tökéletes illeszkedés
- \\(R^2 = 0.85\\): a modell az Y variabilitásának 85%-át magyarázza

Egyenértékű definíció: \\(R^2 = \text{corr}(Y, \hat{Y})^2\\)
</div>

### Korrigált R² (adjusted R²)

<div class="concept" markdown="1">
**A probléma:** ha újabb magyarázó változót adunk a modellhez, az R² automatikusan nő – még akkor is, ha az új változó valójában nem magyaráz semmit. Ez overfittinghez vezet.

**Korrigált R²:** büntetjük az irreleváns változók hozzáadását:

$$\bar{R}^2 = 1 - (1 - R^2)\frac{n-1}{n-k-1} = 1 - \frac{SSE/(n-k-1)}{SST/(n-1)}$$

ahol k a magyarázó változók száma. Ha az új változó valóban javít a modellen, \\(\bar{R}^2\\) nő; ha nem, csökken. A korrigált R² akár negatív is lehet.
</div>

---

## Modell diagnosztika

### Az egész modell szignifikanciája (F-teszt)

<div class="eljaras" markdown="1">
**H₀:** \\(\beta_0 = \beta_1 = \ldots = \beta_k = 0\\) (a modell nem különbözik a nullmodelltől)

**H₁:** legalább egy \\(\beta_i \neq 0\\)

**Tesztstatisztika:**

$$F = \frac{SSR/k}{SSE/(n-k-1)} \sim F_{k,\, n-k-1} \quad \text{ha H₀ igaz}$$
</div>

### Egyes együtthatók szignifikanciája (t-teszt)

<div class="eljaras" markdown="1">
**H₀:** \\(\beta_i = 0\\) (az i-edik változónak nincs hatása Y-ra)

**H₁:** \\(\beta_i \neq 0\\)

**Tesztstatisztika:**

$$T = \frac{\hat{\beta}_i}{SE(\hat{\beta}_i)} \sim t_{n-k} \quad \text{ha H₀ igaz}$$

Ez az leggyakoribb teszt – megmutatja, hogy az adott magyarázó változó szignifikánsan hozzájárul-e a modellhez.
</div>

### A hibatagok feltételeinek ellenőrzése

<div class="eljaras" markdown="1">
**Normalitás ellenőrzése:**
- Grafikusan: Q-Q plot (ha normálisak a reziduálisok, az pontok egyenesen helyezkednek el), hisztogram, boxplot
- Teszttel: Shapiro–Wilk-teszt (H₀: a reziduálisok normálisan oszlanak el), vagy KS-teszt

**Homoszkedaszticitás (egyenlő szórás) ellenőrzése:**
- Grafikusan: reziduálisok vs. illesztett értékek plot (random felhő = jó, rendszeres minta = rossz)
- Teszttel: Breusch–Pagan-teszt (H₀: a szórás konstans)

**Autokorrelációmentesség (független hibatagok) ellenőrzése:**
- Durbin–Watson-statisztika: \\(DW \approx 2\\) nem korreláltságra utal, DW << 2 pozitív, DW >> 2 negatív autokorrelációra
- H₀: a reziduálisok korrelálatlanok
</div>

---

## Multikollinearitás

### Mi ez és miért probléma?

<div class="concept" markdown="1">
**Multikollinearitás:** a magyarázó változók között lineáris összefüggés áll fenn. Ez azért probléma, mert:

- Az együtthatók becsléseinek varianciája nagyon megnő – a becslések instabillá válnak
- Nehéz eldönteni, melyik változónak mi a hatása Y-ra
- A modell statisztikailag nem megbízható

**Diagnosztikai eszközök:**

**Tolerancia:** az i-edik változónak a többivel szembeni "függetlenségét" méri:

$$\text{Tolerance}_i = 1 - R_i^2$$

ahol \\(R_i^2\\) az i-edik változónak a többivel való regressziójából kapott determinációs együttható. Ha közel 0-hoz, erős multikollinearitás áll fenn. Jó, ha ≥ 0.1.

**VIF (Variance Inflation Factor):** a tolerancia reciproka:

$$VIF_i = \frac{1}{1 - R_i^2}$$

Ha a változók korrelálatlanok, VIF = 1. Jó, ha VIF < 10.

**Condition Index (CI):** a magyarázó változók korrelációs mátrixának sajátértékeiből számítva: a legnagyobb és legkisebb sajátérték hányadosának négyzetgyöke. Ha CI > 15, erős multikollinearitás gyanítható.
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** A multikollinearitás problémájának lényege: ha két magyarázó változó erősen korrelál egymással, nem tudjuk szétválasztani a hatásukat. A VIF az elsődleges diagnosztikai eszköz – ha VIF > 10, multikollinearitás gyanítható.
</div>