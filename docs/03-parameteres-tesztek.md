---
layout: default
title: Paraméteres tesztek
---

# Paraméteres tesztek

## Miről szól ez a témakör?

Eddig paramétereket becsültünk. Most más kérdést teszünk fel: **igaz-e egy állítás a paraméterről?** Például: "a gyár által állított átlagos aktiválási hőmérséklet valóban 130 fok?" Ezt hipotézisvizsgálattal döntjük el.

A paraméteres tesztek akkor alkalmazhatók, ha a minta normális eloszlásból jön, és a hipotézis az eloszlás paramétereire (várható érték, variancia) vonatkozik.

---

## Null- és alternatív hipotézis

<div class="concept" markdown="1">
**Statisztikai hipotézis:** állítás egy paraméter értékéről, több paraméterről, vagy egy eloszlás alakjáról.

**Nullhipotézis (\\(H_0\\)):** az az állítás, amelyet kezdetben igaznak feltételezünk. Általában egyenlőséget tartalmaz, pl. \\(H_0: \mu = 130\\).

**Alternatív hipotézis (\\(H_1\\)):** a \\(H_0\\)-val ellentétes állítás, amit bizonyítani szeretnénk.

A döntés mindig: **elutasítjuk \\(H_0\\)-t** vagy **nem utasítjuk el \\(H_0\\)-t**. Fontos: "nem utasítjuk el" nem jelenti azt, hogy "bebizonyítottuk" – csak azt, hogy az adatok nem mondtak ellent elég erősen.
</div>

<div class="callout tip" markdown="1">
**Tipp:** Amit "bizonyítani" akarunk, azt mindig \\(H_1\\)-nek tesszük. Például ha egy új gyógyszer hatékonyságát akarjuk bizonyítani: \\(H_0\\): nem hatékony, \\(H_1\\): hatékony.
</div>

---

## Egy- és kétoldali tesztek

<div class="concept" markdown="1">
A nullhipotézis általában \\(\theta = \theta_0\\) alakú. Az alternatív hipotézis háromféle lehet:

<table>
  <thead>
    <tr><th>Típus</th><th>H1 alakja</th><th>Mikor használjuk</th></tr>
  </thead>
  <tbody>
    <tr><td>Jobboldali (right-tailed)</td><td>θ &gt; θ₀</td><td>Ha azt várjuk, hogy a valódi érték nagyobb</td></tr>
    <tr><td>Baloldali (left-tailed)</td><td>θ &lt; θ₀</td><td>Ha azt várjuk, hogy a valódi érték kisebb</td></tr>
    <tr><td>Kétoldali (two-tailed)</td><td>θ ≠ θ₀</td><td>Ha csak annyit tudunk, hogy különbözik</td></tr>
  </tbody>
</table>
</div>

---

## Tesztstatisztika, kritikus tartomány, elfogadási tartomány

<div class="concept" markdown="1">
**Tesztstatisztika:** a mintából számolt mennyiség, amely méri, mennyire "ütközik" az adat a \\(H_0\\)-val. Minél szélsőségesebb az értéke, annál inkább ellentmond \\(H_0\\)-nak.

**Kritikus tartomány (rejection region, R):** a tesztstatisztika azon értékeinek halmaza, amelyek esetén elutasítjuk \\(H_0\\)-t.

**Elfogadási tartomány (acceptance region):** a kritikus tartomány komplementere. Ha a tesztstatisztika ide esik, nem utasítjuk el \\(H_0\\)-t.

**Döntési szabály:** elutasítjuk \\(H_0\\)-t, ha a tesztstatisztika a kritikus tartományba esik.

**Kritikus értékek:** a \\(C_1(\varepsilon)\\) és \\(C_2(\varepsilon)\\) számok, amelyekre:

$$P_\theta(C_1(\varepsilon) < T_n < C_2(\varepsilon)) > 1 - \varepsilon$$

Általában szimmetrikus esetben \\(C_2(\varepsilon) = -C_1(\varepsilon)\\).
</div>

---

## I. és II. típusú hiba

<div class="concept" markdown="1">
Kétféle hibát követhetünk el:

| | \\(H_0\\) igaz | \\(H_0\\) hamis |
|---|---|---|
| **Nem utasítjuk el \\(H_0\\)-t** | Helyes döntés | **II. típusú hiba (\\(\beta\\))** |
| **Elutasítjuk \\(H_0\\)-t** | **I. típusú hiba** | Helyes döntés |

**I. típusú hiba:** elutasítjuk \\(H_0\\)-t, pedig igaz. Valószínűsége:

$$P(\text{I. típusú hiba}) = P(T_n \in R \mid H_0)$$

**II. típusú hiba (\\(\beta\\)):** nem utasítjuk el \\(H_0\\)-t, pedig hamis:

$$\beta(\theta) = P(\text{Elfogadjuk } H_0 \mid H_1 \text{ igaz})$$
</div>

<div class="callout tip" markdown="1">
**Tipp:** A két hiba között trade-off van. Ha szigorítjuk a tesztet (kisebb kritikus tartomány), az I. típusú hiba csökken, de a II. típusú hiba nő – és fordítva. Ezért rögzítjük az I. típusú hiba maximumát (szignifikanciaszint), és ezen belül minimalizáljuk a II. típusú hibát.
</div>

---

## Szignifikanciaszint

<div class="concept" markdown="1">
**Szignifikanciaszint (\\(\varepsilon\\)):** az I. típusú hiba maximálisan megengedett valószínűsége. Ha \\(P(\text{I. típusú hiba}) \leq \varepsilon\\), a teszt **\\(\varepsilon\\) szintű teszt**. Minél nagyobb \\(\varepsilon\\), annál merészebben utasítja el a teszt \\(H_0\\)-t.

Tipikus értékek: \\(\varepsilon = 0.01\\), \\(\varepsilon = 0.05\\), \\(\varepsilon = 0.1\\).

Fontos: elfogadhatjuk \\(H_0\\)-t egy adott szignifikanciaszinten, és elutasíthatjuk egy magasabb szinten.
</div>

---

## p-érték

<div class="concept" markdown="1">
**p-érték:** annak valószínűsége, hogy – feltéve, hogy \\(H_0\\) igaz – legalább olyan extrém tesztstatisztika értéket kapnánk, mint amit a mintából kaptunk.

<p>Hogyan számoljuk:</p>
<ul>
  <li>Jobboldali teszt: P(Z ≥ z) vagy P(T<sub>n-1</sub> ≥ t)</li>
  <li>Baloldali teszt: P(Z ≤ z) vagy P(T<sub>n-1</sub> ≤ t)</li>
  <li>Kétoldali teszt: 2 × P(Z ≤ −|z|) vagy 2 × P(T<sub>n-1</sub> ≤ −|t|)</li>
</ul>

**Döntési szabály p-értékkel:** elutasítjuk \\(H_0\\)-t, ha \\(\text{p-value} < \varepsilon\\).

A p-érték és a kritikus értékes módszer ekvivalens – csak két különböző módja ugyanannak a döntésnek. A p-érték azért praktikusabb, mert nem kell eloszlástáblázatot nézni.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** A p-érték NEM annak valószínűsége, hogy \\(H_0\\) igaz. A p-érték azt mondja: "ha \\(H_0\\) igaz lenne, mekkora valószínűséggel kapnánk ilyen extrém adatot?" Ez egy feltételes valószínűség – nem \\(H_0\\) valószínűsége.
</div>

---

## Független mintás és páros mintás tesztek

<div class="concept" markdown="1">
**Független mintás teszt (independent-samples test):** a két minta teljesen független egymástól – különböző személyek, különböző csoportok.

**Páros mintás teszt (paired-samples test):** a két minta páronként összetartozó – például ugyanazon személyek mérése kezelés előtt és után. Ilyenkor a különbségekre végzünk egymintás tesztet.
</div>

---

## Nagy mintás tesztek

<div class="concept" markdown="1">
**Nagy mintás teszt (large-sample test):** ha nem tudjuk, milyen az eloszlás, de a minta nagy, a Centrális Határeloszlás tétel alapján a tesztstatisztika közelítőleg standard normális:

$$Z = \frac{\bar{X} - \mu_0}{s_n^{\ast}/\sqrt{n}} \overset{\text{approx.}}{\sim} N(0,1)$$

A döntési szabály ugyanaz mint a z-tesztnél.
</div>

---

## z-teszt

### Egymintás, kétoldali z-teszt

<div class="tetel" markdown="1">
**Feltételek:** ...

**Levezetés:** Ha H₀ igaz, X̄ ~ N(μ₀, σ²/n), standardizálva:

$$Z = \frac{\bar{X} - \mu_0}{\sigma/\sqrt{n}} \sim N(0,1)$$

A standard normális szimmetriája miatt:

$$1-\varepsilon = P(|Z| < c \mid H_0) = 2\Phi(c) - 1 \implies c = z_{\varepsilon/2} = \Phi^{-1}\!\left(1 - \frac{\varepsilon}{2}\right)$$

**Döntés:** elfogadjuk H₀-t, ha:

$$\left|\frac{\bar{X} - \mu_0}{\sigma/\sqrt{n}}\right| \leq z_{\varepsilon/2}$$
</div>

### Egymintás, egyoldali z-teszt

<div class="tetel" markdown="1">
**Feltételek:** ugyanaz mint fent.

**Döntés:**
- Jobboldali (\\(H_0: \mu \leq \mu_0\\) vs \\(H_1: \mu > \mu_0\\)): elfogadjuk \\(H_0\\)-t, ha \\(z_{\text{test}} \leq z_\varepsilon\\)
- Baloldali (\\(H_0: \mu \geq \mu_0\\) vs \\(H_1: \mu < \mu_0\\)): elfogadjuk \\(H_0\\)-t, ha \\(z_{\text{test}} \geq -z_\varepsilon\\)
</div>

### Kétmintás, kétoldali z-teszt

<div class="tetel" markdown="1">
**Feltételek:** két független normális minta, mindkét variancia ismert:

$$X_1,\ldots,X_n \overset{\text{iid}}{\sim} N(\mu_X, \sigma_X^2), \quad Y_1,\ldots,Y_m \overset{\text{iid}}{\sim} N(\mu_Y, \sigma_Y^2)$$

**Hipotézisek:** \\(H_0: \mu_X = \mu_Y\\) vs \\(H_1: \mu_X \neq \mu_Y\\)

**Levezetés:** \\(H_0\\) alatt \\(\bar{X} - \bar{Y} \sim N(0, \sigma_X^2/n + \sigma_Y^2/m)\\), standardizálva:

$$Z = \frac{\bar{X}_n - \bar{Y}_m}{\sqrt{\frac{\sigma_X^2}{n} + \frac{\sigma_Y^2}{m}}} \sim N(0,1)$$

**Döntés:** elfogadjuk \\(H_0\\)-t, ha \\(|z_{\text{test}}| < z_{\varepsilon/2}\\).
</div>

### Kétmintás, egyoldali z-teszt

<div class="tetel" markdown="1">
**Döntés:**
- Baloldali (\\(H_0: \mu_X \geq \mu_Y\\)): elfogadjuk \\(H_0\\)-t, ha \\(-z_\varepsilon < z_{\text{test}}\\)
- Jobboldali (\\(H_0: \mu_X \leq \mu_Y\\)): elfogadjuk \\(H_0\\)-t, ha \\(z_{\text{test}} < z_\varepsilon\\)
</div>

---

## t-teszt

Ha \\(\sigma\\) ismeretlen, \\(s_n^{\ast}\\)-gal helyettesítjük. Ekkor t-eloszlást kapunk, mert \\(s_n^{\ast}\\) maga is véletlenszerű – ez extra bizonytalanságot visz be.

### Egymintás, kétoldali t-teszt

<div class="tetel" markdown="1">
**Feltételek:** \\(X_1,\ldots,X_n \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\\), \\(\sigma^2\\) ismeretlen.

**Hipotézisek:** \\(H_0: \mu = \mu_0\\) vs \\(H_1: \mu \neq \mu_0\\)

**Tesztstatisztika:**

$$T = \frac{\bar{X} - \mu_0}{s_n^{\ast}/\sqrt{n}} \sim t_{n-1} \quad \text{ha } H_0 \text{ igaz}$$

**Döntés:** elfogadjuk \\(H_0\\)-t, ha \\(|t_{\text{test}}| < t_{\varepsilon/2,\, n-1}\\).
</div>

### Egymintás, egyoldali t-teszt

<div class="tetel" markdown="1">
**Döntés:**
- Baloldali (\\(H_0: \mu \geq \mu_0\\)): elfogadjuk \\(H_0\\)-t, ha \\(-t_{\varepsilon, n-1} < t_{\text{test}}\\)
- Jobboldali (\\(H_0: \mu \leq \mu_0\\)): elfogadjuk \\(H_0\\)-t, ha \\(t_{\text{test}} < t_{\varepsilon, n-1}\\)
</div>

### Kétmintás t-teszt

<div class="tetel" markdown="1">
**Feltételek:** két független normális minta, ismeretlen de egyenlő varianciák (\\(\sigma_X^2 = \sigma_Y^2 = \sigma^2\\)).

**Hipotézisek:** \\(H_0: \mu_X = \mu_Y\\) vs \\(H_1: \mu_X \neq \mu_Y\\)

**Tesztstatisztika:**

$$T = \frac{\bar{X}_n - \bar{Y}_m}{\sqrt{(n-1)(s_{X,n}^{\ast})^2 + (m-1)(s_{Y,m}^{\ast})^2}} \cdot \sqrt{\frac{nm(n+m-2)}{n+m}} \sim t_{n+m-2}$$

**Döntés (kétoldali):** elfogadjuk H₀-t, ha:

$$|t_{\text{test}}| < t_{\varepsilon/2,\, n+m-2}$$

**Döntés (egyoldali):**
- Baloldali: elfogadjuk \\(H_0\\)-t, ha \\(-t_{\varepsilon, n+m-2} < t_{\text{test}}\\)
- Jobboldali: elfogadjuk \\(H_0\\)-t, ha \\(t_{\text{test}} < t_{\varepsilon, n+m-2}\\)
</div>

<div class="callout trap" markdown="1">
**Figyelem:** A kétmintás t-teszt csak akkor alkalmazható, ha a varianciák egyenlők. Ezt előbb F-teszttel kell ellenőrizni. Ha az F-teszt elveti az egyenlőséget, Welch-tesztet kell használni.
</div>

### Páros t-teszt

<div class="tetel" markdown="1">
**Mikor használjuk:** ha a két minta páronként összetartozó (pl. ugyanazon személyek mérése kezelés előtt és után).

**Alapötlet:** számítsuk ki a különbségeket \\(D_i = X_i - Y_i\\), és ezeken végezzük az egymintás t-tesztet. Azért nem alkalmazható a kétmintás t-teszt, mert \\(X_i\\) és \\(Y_i\\) nem feltétlenül független, ezért \\(\sigma_{X-Y}^2 \neq \sigma_X^2 + \sigma_Y^2\\).

**Hipotézisek:** \\(H_0: \mu_X = \mu_Y\\) vs \\(H_1: \mu_X \neq \mu_Y\\)

**Tesztstatisztika:**

$$T = \frac{\bar{X}_n - \bar{Y}_n}{s_{X-Y,n}^{\ast}/\sqrt{n}} \sim t_{n-1} \quad \text{ha } H_0 \text{ igaz}$$

Ha a minta nem normális, nagy mintánál nagy mintás tesztet lehet használni.
</div>

---

## F-teszt

A kétmintás t-teszt alkalmazása előtt ellenőrizni kell, hogy a két variancia egyenlő-e. Erre való az F-teszt.

<div class="tetel" markdown="1">
**Feltételek:** két független normális minta, ismeretlen várható értékek és varianciák.

**Hipotézisek:** \\(H_0: \sigma_X^2 = \sigma_Y^2\\) vs \\(H_1: \sigma_X \neq \sigma_Y\\)

**Tesztstatisztika:** ha \\(s_{X,n}^{\ast} \geq s_{Y,m}^{\ast}\\):

$$F = \frac{(s_{X,n}^{\ast})^2}{(s_{Y,m}^{\ast})^2} \sim F_{n-1,\, m-1} \quad \text{ha } H_0 \text{ igaz}$$

**Döntés:** legyen \\(F_\varepsilon\\) a kritikus érték. Elfogadjuk \\(H_0\\)-t, ha \\(F_{\text{test}} < F_\varepsilon\\).
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** Az F-teszt logikája: ha a két variancia egyenlő, a mintavarianciák hányadosa F-eloszlást követ. Ha a hányados túl nagy (messze van 1-től), elutasítjuk az egyenlőséget, és Welch-tesztet kell használni.
</div>

---

## Welch-teszt

<div class="tetel" markdown="1">
**Mikor használjuk:** ha az F-teszt elveti a varianciák egyenlőségét.

**Feltételek:** két független normális minta, ismeretlen és nem feltétlenül egyenlő varianciák.

**Hipotézisek:** \\(H_0: \mu_X = \mu_Y\\) vs \\(H_1: \mu_X \neq \mu_Y\\)

**Tesztstatisztika:**

$$W_{n,m} = \frac{\bar{X}_n - \bar{Y}_m}{\sqrt{\frac{(s_{X,n}^{\ast})^2}{n} + \frac{(s_{Y,m}^{\ast})^2}{m}}}$$

Welch megmutatta, hogy \\(H_0\\) esetén \\(W_{n,m}\\) közelítőleg \\(t_{[f]}\\) eloszlású, ahol a szabadsági fok:

$$\frac{1}{f} = \frac{c^2}{n-1} + \frac{(1-c)^2}{m-1}, \quad c = \frac{(s_{X,n}^{\ast})^2/n}{(s_{X,n}^{\ast})^2/n + (s_{Y,m}^{\ast})^2/m}$$

A szabadsági fok képlete **nem szükséges a vizsgán.**

**Döntés:**

Kétoldali – elfogadjuk H₀-t, ha:
$$|t_{\text{test}}| < t_{\varepsilon/2, f}$$

Jobboldali – elfogadjuk H₀-t, ha:
$$t_{\text{test}} \leq t_{\varepsilon, f}$$

Baloldali – elfogadjuk H₀-t, ha:
$$t_{\text{test}} \geq -t_{\varepsilon, f}$$
</div>

---

## Hipotézisvizsgálat általános lépései

<div class="eljaras" markdown="1">
**Lépések:**

1. Válasszuk ki a megfelelő tesztet
2. Rögzítsük a szignifikanciaszintet \\(\varepsilon\\)-t
3. Olvassuk le a kritikus értéket a megfelelő eloszlástáblázatból
4. Számítsuk ki a tesztstatisztika értékét a mintából
5. Hasonlítsuk össze a kritikus értékkel és hozzuk meg a döntést
</div>

<div class="callout exam" markdown="1">
<table>
  <thead>
    <tr><th>Teszt</th><th>Minta</th><th>σ</th><th>Feltétel</th></tr>
  </thead>
  <tbody>
    <tr><td>Egymintás z</td><td>1 minta</td><td>ismert</td><td>normális</td></tr>
    <tr><td>Nagy mintás z</td><td>1 minta</td><td>ismeretlen</td><td>nagy n</td></tr>
    <tr><td>Egymintás t</td><td>1 minta</td><td>ismeretlen</td><td>normális</td></tr>
    <tr><td>Kétmintás z</td><td>2 független</td><td>mindkettő ismert</td><td>normális</td></tr>
    <tr><td>F-teszt</td><td>2 független</td><td>ismeretlen</td><td>varianciák összehasonlítása</td></tr>
    <tr><td>Kétmintás t</td><td>2 független</td><td>ismeretlen, egyenlő</td><td>F-teszt nem utasított el</td></tr>
    <tr><td>Welch</td><td>2 független</td><td>ismeretlen, nem egyenlő</td><td>F-teszt elutasított</td></tr>
    <tr><td>Páros t</td><td>2 függő pár</td><td>ismeretlen</td><td>összetartozó megfigyelések</td></tr>
  </tbody>
</table>
</div>