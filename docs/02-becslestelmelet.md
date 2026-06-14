---
layout: default
title: Becsléselmélet
---

# Becsléselmélet

## Pontbecslés

<div class="concept" markdown="1">
**Paraméter:** az eloszlás egy ismeretlen jellemzője, amit meg akarunk határozni. Például normális eloszlásnál a várható érték \\(\mu\\) (mű) vagy a variancia \\(\sigma^2\\) (szigma négyzet).

**Pontbecslő (point estimator):** egy módszer, amivel a mintából kiszámolunk egyetlen számot, hogy megbecsüljük az ismeretlen paramétert. Például \\(\mu\\) becslésére használhatjuk a mintaátlagot \\(\bar{X}\\), a mediánt, vagy más statisztikát.

**Pontbecslés (point estimate):** a pontbecslő konkrét értéke, miután megfigyeltük az adatokat. Például \\(\bar{x} = 3.98\\).
</div>

<div class="callout tip" markdown="1">
**Tipp:** A pontbecslő és a pontbecslés különbsége ugyanaz, mint \\(X\\) és \\(x\\) között – a pontbecslő egy véletlen változó (mérés előtt nem tudjuk mi lesz), a pontbecslés egy konkrét szám (mérés után kapjuk).
</div>

## Torzítatlanság, aszimptotikus torzítatlanság, torzítás, standard hiba, hatékonyság

<div class="concept" markdown="1">
**Torzítás (bias):** azt méri, hogy a becslő átlagosan mennyivel tér el a valódi paramétertől. Ha a becslő mindig kicsit feljebb vagy lejjebb mutat a valódinál, torzított – mint egy mérleg ami mindig 2 kg-mal többet mutat:

$$\text{Bias}(\hat{\theta}) = E[\hat{\theta}] - \theta$$

**Torzítatlan becslő (unbiased estimator):** ha a torzítás nulla, azaz a becslő átlagosan pontosan a valódi paramétert adja vissza:

$$E[\hat{\theta}] = \theta$$

**Aszimptotikusan torzítatlan:** kis mintánál még torzított lehet, de ahogy nő a mintaméret, a torzítás egyre kisebb lesz és végül eltűnik.
</div>

<div class="concept" markdown="1">
**Négyzetes közép hiba (MSE):** egyszerre méri a torzítást és a varianciát – összességében mennyire pontos a becslő:

$$\text{MSE}(\hat{\theta}) = E\left[(\hat{\theta} - \theta)^2\right] = V(\hat{\theta}) + \left[\text{Bias}(\hat{\theta})\right]^2$$
</div>

<div class="concept" markdown="1">
**Standard hiba (SE):** azt méri, mennyire "ugrál" a becslő mintáról mintára. Minél nagyobb a minta, annál kisebb az ingadozás:

$$SE(\hat{\theta}) = \sqrt{V[\hat{\theta}]}$$

Ha a standard hibában ismeretlen paraméter szerepel, azt becsléssel helyettesítjük – ezt hívjuk **becsült standard hibának**.
</div>

<div class="concept" markdown="1">
**MVUE (Minimum Variance Unbiased Estimator):** az összes torzítatlan becslő közül a legkisebb varianciájú – a legkevésbé ugráló.

**Hatékonyság (efficiency):** egy torzítatlan becslő hatékony, ha eléri az elméleti minimális varianciát (Cramér-Rao korlátot). Ennél kisebb varianciájú torzítatlan becslő nem létezhet.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** Az MSE két összetevőn múlik: a variancián és a torzításon. Mindkettőnek kicsinek kell lennie a pontos becsléshez.
</div>

## Konzisztencia és erős konzisztencia

<div class="concept" markdown="1">
**Konzisztencia (consistency):** ha egyre több adatot gyűjtünk, a becslő egyre közelebb kerül a valódi paraméterhez. Nagy mintánál nagyon valószínű, hogy a becslő közel van a valódi értékhez. Jelölés: \\(\hat{\theta} \xrightarrow{p} \theta\\) (p = valószínűségben konvergál).

**Erős konzisztencia (strong consistency):** ugyanaz, de erősebb garancia – a becslő majdnem biztosan konvergál a valódi értékhez, nem csak nagy valószínűséggel. A kivételek valószínűsége nulla. Jelölés: \\(\hat{\theta} \xrightarrow{\text{a.s.}} \theta\\) (a.s. = almost surely, majdnem biztosan).
</div>

<div class="callout tip" markdown="1">
**Tipp:** A konzisztencia azt mondja: "nagy mintánál valószínűleg jó lesz a becslés." Az erős konzisztencia azt mondja: "nagy mintánál szinte biztosan jó lesz." A különbség elméleti – a gyakorlatban mindkettő azt jelenti, hogy több adat jobb becslést ad.
</div>

## Intervallumbecslés és konfidenciaszint

<div class="concept" markdown="1">
**Intervallumbecslés (interval estimation):** ahelyett hogy egyetlen számot adnánk a paraméter becsléseként, egy egész tartományt adunk meg, amelyről "elég biztosak vagyunk" hogy tartalmazza a valódi értéket. Például nem azt mondjuk hogy "az átlag 236 kWh", hanem azt hogy "az átlag 220 és 252 kWh között van".

**Konfidenciaintervallum:** a \\([\hat{\theta}_1, \hat{\theta}_2]\\) intervallum \\((1-\varepsilon) \cdot 100\%\\)-os konfidenciaintervallum \\(\theta\\)-ra, ha:

$$P\!\left(\hat{\theta}_1 \leq \theta \leq \hat{\theta}_2\right) \geq 1 - \varepsilon$$
</div>

<div class="concept" markdown="1">
**Konfidenciaszint (confidence level):** az \\(1-\varepsilon\\) (epszilon) érték, például 95%. Azt jelenti: ha sokszor megismételjük a kísérletet és minden alkalommal kiszámítjuk az intervallumot, az intervallumok 95%-a fogja tartalmazni a valódi paramétert.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** A 95%-os konfidenciaszint NEM azt jelenti, hogy "95% valószínűséggel esik a valódi érték az intervallumba". Miután kiszámítottuk az intervallumot, az már fix számok – a valódi érték vagy benne van, vagy nincs. A 95% a hosszú távú arányra vonatkozik.
</div>

## A mintaátlag tulajdonságai

<div class="tetel" markdown="1">
**Tétel:** Legyen \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim}\\) valamely eloszlásból, amelynek várható értéke \\(\mu\\) (mű) és varianciája \\(\sigma^2\\) (szigma négyzet). Ekkor a mintaátlagra \\(\bar{X}\\) a következők teljesülnek:

**1. Torzítatlan:** a mintaátlag torzítatlan becslője \\(\mu\\)-nek:

$$E[\bar{X}] = \mu$$

**2. Standard hiba:** a mintaátlag standard hibája:

$$SE(\bar{X}) = \frac{\sigma}{\sqrt{n}}$$

Ha \\(\sigma\\) ismeretlen, \\(s\\)-t helyettesítjük be: becsült standard hiba \\(= \frac{s}{\sqrt{n}}\\).

**3. Konzisztens:** a mintaátlag konzisztens becslője \\(\mu\\)-nek:

$$\bar{X} \xrightarrow{p} \mu$$

Ez a nagy számok törvényéből következik – minél nagyobb a minta, annál biztosabban konvergál \\(\mu\\)-hoz.
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** Ha négyszer akkora mintát veszünk, a standard hiba felére csökken, mert \\(\sqrt{4} = 2\\). Tehát a pontosság növeléséhez négyszer annyi adat kell, hogy kétszer pontosabb legyen a becslés.
</div>

## A variancia becslőinek tulajdonságai

<div class="tetel" markdown="1">
**Tétel:** Legyen \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim}\\) valamely eloszlásból, amelynek varianciája \\(\sigma^2\\).

**1. A korrigálatlan empirikus variancia aszimptotikusan torzítatlan:**

$$E[s_n^2] = \frac{n-1}{n}\sigma^2 \neq \sigma^2$$

Tehát kis mintánál kicsit alábecslünk, de ahogy \\(n \to \infty\\), a \\(\frac{n-1}{n}\\) tényező 1-hez tart és a torzítás eltűnik.

**2. A korrigált empirikus variancia torzítatlan:**

$$E[(s_n^{\ast})^2] = \sigma^2$$

Az \\(n-1\\) nevező pontosan kompenzálja a torzítást, amit az okoz, hogy az átlagot is a mintából számoltuk.
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** A korrigált variancia (\\(n-1\\) nevező) torzítatlan. A korrigálatlan (\\(n\\) nevező) csak aszimptotikusan torzítatlan – nagy mintánál lesz csak pontos.
</div>

## Konfidenciaintervallum normális eloszlás várható értékére

<div class="tetel" markdown="1">
**Tétel:** Legyen \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\\), ahol \\(\mu\\) ismeretlen.

**1. eset – ismert \\(\sigma\\) (z-intervallum):**

Ha \\(\sigma\\) ismert, a mintaátlag standardizálva standard normális eloszlást követ:

$$\frac{\bar{X} - \mu}{\sigma/\sqrt{n}} \sim N(0,1)$$

Az \\(1-\varepsilon\\) konfidenciaszintű intervallum:

$$\left[\bar{X} - \frac{z_{\varepsilon/2} \cdot \sigma}{\sqrt{n}},\quad \bar{X} + \frac{z_{\varepsilon/2} \cdot \sigma}{\sqrt{n}}\right]$$

ahol \\(z_{\varepsilon/2} = \Phi^{-1}(1 - \varepsilon/2)\\). 95%-os konfidenciaszintnél \\(z_{0.025} = 1.96\\).

**2. eset – ismeretlen \\(\sigma\\) (t-intervallum):**

Ha \\(\sigma\\) ismeretlen, \\(s_n^{\ast}\\)-gal helyettesítjük. Ekkor már nem standard normálist kapunk, hanem t-eloszlást – mert \\(s_n^{\ast}\\) maga is véletlenszerű, ez extra bizonytalanságot visz be:

$$\frac{\bar{X} - \mu}{s_n^{\ast}/\sqrt{n}} \sim t_{n-1}$$

Az \\(1-\varepsilon\\) konfidenciaszintű intervallum:

$$\left[\bar{X} - \frac{t_{\varepsilon/2,\, n-1} \cdot s_n^{\ast}}{\sqrt{n}},\quad \bar{X} + \frac{t_{\varepsilon/2,\, n-1} \cdot s_n^{\ast}}{\sqrt{n}}\right]$$

ahol \\(t_{\varepsilon/2, n-1}\\) a \\(t_{n-1}\\) eloszlás kvantilise – ez mindig nagyobb mint \\(z_{\varepsilon/2}\\), tehát az intervallum szélesebb, ami kompenzálja az ismeretlen \\(\sigma\\) miatti extra bizonytalanságot.
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** Ismert \\(\sigma\\) esetén z-intervallum (1.96 a 95%-os esetben), ismeretlen \\(\sigma\\) esetén t-intervallum (szélesebb, mert \\(\sigma\\)-t is becsültük). Nagy \\(n\\)-nél a t-eloszlás közelít a normálishoz.
</div>

## Az MLE tulajdonságai

<div class="tetel" markdown="1">
**Tétel:** Nagy mintaméret esetén, nagyon általános feltételek mellett a maximum likelihood becslő \\(\hat{\theta}\\) a következő tulajdonságokkal rendelkezik:

**1. Konzisztens:** minél több adat, annál közelebb kerül a valódi paraméterhez:

$$\hat{\theta} \xrightarrow{p} \theta$$

**2. Aszimptotikusan torzítatlan:** nagy mintánál átlagosan eltalálja a valódi paramétert:

$$E[\hat{\theta}] \approx \theta$$

**3. Aszimptotikusan minimális varianciájú:** nagy mintánál a lehető legkevésbé ugrál – aszimptotikusan MVUE.

Együtt ez azt jelenti, hogy nagy mintánál az MLE közelítőleg normális eloszlású:

$$\sqrt{n}(\hat{\theta} - \theta) \xrightarrow{D} N\!\left(0, \frac{1}{I(\theta)}\right)$$

ahol \\(I(\theta)\\) a Fisher-információ – azt méri, mennyi információt tartalmaz egy megfigyelés \\(\theta\\)-ról.
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** Az MLE három aszimptotikus tulajdonsága: konzisztens, aszimptotikusan torzítatlan, aszimptotikusan minimális varianciájú. Ezért nagy mintánál az MLE általában a legjobb választás.
</div>


## Maximum likelihood becslés (MLE)

<div class="eljaras" markdown="1">
**Alapötlet:** keressük azt a \\(\theta\\) paramétert, amely mellett a megfigyelt adatok a "legvalószínűbbek" lettek volna.

**Lépések:**

**1. Írjuk fel a likelihood függvényt:** ez megmutatja, hogy adott \\(\theta\\) esetén mekkora valószínűséggel kaptuk volna a megfigyelt adatokat. Mivel a megfigyelések függetlenek, a likelihood egy szorzat:

$$L(\theta) = f(x_1, \ldots, x_n; \theta) = \prod_{i=1}^n f(x_i; \theta)$$

**2. Logaritmáljunk (log-likelihood):** a logaritmus a szorzatból összeget csinál, ami sokkal könnyebben deriválható. A maximum helye nem változik, mert \\(f' = 0 \Leftrightarrow (\log f)' = 0\\):

$$\ell(\theta) = \log L(\theta) = \sum_{i=1}^n \log f(x_i; \theta)$$

**3. Deriváljunk és tegyük nullává:** megkeressük a maximumot:

$$\frac{d\ell(\theta)}{d\theta} = 0$$

**4. Oldjuk meg \\(\theta\\)-ra:** ez lesz az MLE becslő \\(\hat{\theta}\\).

**Példa – érmés kísérlet:** 10 dobásból 3 fej. Likelihood: \\(L(p) = p^3(1-p)^7\\). Log-likelihood: \\(\ell(p) = 3\log p + 7\log(1-p)\\). Deriválva és nullává téve: \\(\hat{p} = 3/10\\).
</div>

<div class="callout trap" markdown="1">
**Figyelem:** Nem mindig ott van a maximum, ahol a derivált nulla. Például Uniform\\([0, \theta]\\) esetén a likelihood \\(\theta^{-n}\\), ami monoton csökken – a maximum tehát \\(\hat{\theta} = \max(x_1, \ldots, x_n)\\), deriválás nélkül, logikai úton.
</div>

## Momentummódszer (Method of Moments)

<div class="eljaras" markdown="1">
**Alapötlet:** a populációs momentumok (várható érték, négyzetének várható értéke, stb.) az ismeretlen paraméterektől függnek. Egyenlővé tesszük ezeket a mintából számolt momentumokkal, majd megoldjuk a paraméterre.

Ha \\(m\\) ismeretlen paraméterünk van, \\(m\\) egyenletet írunk fel:

$$\frac{\sum_{i=1}^n X_i}{n} = E[X], \quad \frac{\sum_{i=1}^n X_i^2}{n} = E[X^2], \quad \ldots$$

**Példa – Exponenciális eloszlás:** \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim} \text{Exp}(\lambda)\\), ahol \\(E[X] = 1/\lambda\\). Egy paraméter, egy egyenlet:

$$\bar{X} = \frac{1}{\lambda} \implies \hat{\lambda} = \frac{1}{\bar{X}}$$

**Példa – Normális eloszlás:** \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\\), két paraméter, két egyenlet:

$$\bar{X} = \mu \implies \hat{\mu} = \bar{X}$$

$$\frac{\sum X_i^2}{n} = \sigma^2 + \mu^2 \implies \hat{\sigma}^2 = \frac{\sum X_i^2}{n} - \bar{X}^2 = \frac{1}{n}\sum_i (X_i - \bar{X})^2$$
</div>

<div class="callout tip" markdown="1">
**Tipp:** A momentummódszer egyszerűbb mint az MLE, de általában rosszabb tulajdonságú becslőket ad. Ha mindkettő könnyen számolható, az MLE-t részesítjük előnyben.
</div>