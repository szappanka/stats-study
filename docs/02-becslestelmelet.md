---
layout: default
title: Becsléselmélet
---

# Becsléselmélet

## Miről szól ez a témakör?

A statisztika alapproblémája: van egy eloszlás, amelyből az adataink jönnek, de az eloszlás paraméterei ismeretlenek. Például tudjuk, hogy a háztartások áramfogyasztása normális eloszlást követ, de nem tudjuk, hogy mi a várható értéke \\(\mu\\). Ebből a néhány megfigyelt adatból szeretnénk megbecsülni ezt a paramétert.

Két nagy kérdés:
1. **Pontbecslés:** adjunk egyetlen számot (pl. \\(\hat{\mu} = 236\\) kWh)
2. **Intervallumbecslés:** adjunk egy intervallumot, amelyről "elég biztosak vagyunk", hogy tartalmazza a valódi értéket (pl. \\([220, 252]\\) kWh)

---

## Pontbecslés

<mark>Pontbecslő (point estimator)</mark>: bármely \\(\hat{\theta} = g(X_1, \ldots, X_n)\\) statisztika, amelyet a \\(\theta\\) paraméter becslésére használunk. Ez egy véletlenszerű változó – ha más mintát veszünk, más értéket kapunk.

<mark>Pontbecslés (point estimate)</mark>: a pontbecslő egy konkrét értéke az adott minta alapján, pl. \\(\hat{\theta} = 3.98\\).

A különbség ugyanaz, mint \\(X\\) (véletlenszerű változó, mielőtt megnézzük) és \\(x\\) (konkrét szám, amit megfigyeltünk) között.

**Példa:** \\(\mu\\)-t becsülhetjük a mintaátlaggal, a mediánnal vagy más statisztikával. De melyik a jobb? Ehhez kell a következő néhány fogalom.

---

## Hogyan értékeljünk egy becslőt? Torzítás, variancia, MSE

Képzeljük el, hogy sokszor megismételjük a kísérletet és minden alkalommal kiszámítjuk a becslőt. Három kérdést tehetünk fel:

- **Átlagosan eltaláljuk-e a valódi értéket?** → torzítás (bias)
- **Mennyire ingadoznak a becslések?** → variancia
- **Összességében mennyire pontos?** → MSE

<mark>Torzítás (bias)</mark>: az átlagos hiba – mennyivel tér el a becslő várható értéke a valódi paramétertől:

$$\text{Bias}(\hat{\theta}) = E[\hat{\theta}] - \theta$$

<mark>Torzítatlan becslő</mark>: ha \\(\text{Bias}(\hat{\theta}) = 0\\), azaz \\(E[\hat{\theta}] = \theta\\). A becslő "átlagosan" eltalálja a valódi értéket.

<mark>Aszimptotikusan torzítatlan</mark>: ha nagy mintánál a torzítás nullához tart, de véges mintánál még lehet torzított.

<mark>MSE (Mean Squared Error)</mark>: az átlagos négyzetes hiba, ami egyszerre méri a torzítást és a varianciát:

$$\text{MSE}(\hat{\theta}) = E\left[(\hat{\theta} - \theta)^2\right] = V(\hat{\theta}) + \left[\text{Bias}(\hat{\theta})\right]^2$$

Tehát egy becslő lehet pontos kétféleképpen: ha kicsi a varianciája, ha kicsi a torzítása, vagy ha mindkettő kicsi.

<div class="callout tip" markdown="1">
**Tipp:** A torzítás a szisztematikus hibát méri (mindig ugyanolyan irányba tévedünk), a variancia a véletlenszerű ugrálást (néha feljebb, néha lejjebb). A lövész-analógia: torzítás = rendszeresen mellé lőünk, variancia = szétszórtan lőünk.
</div>

---

## Standard hiba

<mark>Standard hiba (SE)</mark>: a becslő szórása, vagyis hogy mennyire "ugrál" mintáról mintára:

$$SE(\hat{\theta}) = \sqrt{V[\hat{\theta}]}$$

Ha az SE-ben ismeretlen paraméter van, azt becsléssel helyettesítjük – ezt hívjuk **becsült standard hibának**.

**Tétel: a mintaátlag standard hibája**

Ha \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim}\\) valamilyen eloszlásból, amelynek varianciája \\(\sigma^2\\), akkor:

$$SE(\bar{X}) = \frac{\sigma}{\sqrt{n}}$$

Ez azt jelenti: ha négyszer akkora mintát veszünk, a becslés szórása felére csökken. Nagyobb minta → pontosabb becslés.

Ha \\(\sigma\\) ismeretlen, \\(s\\)-t helyettesítjük be: becsült \\(SE = \frac{s}{\sqrt{n}}\\).

---

## Hatékonyság és MVUE

Ha több torzítatlan becslőnk van, természetesen azt akarjuk, amelyik a legkevésbé ugrál, vagyis a legkisebb varianciájú.

<mark>MVUE</mark>: az összes torzítatlan becslő közül a legkisebb varianciájú. (Minimum Variance Unbiased Estimator)

<mark>Hatékonyság (efficiency)</mark>: egy becslő hatékonysága azt méri, mennyire közel van a varianciája az elméleti minimumhoz (Cramér-Rao korláthoz). Ha eléri, a hatékonysága 1 – ezt hívjuk **hatékony becslőnek**.

A Cramér-Rao korlát: egyetlen torzítatlan becslő sem lehet jobb ennél:

$$V(T) \geq \frac{1}{I_n(\theta)}$$

ahol \\(I_n(\theta) = nI(\theta)\\) a Fisher-információ az egész mintában.

<div class="callout trap" markdown="1">
**Figyelem:** Minden hatékony becslő MVUE, de fordítva nem igaz. MVUE létezhet anélkül, hogy hatékony lenne.
</div>

---

## Konzisztencia

Intuitívan: ha egyre több adatunk van, a becslés egyre közelebb kerül a valódi értékhez.

<mark>Konzisztencia</mark>: \\(\hat{\theta}\\) konzisztens, ha valószínűségben konvergál \\(\theta\\)-hoz, ahogy \\(n \to \infty\\). Jelölés: \\(\hat{\theta} \xrightarrow{p} \theta\\).

<mark>Erős konzisztencia</mark>: \\(\hat{\theta}\\) erősen konzisztens, ha majdnem biztosan konvergál. Ez erősebb állítás.

**Tétel: a mintaátlag konzisztens**

\\(\bar{X} \xrightarrow{p} \mu\\) – ez közvetlenül a nagy számok törvényéből következik.

---

## Tételek a variancia-becslőkről

### Miért van az \\(n-1\\) a korrigált varianciában?

Ez az egyik leggyakoribb kérdés. A magyarázat:

Amikor kiszámítjuk \\(\sum(X_i - \bar{X})^2\\)-t, az átlagot \\(\bar{X}\\)-et is a mintából számoltuk. Ez azt jelenti, hogy az eltérések nem teljesen szabadok: ha \\(n-1\\) eltérést ismerünk, az utolsó automatikusan adódik. Ezért csak \\(n-1\\) "szabad" eltérésünk van – ezt hívjuk szabadsági foknak.

**Tétel: a korrigálatlan variancia aszimptotikusan torzítatlan**

$$E[s_n^2] = E\left[\frac{1}{n}\sum_i (X_i - \bar{X})^2\right] = \frac{n-1}{n}\sigma^2$$

Tehát torzított (kicsit alábecslünk), de \\(n \to \infty\\) esetén a torzítás eltűnik.

**Tétel: a korrigált variancia torzítatlan**

$$E[(s_n^*)^2] = E\left[\frac{1}{n-1}\sum_i (X_i - \bar{X})^2\right] = \sigma^2$$

Az \\(n-1\\) nevező pontosan kompenzálja a torzítást.

<div class="callout exam" markdown="1">
**Vizsgán:** Miért \\(n-1\\)? Mert az átlagot is a mintából becsüljük, ezzel elveszítünk egy szabadsági fokot. A korrigált variancia ezért torzítatlan, a korrigálatlan csak aszimptotikusan az.
</div>

---

## Maximum likelihood becslés (MLE)

### Az alapötlet

Tegyük fel, hogy megfigyeltünk néhány adatot. Az MLE azt a \\(\theta\\) értéket keresi, amely mellett ezek az adatok a "legvalószínűbbek" lettek volna.

Például: feldobunk egy érmét 10-szer, 3-szor jön fej. Az MLE kérdése: melyik \\(p\\) mellett a legvalószínűbb, hogy pontosan 3 fejet kapjunk? A válasz \\(\hat{p} = 3/10\\) – ami intuitívan is értelmes.

<mark>Likelihood függvény</mark>: az \\(f(x_1, \ldots, x_n; \theta)\\) joint sűrűségfüggvényt \\(\theta\\) függvényeként tekintve, rögzített (már megfigyelt) adatok mellett. Fontos: a likelihood nem valószínűség, ezért "valószínűség" helyett "valószínűszerűség"-et mondunk.

<mark>MLE definíció</mark>: a \\(\hat{\theta}\\) MLE értékek azok, amelyek maximalizálják a likelihood függvényt:

$$f(x_1, \ldots, x_n;\, \hat{\theta}) \geq f(x_1, \ldots, x_n;\, \theta) \quad \text{minden } \theta\text{-ra}$$

### Hogyan számoljuk ki?

A szorzat deriválása nehézkes, ezért log-likelihood-ot használunk. Mivel a logaritmus monoton növekvő, ugyanott van a maximuma:

$$\ell(\theta) = \log L(\theta) = \sum_{i=1}^n \log f(x_i; \theta)$$

**Lépések:**
1. Felírjuk a likelihood-ot: \\(L(\theta) = \prod_{i=1}^n f(x_i; \theta)\\)
2. Logaritmálunk: \\(\ell(\theta) = \sum_{i=1}^n \log f(x_i; \theta)\\)
3. Deriválunk és nullává teszünk: \\(\frac{d\ell}{d\theta} = 0\\)
4. Megoldjuk \\(\theta\\)-ra, ellenőrzünk (második derivált negatív?)

<div class="callout trap" markdown="1">
**Figyelem:** Nem mindig ott van a maximum, ahol a derivált nulla. Például Uniform\\([0, \theta]\\) esetén a likelihood \\(\theta^{-n}\\), ami monoton csökken, tehát a maximum \\(\hat{\theta} = \max(x_1, \ldots, x_n)\\) – deriválás nélkül, logikai úton.
</div>

### Az MLE invariancia elve

Ha \\(\hat{\theta}\\) az MLE, akkor bármely \\(h(\theta)\\) függvény MLE-je egyszerűen \\(h(\hat{\theta})\\). Tehát nem kell újra levezetni – csak behelyettesítünk.

**Példa:** ha \\(\hat{\mu} = \bar{X}\\) és \\(\hat{\sigma}^2 = \frac{\sum(X_i-\bar{X})^2}{n}\\), akkor a variációs együttható \\(\sigma/\mu\\) MLE-je:

$$\widehat{\sigma/\mu} = \frac{\hat{\sigma}}{\hat{\mu}} = \frac{\sqrt{\hat{\sigma}^2}}{\bar{X}}$$

### Az MLE aszimptotikus tulajdonságai

Nagy mintánál az MLE nagyon jól viselkedik – ez az egyik oka, hogy annyira népszerű:

1. **Konzisztens:** \\(\hat{\theta} \xrightarrow{p} \theta\\) – közel kerül a valódi értékhez
2. **Aszimptotikusan torzítatlan:** \\(E[\hat{\theta}] \approx \theta\\)
3. **Aszimptotikusan minimális varianciájú** – aszimptotikusan MVUE

Együtt ez azt jelenti, hogy nagy mintánál az MLE közelítőleg normális eloszlású:

$$\sqrt{n}(\hat{\theta} - \theta) \xrightarrow{D} N\!\left(0,\, \frac{1}{I(\theta)}\right)$$

Ez praktikusan hasznos: nem kell mindig meghatározni a pontos mintavételi eloszlást, elég tudni, hogy nagy mintánál normálishoz közelít.

<div class="callout exam" markdown="1">
**Vizsgán:** Az MLE három aszimptotikus tulajdonsága: konzisztens, aszimptotikusan torzítatlan, aszimptotikusan minimális varianciájú. Ezért nagy mintánál az MLE a legjobb választás.
</div>

---

## Momentummódszer (Method of Moments)

### Az alapötlet

Egyszerűbb alternatíva az MLE-nél: egyenlítsük a populációs momentumokat (elméleti várható értékek) a minta-momentumokkal (adatokból számolt átlagok).

Az első momentum az átlag, a második az átlagos négyzet, és így tovább. Ha \\(m\\) ismeretlen paraméterünk van, \\(m\\) egyenletet írunk fel és megoldjuk.

**Formálisan:** a \\(\hat{\theta}_1, \ldots, \hat{\theta}_m\\) momentumbecslők megoldják:

$$\frac{\sum_{i=1}^n X_i}{n} = E[X], \quad \frac{\sum_{i=1}^n X_i^2}{n} = E[X^2], \quad \ldots$$

**Példa – Exponenciális:** \\(X_i \sim \text{Exp}(\lambda)\\), ahol \\(E[X] = 1/\lambda\\). Első egyenlet:

$$\bar{X} = \frac{1}{\lambda} \implies \hat{\lambda} = \frac{1}{\bar{X}}$$

**Példa – Normális:** \\(X_i \sim N(\mu, \sigma^2)\\), két paraméter, két egyenlet:

$$\bar{X} = \mu \implies \hat{\mu} = \bar{X}$$

$$\frac{\sum X_i^2}{n} = \sigma^2 + \mu^2 \implies \hat{\sigma}^2 = \frac{1}{n}\sum_i (X_i - \bar{X})^2$$

<div class="callout tip" markdown="1">
**Tipp:** A momentummódszer egyszerűbb, mint az MLE, de általában rosszabb tulajdonságú becslőket ad. Ha mindkettő könnyen számolható, az MLE-t részesítjük előnyben.
</div>

---

## Intervallumbecslés és konfidenciaszint

### Az alapötlet

A pontbecslés egyetlen számot ad, de honnan tudjuk, mennyire bízzunk benne? Az intervallumbecslés egy egész tartományt ad, amelyről valamilyen szinten biztosak vagyunk, hogy tartalmazza a valódi értéket.

<mark>Konfidenciaintervallum</mark>: a \\([\hat{\theta}_1, \hat{\theta}_2]\\) intervallum \\((1-\varepsilon) \cdot 100\%\\)-os konfidenciaintervallum \\(\theta\\)-ra, ha

$$P\!\left(\hat{\theta}_1 \leq \theta \leq \hat{\theta}_2\right) \geq 1 - \varepsilon$$

<mark>Konfidenciaszint</mark>: az \\(1-\varepsilon\\) értéke (pl. 95%). Azt jelenti: ha sokszor megismételjük az eljárást, az így kapott intervallumok kb. \\((1-\varepsilon) \cdot 100\%\\)-a tartalmazza a valódi \\(\theta\\)-t.

Az intervallum hossza a pontosságot mutatja – kisebb intervallum pontosabb becslés.

<div class="callout trap" markdown="1">
**Figyelem:** A 95%-os konfidenciaintervallum NEM azt jelenti, hogy "95% valószínűséggel esik \\(\theta\\) az intervallumba". Miután az adatokat megfigyeltük, az intervallum konkrét számok, \\(\theta\\) is fix. A 95% a hosszú távú arányra vonatkozik: az eljárás 95%-os sikerességű.
</div>

---

## Konfidenciaintervallum normális eloszlás várható értékére

### Ha \\(\sigma\\) ismert – z-intervallum

A logika: tudjuk, hogy \\(\bar{X} \sim N(\mu, \sigma^2/n)\\). Standardizálva:

$$\frac{\bar{X} - \mu}{\sigma/\sqrt{n}} \sim N(0,1)$$

Ez az egyetlen olyan mennyiség, amelynek ismerjük az eloszlását és tartalmazza az ismeretlen \\(\mu\\)-t. Ezért erre keresünk intervallumot, majd visszaalakítjuk \\(\mu\\)-ra.

Szimmetrikus intervallumot keresünk (a standard normális szimmetrikus), \\(1-\varepsilon\\) konfidenciaszintre. Az \\(u_{\varepsilon/2} = \Phi^{-1}(1-\varepsilon/2)\\) kritikus érték az a szám, amelyre \\(P(-u_{\varepsilon/2} \leq Z \leq u_{\varepsilon/2}) = 1-\varepsilon\\).

$$P\!\left(\bar{X} - \frac{u_{\varepsilon/2}\,\sigma}{\sqrt{n}} \leq \mu \leq \bar{X} + \frac{u_{\varepsilon/2}\,\sigma}{\sqrt{n}}\right) = 1-\varepsilon$$

95%-nál: \\(\varepsilon = 0.05\\), \\(u_{0.025} = 1.96\\).

**Numerikus példa:** \\(\bar{X} = 100\\), \\(\sigma = 15\\), \\(n = 36\\):

$$\left[100 - 1.96 \cdot \frac{15}{6},\; 100 + 1.96 \cdot \frac{15}{6}\right] = [95.1,\; 104.9]$$

### Ha \\(\sigma\\) ismeretlen – t-intervallum

Ha \\(\sigma\\)-t nem ismerjük, \\(s_n^*\\)-gal helyettesítjük. Csakhogy ekkor már nem standard normálist kapunk – a becslési bizonytalanság miatt a hányadosnak szélesebb eloszlása lesz:

$$\frac{\bar{X} - \mu}{s_n^*/\sqrt{n}} \sim t_{n-1}$$

Ez a **Student-féle t-eloszlás** \\(n-1\\) szabadságfokkal. A t-eloszlás harangszerű és szimmetrikus mint a normális, de szélesebb farkú – ez kompenzálja, hogy \\(\sigma\\)-t is becsültük. Nagy \\(n\\)-nél közelít a standard normálishoz.

A konfidenciaintervallum:

$$\left[\bar{X} - \frac{t_{\varepsilon/2,\,n-1} \cdot s_n^*}{\sqrt{n}},\; \bar{X} + \frac{t_{\varepsilon/2,\,n-1} \cdot s_n^*}{\sqrt{n}}\right]$$

ahol \\(t_{\varepsilon/2,\,n-1}\\) a t-eloszlás kvantilise (táblázatból vagy szoftverből).

<div class="callout exam" markdown="1">
**Vizsgán:** Ismert \\(\sigma\\) esetén z-intervallum (normális kvantilis 1.96), ismeretlen \\(\sigma\\) esetén t-intervallum (t-kvantilis, ami szélesebb). Az ismeretlen \\(\sigma\\) esetén a t-eloszlás azért jelenik meg, mert az \\(s_n^*\\) maga is véletlenszerű, ez extra bizonytalanságot visz a rendszerbe.
</div>

---

## Kapcsolódó eloszlások

Ezek az eloszlások akkor jelennek meg, amikor normálisan eloszló adatokból becslünk.

<mark>Khi-négyzet eloszlás</mark> (\\(\chi^2_n\\)): ha \\(n\\) darab független standard normális változót négyzetre emelünk és összeadunk, \\(\chi^2(n)\\) eloszlást kapunk. Várható értéke \\(n\\), varianciája \\(2n\\). Nem szimmetrikus, csak pozitív értékeket vesz fel. Varianciabecsléskor jelenik meg: \\(\frac{(n-1)s^2}{\sigma^2} \sim \chi^2(n-1)\\).

<mark>Student-eloszlás</mark> (\\(t_n\\)): standard normálist elosztunk egy \\(\chi^2(n)/n\\) gyökével. Harangszerű és szimmetrikus, de szélesebb farkú mint a normális. Nagy \\(n\\)-nél normálishoz tart. Ismeretlen \\(\sigma\\) esetén a mintaátlag konfidenciaintervallumánál használjuk.

<mark>Fisher-eloszlás</mark> (\\(F_{n,k}\\)): két független \\(\chi^2\\) változó arányaként definiált. Két populáció varianciájának összehasonlítására használják (ANOVA, F-teszt, regresszió).