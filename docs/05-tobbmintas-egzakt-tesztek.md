---
layout: default
title: Többmintás és egzakt tesztek
---

# Többmintás és egzakt tesztek

## Miről szól ez a témakör?

Az eddig tanult tesztek (t-teszt, Mann–Whitney) két csoport összehasonlítására alkalmasak. De mi van, ha **három vagy több csoportot** kell összehasonlítani egyszerre? Erre valók a többmintás tesztek.

Az egzakt tesztek pedig akkor jönnek képbe, amikor a minta **túl kicsi** ahhoz, hogy a közelítő (aszimptotikus) eloszlásokat megbízzuk – ilyenkor kombinatorikai módszerekkel számítjuk a pontos valószínűségeket.

---

## Miért nem elég több kétmintás teszt?

Ha p csoportot akarunk összehasonlítani páronkénti t-tesztekkel, a szükséges tesztek száma négyzetes sebességgel nő. Például 5 csoportnál 10 t-tesztet kellene elvégezni. Ez két problémát okoz:

1. Sok tesztet kell elvégezni, ami erőforrás-igényes.
2. Ha sok tesztet végzünk, akkor véletlenszerűen is elutasíthatunk egy nullhipotézist – a Type I hiba valószínűsége megnő.

Ezért fejlesztették ki az ANOVA-t, amely egyetlen teszttel dönti el, van-e szignifikáns különbség a csoportok között.

---

## ANOVA (Analysis of Variance)

### Mi az ANOVA?

Az ANOVA a kétmintás t-teszt általánosítása több csoportra. Neve félrevezető lehet: bár varianciákat hasonlít össze, valójában a csoportátlagok egyenlőségét teszteli. Az ötlet: ha a csoportok átlagai egyenlők, akkor a csoportok közötti variancia nem lehet lényegesen nagyobb a csoportokon belüli varianciánál.

### Matematikai modell

<div class="concept" markdown="1">
**ANOVA modell:** p független normális minta egyenlő varianciával:

$$X_1^{(1)}, \ldots, X_{n_1}^{(1)} \sim N(m_1, \sigma^2), \quad \ldots, \quad X_1^{(p)}, \ldots, X_{n_p}^{(p)} \sim N(m_p, \sigma^2)$$

ahol N az összes megfigyelés száma, a mintán belüli és minták közötti megfigyelések mind függetlenek, és a varianciák egyenlők.

Minden megfigyelés felírható mint:

$$X_j^{(i)} = m + a_i + \varepsilon_{ij}$$

ahol m a súlyozott összátlag, \\(a_i\\) az i-edik csoport hatása, \\(\varepsilon_{ij} \sim N(0, \sigma)\\) a hibatag.
</div>

### A tesztstatisztika levezetése

<div class="tetel" markdown="1">
**One-way ANOVA**

**Feltételek:** p független normális minta, egyenlő (de ismeretlen) varianciák.

**H₀:** \\(m_1 = m_2 = \ldots = m_p\\) (minden csoport átlaga egyenlő)

**H₁:** legalább egy átlag különbözik

**Jelölések:**

$$\bar{X} = \frac{1}{N}\sum_{i=1}^p \sum_{j=1}^{n_i} X_j^{(i)} \quad \text{(összátlag)}$$

$$\bar{X}^{(i)} = \frac{1}{n_i}\sum_{j=1}^{n_i} X_j^{(i)} \quad \text{(i-edik csoport átlaga)}$$

**Négyzetösszegek:** a teljes variabilitást két részre bontjuk:

$$Q = Q_b + Q_w$$

ahol:
- \\(Q = \sum_{i=1}^p \sum_{j=1}^{n_i} (X_j^{(i)} - \bar{X})^2\\) – teljes négyzetösszeg (df: N−1)
- \\(Q_b = \sum_{i=1}^p n_i (\bar{X}^{(i)} - \bar{X})^2\\) – csoportok közötti négyzetösszeg (df: p−1)
- \\(Q_w = \sum_{i=1}^p \sum_{j=1}^{n_i} (X_j^{(i)} - \bar{X}^{(i)})^2\\) – csoportokon belüli négyzetösszeg (df: N−p)

**Tesztstatisztika:**

$$F = \frac{Q_b / (p-1)}{Q_w / (N-p)} \sim F_{p-1,\, N-p} \quad \text{ha H₀ igaz}$$

**Döntés:** elfogadjuk H₀-t, ha \\(F_{\text{test}} < F_{\varepsilon,\, p-1,\, N-p}\\).
</div>

<div class="callout tip" markdown="1">
**Tipp:** Az F-statisztika logikája: ha H₀ igaz (minden csoport átlaga egyenlő), a csoportok közötti variancia (\\(Q_b\\)) nem lehet lényegesen nagyobb a csoportokon belüli varianciánál (\\(Q_w\\)). Ha az arány túl nagy, elutasítjuk H₀-t.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** Az ANOVA alkalmazása előtt ellenőrizni kell a varianciák egyenlőségét – erre Bartlett-tesztet lehet használni (H₀: \\(\sigma_1 = \ldots = \sigma_p\\), tesztstatisztika \\(\chi^2_{p-1}\\) eloszlású).
</div>

---

## Welch ANOVA

<div class="concept" markdown="1">
**Welch ANOVA:** az ANOVA kiterjesztése arra az esetre, amikor a csoportok varianciái nem egyenlők. Ugyanúgy p csoport átlagának egyenlőségét teszteli, de nem feltételezi az egyenlő varianciákat.

**H₀:** \\(m_1 = m_2 = \ldots = m_p\\)

<div class="callout trap" markdown="1">
**TODO:** Welch ANOVA részletes leírása nem szerepel a PDF-ben – utánanézni és pótolni.
</div>
</div>

---

## Ismételt méréses ANOVA (Repeated-measures ANOVA)

### Mi ez és mikor használjuk?

A hagyományos ANOVA független csoportokat feltételez. De mi van, ha **ugyanazokat a személyeket** mérjük meg többször (pl. alvásmegvonás hatása 24, 36 és 48 óra után)? Ilyenkor a megfigyelések nem függetlenek – ugyanaz a személy szerepel minden csoportban. Ez a páros t-teszt általánosítása p csoportra.

<div class="tetel" markdown="1">
**Repeated-measures ANOVA**

**Feltételek:** p összefüggő minta (ugyanazon n személy p feltétel alatt mérve).

**H₀:** \\(m_1 = m_2 = \ldots = m_p\\)

**H₁:** legalább egy átlag különbözik

**Alapötlet:** a csoportokon belüli négyzetösszeget (\\(Q_w\\)) tovább bontjuk:

$$Q_w = Q_s + Q_e$$

ahol \\(Q_s\\) az egyéni különbségeket méri (személyek közötti variabilitás), \\(Q_e\\) a maradék hibát. Az egyéni különbségek kiszűrésével pontosabb tesztet kapunk.

**Négyzetösszegek és szabadsági fokok:**

$$Q_b = \sum_{i=1}^p \frac{T_i^2}{n} - \frac{G^2}{N}, \quad df_b = p-1$$

$$Q_s = \sum_{j=1}^n \frac{P_j^2}{p} - \frac{G^2}{N}, \quad df_s = n-1$$

$$Q_e = Q_w - Q_s, \quad df_e = (n-1)(p-1)$$

ahol \\(T_i\\) az i-edik feltétel összege, \\(P_j\\) a j-edik személy összege, G az összes érték összege.

**Tesztstatisztika:**

$$F = \frac{Q_b / (p-1)}{Q_e / (n-1)(p-1)} \sim F_{p-1,\, (n-1)(p-1)} \quad \text{ha H₀ igaz}$$

**Döntés:** elfogadjuk H₀-t, ha \\(F_{\text{test}} < F_{\varepsilon,\, p-1,\, (n-1)(p-1)}\\).
</div>

---

## Kruskal–Wallis-teszt

### Mi ez és mikor használjuk?

Ha az ANOVA feltételei nem teljesülnek (nem normális eloszlás, kis minta), a Kruskal–Wallis-teszt a nemparaméteres alternatíva. A Mann–Whitney-teszt általánosítása p csoportra – rangokat használ az eredeti értékek helyett.

<div class="eljaras" markdown="1">
**Feltételek:** p független minta ordinális változókkal.

**H₀:** \\(m_1 = m_2 = \ldots = m_p\\) (azonos mediánok, azonos eloszlások)

**H₁:** legalább egy medián különbözik

**Számítás:** vonjuk össze az összes mintát (N elem összesen), rangsoroljuk, majd \\(R_i\\) jelöli az i-edik csoport rangösszegét.

**Tesztstatisztika:**

$$T = \frac{12}{N(N+1)} \sum_{i=1}^p \frac{R_i^2}{n_i} - 3(N+1)$$

**Aszimptotikus eloszlás:** kis mintánál Kruskal–Wallis-táblázatból, nagy mintánál \\(T \xrightarrow{D} \chi^2_{p-1}\\).

**Döntés:** elfogadjuk H₀-t, ha \\(T < \chi^2_{\varepsilon,\, p-1}\\).
</div>

<div class="callout tip" markdown="1">
**Tipp:** A Kruskal–Wallis ugyanolyan viszonyban áll az ANOVA-val, mint a Mann–Whitney a kétmintás t-teszttel – a nemparaméteres megfelelője.
</div>

---

## Friedman-teszt

### Mi ez és mikor használjuk?

A Friedman-teszt az ismételt méréses ANOVA nemparaméteres megfelelője – akkor használjuk, ha ugyanazokat a személyeket mérjük p feltétel alatt, de az adatok ordinálisak vagy nem normálisak.

<div class="eljaras" markdown="1">
**Feltételek:** p összefüggő minta (n személy, p feltétel), ordinális változók.

**H₀:** \\(m_1 = m_2 = \ldots = m_p\\) (azonos mediánok)

**H₁:** legalább egy medián különbözik

**Számítás:** minden személyen belül rangsoroljuk a p értéket (1-től p-ig), majd \\(R_i\\) jelöli az i-edik feltétel rangösszegét.

**Tesztstatisztika:**

$$T = \frac{12}{np(p+1)} \sum_{i=1}^p R_i^2 - 3n(p+1)$$

**Aszimptotikus eloszlás:** kis mintánál Friedman-táblázatból, nagy mintánál \\(T \xrightarrow{D} \chi^2_{p-1}\\).

**Döntés:** elfogadjuk H₀-t, ha \\(T < \chi^2_{\varepsilon,\, p-1}\\).
</div>

---

## Fisher-féle egzakt teszt

### Mi ez és mikor használjuk?

A \\(\chi^2\\)-teszt csak akkor megbízható, ha minden cellában elég sok megfigyelés van. Ha a minta kicsi (várható cellafrekvenciák < 5), a közelítés pontatlan. Ilyenkor Fisher-féle egzakt tesztet alkalmazunk, amely kombinatorikai módszerrel számolja a pontos valószínűségeket.

### A teáscsészés probléma (Lady Tasting Tea)

Ez a teszt eredetéhez kapcsolódó klasszikus példa, amelyet a vizsgán tudni kell.

Egy cambridge-i teapartin egy hölgy azt állította, meg tudja mondani, hogy a teáscsészébe először a teát vagy a tejet töltötték-e. Fisher kísérlete: 8 csésze, 4-4 mindkét fajtából, véletlenszerű sorrendben. A hölgynek ki kellett választania a 4 "tea először" csészét. 3-at talált el.

**Kérdés:** igaza van-e a hölgynek, vagy csak szerencséje volt?

<div class="eljaras" markdown="1">
**Feltételek:** 2×2-es kontingenciatábla, kis minta, sor- és oszlopösszegek rögzítettek.

**H₀:** a hölgy tippjei és a valódi sorrend független (nem tud különbséget tenni)

**H₁:** a tippek és a valóság összefüggenek

**A kontingenciatábla:**

<table>
  <thead>
    <tr><th></th><th>Hölgy: tea először</th><th>Hölgy: tej először</th></tr>
  </thead>
  <tbody>
    <tr><td>Valóban tea először</td><td>3</td><td>1</td></tr>
    <tr><td>Valóban tej először</td><td>1</td><td>3</td></tr>
  </tbody>
</table>

**Miért nem \\(\chi^2\\)-teszt?** A minta túl kicsi – a \\(\chi^2\\) közelítés nem megbízható.

**Fisher egzakt p-érték:** ha H₀ igaz, a hölgy véletlenszerűen választ 4 csészét a 8-ból. A legalább 3 helyes találat valószínűsége:

$$P(\text{legalább 3 helyes}) = \frac{\binom{4}{3}\binom{4}{1} + \binom{4}{4}\binom{4}{0}}{\binom{8}{4}} = \frac{16+1}{70} = \frac{17}{70} \approx 0.243$$

**Döntés:** mivel a p-érték (0.243) nagyobb mint \\(\varepsilon = 0.2\\), nem tudjuk elutasítani H₀-t. A hölgy eredménye nem elég meggyőző bizonyíték.
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** Az egzakt tesztet akkor alkalmazzuk, ha a sor- és oszlopösszegek rögzítettek, a minta kicsi, vagy a várható cellafrekvenciák több mint 20%-a kisebb 5-nél. A p-értéket kombinatorikával, hipergeometrikus eloszlással számítjuk.
</div>

---

## Binomiális teszt

### Mi ez és mikor használjuk?

Ha kis mintából szeretnénk eldönteni, hogy egy kétértékű változó (pl. hibás/nem hibás) aránya egyenlő-e egy adott értékkel, a binomiális egzakt teszt adja a pontos p-értéket – szemben a nagy mintás z-teszttel.

<div class="eljaras" markdown="1">
**Feltételek:** \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim} \text{Bernoulli}(p)\\), kis minta.

**H₀:** \\(p \geq p_0\\) vs **H₁:** \\(p < p_0\\)

**Tesztstatisztika:** \\(Z = \sum_{i=1}^n X_i \sim \text{Binom}(n, p)\\)

**p-érték:**

$$P\!\left(\sum X_i \leq k\right) = \sum_{j=0}^k \binom{n}{j} p_0^j (1-p_0)^{n-j}$$

**Döntés:** elfogadjuk H₀-t, ha p-érték > \\(\varepsilon\\).

**Nagy mintánál** z-tesztet alkalmazunk (CLT alapján):

$$T = \frac{\hat{p} - p_0}{\sqrt{p_0(1-p_0)/n}} \overset{\text{approx.}}{\sim} N(0,1)$$
</div>

---

## McNemar-teszt

<div class="concept" markdown="1">
**McNemar-teszt:** páros kategorikus adatok összehasonlítására használják – például ugyanazon személyek véleményét mérjük két időpontban, és azt vizsgáljuk, változott-e az arány.

<div class="callout trap" markdown="1">
**TODO:** McNemar-teszt részletes leírása nem szerepel a PDF-ben – utánanézni és pótolni.
</div>
</div>

---

## Összefoglaló

<table>
  <thead>
    <tr><th>Teszt</th><th>Minta</th><th>H₀</th><th>Határeloszlás</th></tr>
  </thead>
  <tbody>
    <tr><td>One-way ANOVA</td><td>p független normális</td><td>m₁ = ... = mₚ</td><td>F(p−1, N−p)</td></tr>
    <tr><td>Welch ANOVA</td><td>p független normális, egyenlőtlen σ</td><td>m₁ = ... = mₚ</td><td>közelítő F</td></tr>
    <tr><td>Ismételt méréses ANOVA</td><td>p összefüggő normális</td><td>m₁ = ... = mₚ</td><td>F(p−1, (n−1)(p−1))</td></tr>
    <tr><td>Kruskal–Wallis</td><td>p független ordinális</td><td>m₁ = ... = mₚ</td><td>χ²(p−1)</td></tr>
    <tr><td>Friedman</td><td>p összefüggő ordinális</td><td>m₁ = ... = mₚ</td><td>χ²(p−1)</td></tr>
    <tr><td>Fisher egzakt</td><td>2×2 tábla, kis minta</td><td>függetlenség</td><td>hipergeometrikus</td></tr>
    <tr><td>Binomiális teszt</td><td>Bernoulli, kis minta</td><td>p = p₀</td><td>binomiális / normális</td></tr>
    <tr><td>McNemar</td><td>páros kategorikus</td><td>arányok egyenlők</td><td>TODO</td></tr>
  </tbody>
</table>