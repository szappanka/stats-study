---
layout: default
title: Paraméteres tesztek
---

# Paraméteres tesztek

## Miről szól ez a témakör?

Eddig paramétereket becsültünk. Most más kérdést teszünk fel: **igaz-e egy állítás a paraméterről?** Például: "a gyár által állított átlagos aktiválási hőmérséklet valóban 130 fok?" Ezt hipotézisvizsgálattal döntjük el.

A paraméteres tesztek akkor alkalmazhatók, ha a minta normális eloszlásból jön, és a hipotézis az eloszlás paramétereire (várható érték, variancia) vonatkozik.

---

## Alapfogalmak

### Null- és alternatív hipotézis

<mark>Statisztikai hipotézis</mark>: állítás egy paraméter értékéről, több paraméterről, vagy egy eloszlás alakjáról.

<mark>Nullhipotézis</mark> (\\(H_0\\)): az az állítás, amelyet kezdetben igaznak feltételezünk – az "alapértelmezett hit". Általában egy egyenlőséget tartalmaz (pl. \\(H_0: \mu = 130\\)).

<mark>Alternatív hipotézis</mark> (\\(H_1\\)): a \\(H_0\\)-val ellentétes állítás, amit bizonyítani szeretnénk.

A döntés mindig: **elutasítjuk \\(H_0\\)-t** vagy **nem utasítjuk el \\(H_0\\)-t** (nem "elfogadjuk" – ez fontos különbség!).

<div class="callout tip" markdown="1">
**Tipp:** A logika olyan mint egy bírósági tárgyaláson: \\(H_0\\) az ártatlanság vélelme. Csak akkor ítélünk el (utasítjuk el \\(H_0\\)-t), ha az adatok ezt "nagyon erősen" indokolják. Ha nem elég a bizonyíték, "nem utasítjuk el" – de ez nem jelenti, hogy bebizonyítottuk az ártatlanságot.
</div>

**Amit "bizonyítani" akarunk, azt mindig \\(H_1\\)-nek tesszük.** Például: ha új gyógyszer hatékonyságát akarjuk bizonyítani, \\(H_0\\): nem hatékony, \\(H_1\\): hatékony.

### Egy- és kétoldali tesztek

A nullhipotézis általában \\(\theta = \theta_0\\) alakú. Az alternatív hipotézis három féle lehet:

| Típus | \\(H_1\\) alakja | Mikor használjuk |
|---|---|---|
| **Jobboldali (right-tailed)** | \\(\theta > \theta_0\\) | Ha azt várjuk, hogy a valódi érték nagyobb |
| **Baloldali (left-tailed)** | \\(\theta < \theta_0\\) | Ha azt várjuk, hogy a valódi érték kisebb |
| **Kétoldali (two-tailed)** | \\(\theta \neq \theta_0\\) | Ha csak annyit tudunk, hogy különbözik |

### Tesztstatisztika, kritikus tartomány, elfogadási tartomány

<mark>Tesztstatisztika</mark>: a mintából számolt mennyiség, amely méri, mennyire "ütközik" az adat a \\(H_0\\)-val. Minél szélsőségesebb az értéke, annál inkább ellentmond \\(H_0\\)-nak.

<mark>Kritikus tartomány (rejection region, R)</mark>: a tesztstatisztika azon értékeinek halmaza, amelyek esetén elutasítjuk \\(H_0\\)-t.

<mark>Elfogadási tartomány (acceptance region)</mark>: a kritikus tartomány komplementere – ha a tesztstatisztika ide esik, nem utasítjuk el \\(H_0\\)-t.

A döntési szabály: **elutasítjuk \\(H_0\\)-t, ha a tesztstatisztika a kritikus tartományba esik.**

### I. és II. típusú hiba

Kétféle hibát követhetünk el:

| | \\(H_0\\) igaz | \\(H_0\\) hamis |
|---|---|---|
| **Nem utasítjuk el \\(H_0\\)-t** | Helyes döntés | **II. típusú hiba (\\(\beta\\))** |
| **Elutasítjuk \\(H_0\\)-t** | **I. típusú hiba** | Helyes döntés (power) |

<mark>I. típusú hiba</mark>: elutasítjuk \\(H_0\\)-t, pedig igaz. Valószínűsége:

$$P(\text{I. típusú hiba}) = P(\text{Elutasítjuk } H_0 \mid H_0 \text{ igaz}) = P(T_n \in R \mid H_0)$$

<mark>II. típusú hiba</mark> (\\(\beta\\)): nem utasítjuk el \\(H_0\\)-t, pedig hamis:

$$\beta(\theta) = P(\text{Elfogadjuk } H_0 \mid H_1 \text{ igaz})$$

<div class="callout tip" markdown="1">
**Tipp:** A két hiba között trade-off van. Ha szigorítjuk a tesztet (kisebb kritikus tartomány), az I. típusú hiba csökken, de a II. típusú hiba nő. Mint a tűzjelző: ha kevésbé érzékeny, kevesebb hamis riasztás (kisebb I.), de több valódi tüzet nem jelez (nagyobb II.).
</div>

### Szignifikanciaszint

<mark>Szignifikanciaszint</mark> (\\(\varepsilon\\)): az I. típusú hiba maximálisan megengedett valószínűsége. Ha \\(P(\text{I. típusú hiba}) \leq \varepsilon\\), akkor a teszt **\\(\varepsilon\\) szintű teszt**. Minél nagyobb \\(\varepsilon\\), annál merészebben utasítja el a teszt \\(H_0\\)-t.

Tipikus értékek: \\(\varepsilon = 0.05\\) (5%) vagy \\(\varepsilon = 0.01\\) (1%).

### p-érték (p-value)

<mark>p-érték</mark>: annak valószínűsége, hogy – feltéve, hogy \\(H_0\\) igaz – legalább olyan extrém tesztstatisztika értéket kapunk, mint amit a mintából kaptunk.

$$\text{p-value} = P(Z \geq z \mid H_0 \text{ igaz}) \quad \text{(jobboldali teszt esetén)}$$

**Hogyan számoljuk:**
- Jobboldali teszt: \\(P(Z \geq z)\\) vagy \\(P(T_{n-1} \geq t)\\)
- Baloldali teszt: \\(P(Z \leq z)\\) vagy \\(P(T_{n-1} \leq t)\\)
- Kétoldali teszt: \\(2 \times P(Z \leq -|z|)\\) vagy \\(2 \times P(T_{n-1} \leq -|t|)\\)

**Döntési szabály p-értékkel:** elutasítjuk \\(H_0\\)-t, ha \\(\text{p-value} < \varepsilon\\).

<div class="callout tip" markdown="1">
**Tipp:** A p-érték és a kritikus értékű módszer ugyanannak két oldala. A p-érték azért praktikusabb, mert közvetlenül megmutatja, mennyire "meglepő" az adat \\(H_0\\) alatt – az olvasónak nem kell ismernie az eloszlástáblákat.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** A p-érték NEM annak valószínűsége, hogy \\(H_0\\) igaz. Ez a leggyakoribb félreértés. A p-érték egy feltételes valószínűség: feltéve, hogy \\(H_0\\) igaz, mekkora valószínűséggel kapnánk ilyen extrém adatot?
</div>

### Konfidenciaintervallum és hipotézisvizsgálat kapcsolata

A tesztstatisztika a kritikus tartományba esik pontosan akkor, ha a \\((1-\varepsilon) \cdot 100\%\\)-os konfidenciaintervallum **nem** tartalmazza \\(\mu_0\\)-t. Ez nem véletlen – matematikailag ekvivalens a két megközelítés.

---

## z-teszt

### Egymintás, kétoldali z-teszt

**Feltételek:** \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\\), \\(\sigma^2\\) **ismert**.

**Hipotézisek:** \\(H_0: \mu = \mu_0\\) versus \\(H_1: \mu \neq \mu_0\\)

**Levezetés:** Ha \\(H_0\\) igaz, akkor \\(\bar{X} \sim N(\mu_0, \sigma^2/n)\\), standardizálva:

$$Z = \frac{\bar{X} - \mu_0}{\sigma/\sqrt{n}} \sim N(0,1)$$

Ez az a mennyiség, amelynek ismerjük az eloszlását \\(H_0\\) alatt. Szimmetrikus kritikus tartományt keresünk: elutasítjuk \\(H_0\\)-t, ha \\(\lvert Z \rvert\\) túl nagy. A \\(c\\) kritikus értéket úgy választjuk, hogy \\(P(\lvert Z \rvert < c \mid H_0) = 1 - \varepsilon\\), amiből \\(c = z_{\varepsilon/2} = \Phi^{-1}(1 - \varepsilon/2)\\).

**Döntés:** Elfogadjuk \\(H_0\\)-t \\(\varepsilon\\) szignifikanciaszinten, ha:

$$\left|\frac{\bar{X} - \mu_0}{\sigma/\sqrt{n}}\right| \leq z_{\varepsilon/2}$$

### Egymintás, egyoldali z-teszt

**Hipotézisek:** \\(H_0: \mu \leq \mu_0\\) versus \\(H_1: \mu > \mu_0\\) (jobboldali)

A tesztstatisztika ugyanaz. A kritikus értéket úgy választjuk, hogy az I. típusú hiba \\(\leq \varepsilon\\) legyen. Ez \\(c = z_\varepsilon\\)-t ad.

**Döntés:**
- Jobboldali: elfogadjuk \\(H_0\\)-t, ha \\(z_{\text{test}} \leq z_\varepsilon\\)
- Baloldali: elfogadjuk \\(H_0\\)-t, ha \\(z_{\text{test}} \geq -z_\varepsilon\\)

### Nagy mintás z-teszt (large-sample test)

Ha nem tudjuk, milyen az eloszlás, de a minta nagy, a CLT alapján:

$$Z = \frac{\bar{X} - \mu_0}{s_n^*/\sqrt{n}} \overset{\text{approx.}}{\sim} N(0,1)$$

Ez a közelítés nagy \\(n\\)-nél nagyon jó. A döntési szabály ugyanaz, mint az egzakt z-tesztnél.

### Kétmintás, kétoldali z-teszt

**Feltételek:** Két független normális minta, **mindkét variancia ismert**:

$$X_1,\ldots,X_n \overset{\text{iid}}{\sim} N(\mu_X, \sigma_X^2), \quad Y_1,\ldots,Y_m \overset{\text{iid}}{\sim} N(\mu_Y, \sigma_Y^2)$$

**Hipotézisek:** \\(H_0: \mu_X = \mu_Y\\) versus \\(H_1: \mu_X \neq \mu_Y\\)

**Levezetés:** \\(H_0\\) alatt \\(\bar{X} - \bar{Y} \sim N(0, \sigma_X^2/n + \sigma_Y^2/m)\\), standardizálva:

$$Z = \frac{\bar{X}_n - \bar{Y}_m}{\sqrt{\frac{\sigma_X^2}{n} + \frac{\sigma_Y^2}{m}}} \sim N(0,1)$$

**Döntés:** Elfogadjuk \\(H_0\\)-t, ha \\(\lvert z_{\text{test}} \rvert < z_{\varepsilon/2}\\).

### Kétmintás, egyoldali z-teszt

**Hipotézisek:** \\(H_0: \mu_X \geq \mu_Y\\) vs \\(H_1: \mu_X < \mu_Y\\) (baloldali), vagy \\(H_0: \mu_X \leq \mu_Y\\) vs \\(H_1: \mu_X > \mu_Y\\) (jobboldali).

A tesztstatisztika ugyanaz. **Döntés:**
- Baloldali: elfogadjuk \\(H_0\\)-t, ha \\(-z_\varepsilon < z_{\text{test}}\\)
- Jobboldali: elfogadjuk \\(H_0\\)-t, ha \\(z_{\text{test}} < z_\varepsilon\\)

<div class="callout exam" markdown="1">
**Vizsgán:** A z-teszt levezetésének lényege: standardizáljuk a mintaátlagot (vagy a különbséget), és \\(H_0\\) alatt ez standard normálishoz konvergál. A kritikus értéket ebből az eloszlásból olvassuk ki.
</div>

---

## t-teszt

A z-teszt feltételezi, hogy \\(\sigma\\) ismert. Ha nem ismert, \\(s_n^*\\)-gal helyettesítjük – és ekkor már nem standard normálist, hanem t-eloszlást kapunk.

### Egymintás, kétoldali t-teszt

**Feltételek:** \\(X_1,\ldots,X_n \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\\), \\(\sigma^2\\) **ismeretlen**.

**Hipotézisek:** \\(H_0: \mu = \mu_0\\) versus \\(H_1: \mu \neq \mu_0\\)

**Tesztstatisztika:**

$$T = \frac{\bar{X} - \mu_0}{s_n^*/\sqrt{n}} \sim t_{n-1} \quad \text{ha } H_0 \text{ igaz}$$

ahol \\(s_n^*\\) a korrigált mintaszórás. Ez pontosan ugyanolyan logikájú, mint a z-tesztnél, csak \\(\sigma\\) helyett \\(s_n^*\\)-t írunk, és a standard normális helyett \\(t_{n-1}\\) eloszlást kapunk.

**Döntés:** Elfogadjuk \\(H_0\\)-t \\(\varepsilon\\) szignifikanciaszinten, ha:

$$|t_{\text{test}}| < t_{\varepsilon/2,\, n-1}$$

ahol \\(t_{\varepsilon/2, n-1}\\) a \\(t_{n-1}\\) eloszlás \\(\varepsilon/2\\) felső kvantilise.

### Egymintás, egyoldali t-teszt

A tesztstatisztika ugyanaz. **Döntés:**
- Baloldali (\\(H_0: \mu \geq \mu_0\\)): elfogadjuk \\(H_0\\)-t, ha \\(-t_{\varepsilon, n-1} < t_{\text{test}}\\)
- Jobboldali (\\(H_0: \mu \leq \mu_0\\)): elfogadjuk \\(H_0\\)-t, ha \\(t_{\text{test}} < t_{\varepsilon, n-1}\\)

### Kétmintás t-teszt

**Feltételek:** Két független normális minta, **egyenlő, de ismeretlen varianciák** (\\(\sigma_X^2 = \sigma_Y^2 = \sigma^2\\)):

$$X_1,\ldots,X_n \overset{\text{iid}}{\sim} N(\mu_X, \sigma^2), \quad Y_1,\ldots,Y_m \overset{\text{iid}}{\sim} N(\mu_Y, \sigma^2)$$

<div class="callout trap" markdown="1">
**Figyelem:** Az egyenlő variancia feltételét F-teszttel kell előbb ellenőrizni. Ha az F-teszt elveti az egyenlőséget, Welch-tesztet kell használni.
</div>

A pooled (összevont) varianciabecslés:

$$s^2 = \frac{(n-1)(s_{X,n}^*)^2 + (m-1)(s_{Y,m}^*)^2}{m+n-2}$$

**Tesztstatisztika:**

$$T = \frac{\bar{X}_n - \bar{Y}_m}{\sqrt{(n-1)(s_{X,n}^*)^2 + (m-1)(s_{Y,m}^*)^2}} \cdot \sqrt{\frac{nm(n+m-2)}{n+m}}$$

Ha \\(H_0: \mu_X = \mu_Y\\) igaz, akkor \\(T \sim t_{n+m-2}\\).

**Döntés (kétoldali):** Elfogadjuk \\(H_0\\)-t, ha \\(\lvert t_{\text{test}} \rvert < t_{\varepsilon/2,\, n+m-2}\\).

**Egyoldali esetben:**
- Baloldali: elfogadjuk \\(H_0\\)-t, ha \\(-t_{\varepsilon, n+m-2} < t_{\text{test}}\\)
- Jobboldali: elfogadjuk \\(H_0\\)-t, ha \\(t_{\text{test}} < t_{\varepsilon, n+m-2}\\)

### Páros t-teszt (Paired t-test)

**Mikor használjuk:** Ha a két minta nem független, hanem páronként összetartozó (pl. ugyanazon személyek mérése kezelés előtt és után).

Az adatok: \\(n\\) független pár \\((X_1, Y_1), \ldots, (X_n, Y_n)\\), ahol \\(E[X_i] = \mu_X\\), \\(E[Y_i] = \mu_Y\\).

**Alapötlet:** Számítsuk ki a különbségeket \\(D_i = X_i - Y_i\\), és ezeken végezzük el az egymintás t-tesztet! Mivel \\(X_i\\) és \\(Y_i\\) nem feltétlenül független, \\(\sigma_{X-Y}^2 \neq \sigma_X^2 + \sigma_Y^2\\) – ezért nem alkalmazható a kétmintás t-teszt.

**Hipotézisek:** \\(H_0: \mu_X = \mu_Y\\) (azaz \\(\mu_{X-Y} = 0\\)) versus \\(H_1: \mu_X \neq \mu_Y\\)

**Tesztstatisztika:**

$$T = \frac{\bar{X}_n - \bar{Y}_n}{s_{X-Y,n}^*/\sqrt{n}} \sim t_{n-1} \quad \text{ha } H_0 \text{ igaz}$$

Ez pontosan egy egymintás t-teszt a különbségekre. Ha a minta nem normális, nagy mintánál nagy mintás tesztet lehet használni.

---

## F-teszt

Az F-teszt a két minta varianciájának egyenlőségét ellenőrzi – ezt a kétmintás t-teszt alkalmazása előtt kell elvégezni.

**Feltételek:** Két független normális minta, ismeretlen várható értékek és varianciák:

$$X_1,\ldots,X_n \overset{\text{iid}}{\sim} N(\mu_X, \sigma_X^2), \quad Y_1,\ldots,Y_m \overset{\text{iid}}{\sim} N(\mu_Y, \sigma_Y^2)$$

**Hipotézisek:** \\(H_0: \sigma_X^2 = \sigma_Y^2\\) versus \\(H_1: \sigma_X \neq \sigma_Y\\)

**Tesztstatisztika:** Ha \\(s_{X,n}^* \geq s_{Y,m}^*\\):

$$F = \frac{(s_{X,n}^*)^2}{(s_{Y,m}^*)^2}$$

Ha \\(H_0\\) igaz, akkor \\(F \sim F_{n-1, m-1}\\) (Fisher-eloszlás).

**Döntés:** Legyen \\(F_\varepsilon\\) a kritikus érték \\(\varepsilon\\) szignifikanciaszinten. Elfogadjuk \\(H_0\\)-t, ha \\(F_{\text{test}} < F_\varepsilon\\), különben elutasítjuk.

<div class="callout exam" markdown="1">
**Vizsgán:** Az F-teszt logikája: ha a két variancia egyenlő, akkor a mintavarianciák hányadosa \\(F\\)-eloszlást követ. Ha a hányados túl nagy (messze van 1-től), elutasítjuk az egyenlőséget.
</div>

---

## Welch-teszt

**Mikor használjuk:** Ha az F-teszt elveti a varianciák egyenlőségét, a kétmintás t-teszt nem alkalmazható. A Welch-teszt ezt az esetet kezeli.

**Feltételek:** Két független normális minta, ismeretlen és **nem feltétlenül egyenlő** varianciák.

**Hipotézisek:** \\(H_0: \mu_X = \mu_Y\\) versus \\(H_1: \mu_X \neq \mu_Y\\)

**Tesztstatisztika:**

$$W_{n,m} = \frac{\bar{X}_n - \bar{Y}_m}{\sqrt{\frac{(s_{X,n}^*)^2}{n} + \frac{(s_{Y,m}^*)^2}{m}}}$$

Welch megmutatta, hogy ha \\(H_0\\) igaz, \\(W_{n,m}\\) közelítőleg \\(t_{[f]}\\) eloszlású, ahol a szabadsági fok:

$$\frac{1}{f} = \frac{c^2}{n-1} + \frac{(1-c)^2}{m-1}, \quad c = \frac{(s_{X,n}^*)^2/n}{(s_{X,n}^*)^2/n + (s_{Y,m}^*)^2/m}$$

A szabadsági fok képlete **nem szükséges a vizsgán.**

**Döntés:**
- Kétoldali: elfogadjuk \\(H_0\\)-t, ha \\(\lvert t_{\text{test}} \rvert < t_{\varepsilon/2, f}\\)
- Jobboldali: elfogadjuk \\(H_0\\)-t, ha \\(t_{\text{test}} \leq t_{\varepsilon, f}\\)
- Baloldali: elfogadjuk \\(H_0\\)-t, ha \\(t_{\text{test}} \geq -t_{\varepsilon, f}\\)

<div class="callout tip" markdown="1">
**Tipp:** Összefoglalva a tesztek logikája: először F-teszttel ellenőrzöm a varianciákat. Ha egyenlők: kétmintás t-teszt. Ha nem egyenlők: Welch-teszt. Ha \\(\sigma\\) ismert: z-teszt. Ha a minta páros: páros t-teszt.
</div>

<div class="callout exam" markdown="1">
**Vizsgán – összefoglaló táblázat:**

| Teszt | Minta | \\(\sigma\\) | Feltétel |
|---|---|---|---|
| Egymintás z | 1 minta | ismert | normális |
| Nagy mintás z | 1 minta | ismeretlen | nagy \\(n\\) |
| Egymintás t | 1 minta | ismeretlen | normális |
| Kétmintás z | 2 független | mindkettő ismert | normális |
| F-teszt | 2 független | ismeretlen | normális, varianciák összehasonlítása |
| Kétmintás t | 2 független | ismeretlen, egyenlő | normális, F-teszt nem utasított el |
| Welch | 2 független | ismeretlen, nem egyenlő | normális, F-teszt elutasított |
| Páros t | 2 függő pár | ismeretlen | normális különbségek |
</div>