---
layout: default
title: Nemparaméteres tesztek
---

# Nemparaméteres tesztek

## Miről szól ez a témakör?

A paraméteres tesztek (z-teszt, t-teszt) feltételezik, hogy a minta normális eloszlásból jön. De mi van, ha ez nem teljesül, vagy ha az adatok csak sorrendiek (pl. elégedettségi skála)? Ekkor jönnek a **nemparaméteres tesztek**, amelyek gyengébb feltételekkel dolgoznak – csak annyit feltételeznek, hogy az eloszlás folytonos vagy ordinális.

Mivel kevesebbet feltételezünk, általában nagyobb mintaméret kell, és csak közelítő eloszlásokat kapunk a tesztstatisztikára.

---

## Nemparaméteres teszt, ordinális és kategorikus változó

<div class="concept" markdown="1">
**Nemparaméteres teszt:** olyan hipotézisvizsgálati eljárás, amely nem feltételez konkrét eloszláscsaládot – ezért eloszlásfüggetlen tesztnek is hívják. Az állítás az eloszlás egészére vonatkozik, nem csak paramétereire.

**Ordinális változó:** olyan változó, amelynek értékei sorrendbe rendezhetők, de a különbségek nem értelmezhetők számszerűen. Például elégedettségi skála (1–5), iskolai osztályzat.

**Kategorikus változó:** olyan változó, amelynek értékei kategóriákba sorolhatók, de sorrendjük sincs. Például nem, lakhely típusa.
</div>

<div class="callout tip" markdown="1">
**Tipp:** Háromféle nemparaméteres probléma létezik:
- **Illeszkedésvizsgálat:** az adatok egy adott eloszlásból jönnek-e? (KS-teszt, \\(\chi^2\\)-teszt)
- **Függetlenségvizsgálat:** két változó független-e egymástól? (\\(\chi^2\\)-teszt)
- **Homogenitásvizsgálat:** két minta ugyanolyan eloszlásból jön-e? (KS-teszt, Wilcoxon, Mann-Whitney)
</div>

---

## Kolmogorov–Smirnov-tétel

<div class="tetel" markdown="1">
**Kolmogorov–Smirnov-tétel:** legyen \\(F\\) egy folytonos eloszlásfüggvény és \\(X_1, \ldots, X_n\\) statisztikai minta ebből az eloszlásból. Ekkor az empirikus eloszlásfüggvényre \\(F_n\\):

$$\lim_{n \to \infty} P\!\left(\sqrt{n} \sup_{x \in \mathbb{R}} |F_n(x) - F(x)| < z\right) = K(z)$$

ahol \\(K(z) = \sum_{i=-\infty}^{\infty} (-1)^i e^{-2i^2z^2}\\) a Kolmogorov-eloszlás cdf-je.

Egyoldali esetben:

$$\lim_{n \to \infty} P\!\left(\sqrt{n} \sup_{x \in \mathbb{R}} (F_n(x) - F(x)) < z\right) = S(z) = 1 - e^{-2z^2}$$

ahol \\(S(z)\\) a Smirnov-eloszlás cdf-je.
</div>

<div class="callout tip" markdown="1">
**Tipp:** A Glivenko–Cantelli-tétel (1. fejezet) azt mondta, hogy \\(F_n \to F\\) majdnem biztosan. A KS-tétel pontosítja ezt: megmondja a konvergencia **sebességét** és a határeloszlást – ez teszi lehetővé a hipotézisvizsgálatot.
</div>

---

## Kolmogorov–Smirnov-tesztek

### Egymintás KS-teszt (illeszkedésvizsgálat)

<div class="eljaras" markdown="1">
**Feltételek:** \\(X_1, \ldots, X_n\\) véletlen minta folytonos eloszlásból.

**\\(H_0\\):** \\(P(X < t) = F_0(t)\\) (az adatok \\(F_0\\) eloszlásból jönnek)

**\\(H_1\\):** \\(P(X < t) \neq F_0(t)\\)

**Tesztstatisztika:**

$$T_n = \sqrt{n} \cdot \sup_{x \in \mathbb{R}} |F_n(x) - F_0(x)|$$

**Döntés:** legyen \\(K_\varepsilon\\) a Kolmogorov-eloszlás kritikus értéke \\(\varepsilon\\) szignifikanciaszinten. Elfogadjuk \\(H_0\\)-t, ha \\(T_{\text{test}} < K_\varepsilon\\).

**Megjegyzés:** egyoldali tesztnél a Smirnov-eloszlás kritikus értékeit kell használni.
</div>

### Kétmintás KS-teszt (homogenitásvizsgálat)

<div class="eljaras" markdown="1">
**Feltételek:** \\(X_1, \ldots, X_n\\) és \\(Y_1, \ldots, Y_m\\) két független minta folytonos eloszlásból.

**\\(H_0\\):** \\(P(X < x) = P(Y < x)\\) minden \\(x\\)-re (azonos eloszlás)

**\\(H_1\\):** \\(P(X < x) \neq P(Y < x)\\) valamely \\(x\\)-re

**Tesztstatisztika:**

$$T = \sqrt{\frac{nm}{n+m}} \cdot \sup_{x \in \mathbb{R}} |F_n(x) - G_m(x)|$$

**Döntés:** elfogadjuk \\(H_0\\)-t, ha \\(T_{\text{test}} < K_\varepsilon\\) (Kolmogorov-eloszlás kritikus értéke).
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** A KS-teszt a két empirikus eloszlásfüggvény maximális eltérését méri. Ha ez az eltérés túl nagy, elutasítjuk \\(H_0\\)-t. A tesztstatisztika határeloszlása a Kolmogorov-eloszlás – ez nem függ az eredeti eloszlástól, ezért nemparaméteres.
</div>

---

## \\(\chi^2\\)-tesztek

### Illeszkedésvizsgálat (Goodness of fit)

<div class="eljaras" markdown="1">
**Alapötlet:** osszuk fel az adatokat \\(r\\) kategóriába, és hasonlítsuk össze a megfigyelt és várt gyakoriságokat. Ha nagyon különböznek, elutasítjuk \\(H_0\\)-t.

**Feltételek:** \\(n\\) független megfigyelés, \\(r\\) kategória.

**\\(H_0\\):** az adatok egy adott eloszlásból jönnek (amelynek a \\(p_1, \ldots, p_r\\) kategóriavalószínűségei ismertek vagy becsültek).

**Tesztstatisztika:**

$$T = \sum_{k=1}^r \frac{(\nu_k - np_k)^2}{np_k}$$

ahol \\(\nu_k\\) a \\(k\\)-adik kategóriába eső megfigyelések száma, \\(np_k\\) a várható szám.

**Aszimptotikus eloszlás:** \\(H_0\\) esetén \\(T \xrightarrow{D} \chi^2_{r-1}\\). Ha \\(e\\) paramétert becsültünk a mintából, a szabadsági fok \\(r - 1 - e\\).

**Döntés:** elfogadjuk \\(H_0\\)-t, ha \\(T < \chi^2_{\varepsilon, r-1}\\).
</div>

### Homogenitásvizsgálat

<div class="eljaras" markdown="1">
**Feltételek:** két független minta \\((X_1, \ldots, X_n)\\) és \\((Y_1, \ldots, Y_m)\\), azonos \\(r\\) kategória mindkettőre.

**\\(H_0\\):** \\(P(X < x) = P(Y < x)\\) minden \\(x\\)-re

**Tesztstatisztika:**

$$T = nm \sum_{k=1}^r \frac{\left(\frac{\nu_k}{n} - \frac{\mu_k}{m}\right)^2}{\nu_k + \mu_k}$$

ahol \\(\hat{p}_k = \frac{\nu_k + \mu_k}{n+m}\\) a \\(k\\)-adik kategória becsült valószínűsége.

**Aszimptotikus eloszlás:** \\(H_0\\) esetén \\(T \xrightarrow{D} \chi^2_{r-1}\\).

**Döntés:** elfogadjuk \\(H_0\\)-t, ha \\(T < \chi^2_{\varepsilon, r-1}\\).
</div>

### Függetlenségvizsgálat

<div class="eljaras" markdown="1">
**Feltételek:** \\((X_1, Y_1), \ldots, (X_n, Y_n)\\) kétdimenziós minta. Az \\(X\\) értékeit \\(r\\) kategóriába, a \\(Y\\) értékeit \\(s\\) kategóriába soroljuk. A \\(\nu_{k\ell}\\) jelöli azon megfigyelések számát, ahol \\(X \in I_k\\) és \\(Y \in J_\ell\\).

**\\(H_0\\):** \\(X\\) és \\(Y\\) független, azaz \\(P(X < x, Y < y) = P(X < x) \cdot P(Y < y)\\)

**Tesztstatisztika (ha a marginális eloszlások ismeretlenek):**

$$T_n = n \sum_{k=1}^r \sum_{\ell=1}^s \frac{\left(\nu_{k\ell} - \frac{\nu_{k\cdot}\nu_{\cdot\ell}}{n}\right)^2}{\nu_{k\cdot}\nu_{\cdot\ell}}$$

ahol \\(\nu_{k\cdot} = \sum_\ell \nu_{k\ell}\\) és \\(\nu_{\cdot\ell} = \sum_k \nu_{k\ell}\\) a marginális összegek.

**Aszimptotikus eloszlás:** \\(H_0\\) esetén \\(T_n \xrightarrow{D} \chi^2_{(r-1)(s-1)}\\).

**Döntés:** elfogadjuk \\(H_0\\)-t, ha \\(T < \chi^2_{\varepsilon, (r-1)(s-1)}\\).
</div>

<div class="callout exam" markdown="1">
**Vizsgán – szabadsági fokok:**
<ul>
  <li>Illeszkedésvizsgálat: r − 1 (mínusz a becsült paraméterek száma)</li>
  <li>Homogenitásvizsgálat: r − 1</li>
  <li>Függetlenségvizsgálat: (r−1)(s−1)</li>
</ul>
</div>

---

## Előjelteszt (Sign test)

<div class="eljaras" markdown="1">
**Feltételek:** \\(X_1, \ldots, X_n\\) ordinális változók statisztikai mintája.

**\\(H_0\\):** \\(m_X = m_0\\) (a medián értéke \\(m_0\\))

**\\(H_1\\):** \\(m_X \neq m_0\\) (kétoldali) vagy \\(m_X > m_0\\) (egyoldali)

**Tesztstatisztika:** az \\(m_0\\)-nál nagyobb elemek száma:

$$B = \sum_{i=1}^n \mathbf{1}_{X_i > m_0}$$

Ha \\(H_0\\) igaz, akkor \\(B \sim \text{Binom}(n, \frac{1}{2})\\).

**Nagy mintánál** közelítőleg normális:

$$\frac{B - n/2}{\sqrt{n}/2} \overset{\text{approx.}}{\sim} N(0,1)$$

tehát z-tesztet lehet alkalmazni.
</div>

<div class="callout tip" markdown="1">
**Tipp:** Az előjelteszt logikája egyszerű: ha a medián valóban \\(m_0\\), akkor kb. fele-fele arányban lesznek \\(m_0\\)-nál nagyobb és kisebb elemek. Ha az arány nagyon eltér 50%-tól, elutasítjuk \\(H_0\\)-t.
</div>

---

## Wilcoxon-féle rang tesztek

### Egymintás Wilcoxon-teszt (Signed Rank test)

<div class="eljaras" markdown="1">
**Feltételek:** \\(X_1, \ldots, X_n\\) ordinális változók. Az előjeltesztnél erősebb, mert nem csak az előjelet, hanem az eltérések nagyságát is figyelembe veszi.

**\\(H_0\\):** \\(m_X = m_0\\) vs \\(H_1\\): \\(m_X \neq m_0\\)

**Számítás lépései:**
1. Számítsuk ki \\(d_i = X_i - m_0\\) eltéréseket
2. Rangsoroljuk \\(|d_i|\\) abszolút értékeket (egyenlők átlagrangot kapnak)
3. \\(R^+ = \sum_{d_i > 0} r_i\\) a pozitív eltérések rangjainak összege

**Kis mintánál:** a kritikus értékek Wilcoxon-táblázatból olvashatók. Elutasítjuk \\(H_0\\)-t, ha \\(R^+ \leq T_{\text{crit}}\\) vagy \\(R^+ \geq \frac{n(n+1)}{2} - T_{\text{crit}}\\).

**Nagy mintánál:**

$$E[R^+] = \frac{n(n+1)}{4}, \quad \sigma_{R^+} = \sqrt{\frac{n(n+1)(2n+1)}{24}}$$

$$T = \frac{R^+ - \frac{n(n+1)}{4}}{\sqrt{\frac{n(n+1)(2n+1)}{24}}} \overset{\text{approx.}}{\sim} N(0,1)$$

Elfogadjuk \\(H_0\\)-t, ha \\(|T_{\text{test}}| < z_{\varepsilon/2}\\).
</div>

### Páros Wilcoxon-teszt

<div class="eljaras" markdown="1">
**Feltételek:** \\((X_1, Y_1), \ldots, (X_n, Y_n)\\) kétdimenziós minta, ordinális változók.

**\\(H_0\\):** \\(P(X < x) = P(Y < x)\\) minden \\(x\\)-re

A páros t-teszt nemparaméteres analógja: számítsuk ki \\(D_i = X_i - Y_i\\) különbségeket, majd végezzük el az egymintás Wilcoxon-tesztet \\(m_0 = 0\\)-ra.
</div>

---

## Mann–Whitney-teszt

<div class="eljaras" markdown="1">
**Feltételek:** \\(X_1, \ldots, X_n\\) és \\(Y_1, \ldots, Y_m\\) két független minta, ordinális változók. A kétmintás t-teszt nemparaméteres analógja.

**\\(H_0\\):** \\(m_X = m_Y\\) (azonos medián, azonos eloszlás) vs \\(H_1\\): \\(m_X \neq m_Y\\)

**Számítás:** vonjuk össze a két mintát (\\(n+m\\) elem), rangsoroljuk az összevont mintát, majd \\(R_X\\) jelöli az \\(X\\)-beli elemek rangösszegét.

$$E[R_X] = \frac{n(n+m+1)}{2}, \quad \sigma_{R_X} = \sqrt{\frac{mn(n+m+1)}{12}}$$

**Kis mintánál:** \\(R_X' = R_X - \frac{n(n+1)}{2}\\), kritikus értékek Mann–Whitney-táblázatból.

**Nagy mintánál:**

$$T = \frac{R_X - E[R_X]}{\sigma_{R_X}} \overset{\text{approx.}}{\sim} N(0,1)$$

Elfogadjuk \\(H_0\\)-t, ha \\(|T_{\text{test}}| < z_{\varepsilon/2}\\).
</div>

<div class="callout exam" markdown="1">
**Vizsgán – összefoglaló:**

<table>
  <thead>
    <tr><th>Teszt</th><th>Minta</th><th>H₀</th><th>Határeloszlás</th></tr>
  </thead>
  <tbody>
    <tr><td>Egymintás KS</td><td>1 folytonos</td><td>F = F₀</td><td>Kolmogorov</td></tr>
    <tr><td>Kétmintás KS</td><td>2 folytonos</td><td>F_X = F_Y</td><td>Kolmogorov</td></tr>
    <tr><td>χ² illeszkedés</td><td>1 kategorikus</td><td>adott eloszlás</td><td>χ²(r-1)</td></tr>
    <tr><td>χ² homogenitás</td><td>2 kategorikus</td><td>F_X = F_Y</td><td>χ²(r-1)</td></tr>
    <tr><td>χ² függetlenség</td><td>2D minta</td><td>X ⊥ Y</td><td>χ²((r-1)(s-1))</td></tr>
    <tr><td>Előjelteszt</td><td>1 ordinális</td><td>m_X = m₀</td><td>Binomiális / Normális</td></tr>
    <tr><td>Wilcoxon (1 mintás)</td><td>1 ordinális</td><td>m_X = m₀</td><td>Wilcoxon / Normális</td></tr>
    <tr><td>Páros Wilcoxon</td><td>2 függő ordinális</td><td>m_X = m_Y</td><td>Wilcoxon / Normális</td></tr>
    <tr><td>Mann–Whitney</td><td>2 független ordinális</td><td>m_X = m_Y</td><td>Normális</td></tr>
  </tbody>
</table>
</div>