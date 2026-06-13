---
layout: default
title: Alapfogalmak
---

# Alapfogalmak

## Populáció és statisztikai változó

<mark>Populáció</mark>: a vizsgált egyedek halmaza. A matematikai modellben a populációt az $\Omega$ mintatérrel azonosítjuk.

Tehát a "populáció" nem csak embereket jelent – lehet az összes gyártott csavar, az összes nap hőmérséklete, bármi, amit vizsgálni akarunk.

<mark>Statisztikai változó</mark>: a populáció valamely tulajdonsága. Fontos, hogy mindig számokat rendelünk a tulajdonságokhoz, még akkor is, ha azok minőségi jellegűek. A változók típusai:

| Típus | Mit jelent | Példa |
|---|---|---|
| **Kategória** | A számok csak címkék, nincs sorrendjük | nem (férfi=1, nő=2) |
| **Ordinális** | A számok sorrendet fejeznek ki, de a távolságok nem értelmesek | elégedettség (1–5) |
| **Metrikus – intervallumskála** | A különbségek értelmesek, de a nulla konvencionális | hőmérséklet (°C) |
| **Metrikus – arányskála** | A különbségek és az arányok is értelmesek, a nulla valódi | hossz, csapadék |

<div class="callout trap" markdown="1">
**Figyelem:** kategória- és ordinális változóknál az átlag számítása kérdéses. Ha a nem változónál férfi=1, nő=2, az átlag 1.5-nek semmi értelme nincs.
</div>

<div class="callout trap" markdown="1">
**TODO:** Data matrix definíciója hiányzik a PDF-ből – utánanézni és pótolni.
</div>

---

## A matematikai modell

Az alapötlet: a valóságban megfigyelt adatokat valószínűségi változókkal modellezzük.

- A **nagybetűs** $X_1, X_2, \ldots, X_n$ a modell – valószínűségi változók, amiket még nem figyeltünk meg.
- A **kisbetűs** $x_1, x_2, \ldots, x_n$ a konkrét megfigyelt értékek.

Például az átlag: modellben $\frac{1}{n}\sum_i X_i$, adatok esetén $\frac{1}{n}\sum_i x_i$.

<mark>Véletlen minta (random sample)</mark>: az $X_1, X_2, \ldots, X_n$ változókat véletlen mintának nevezzük, ha egymástól független, azonos eloszlású (i.i.d.) valószínűségi változók.

Formálisan ez két dolgot jelent egyszerre:

**1. Azonos eloszlás** – mindenki ugyanabból a "kalapból" kerül ki:
$$F_{X_i}(\cdot) = F_{X_j}(\cdot) \quad \forall\, 1 \leq i, j \leq n$$

**2. Függetlenség** – az egyik megfigyelés nem befolyásolja a másikat:
$$F(X_{i_1} < x_1, \ldots, X_{i_k} < x_k) = \prod_{i=1}^{k} F_{X_i}(x_i)$$

Jelölés: $X_1, \ldots, X_n \overset{\text{iid}}{\sim} \text{Normal}(\mu, \sigma^2)$

<div class="callout tip" markdown="1">
**Tipp:** Az i.i.d. feltétel az egész statisztika alapja. Ha a minta nem i.i.d. (pl. idősorokban egymást követő értékek összefüggnek), teljesen más eszközökre van szükség.
</div>

---

## Statisztika

<mark>Statisztika</mark>: legyen $T_n$ egy $n$ változós valós függvény. Ekkor a

$$T_n = T_n(X_1, X_2, \ldots, X_n)$$

(a véletlen minta függvénye) egy **statisztika**.

Egyszerűbben: a statisztika bármilyen számítás, amit a mintán végzünk – átlag, maximum, variancia, stb. A lényeg, hogy **maga is valószínűségi változó**, tehát van eloszlása. Ezt az eloszlást **mintavételi eloszlásnak** (sampling distribution) nevezzük.

A $T_n(x_1, \ldots, x_n)$ konkrét számadat a statisztika **értéke**, miután már megfigyeltük az adatokat.

**Példák:**

$$T(X_1, \ldots, X_n) = \frac{1}{n}\sum_{i=1}^n X_i = \bar{X}$$

$$T(X_1, \ldots, X_n) = \frac{1}{n-1}\sum_{i=1}^n (X_i - \bar{X})^2 = (s_n^*)^2$$

$$T(X_1, \ldots, X_n) = \max(X_1, \ldots, X_n)$$

---

## Leíró statisztikák

### Középértékek

Legyen $(X_1^*, X_2^*, \ldots, X_n^*)$ a **rendezett minta**, ahol $X_k^* = \text{ord}_k\{X_1,\ldots,X_n\}$ a $k$-adik legkisebb elem. Tehát $X_1^* = \min$, $X_n^* = \max$.

| Statisztika | Képlet / leírás |
|---|---|
| **Mintaátlag** | $\bar{X} = \frac{1}{n}\sum_{i=1}^n X_i$ |
| **Medián** | $X^*_{\frac{n+1}{2}}$ ha $n$ páratlan; $\frac{X^*_{\frac{n}{2}} + X^*_{\frac{n}{2}+1}}{2}$ ha $n$ páros |
| **Módusz** | a leggyakrabban előforduló elem (lehet több is) |
| **Terjedelem** | $X_n^* - X_1^*$ |

### Szórásmértékek

A variancia azt méri, mennyire "szóródnak" az értékek az átlag körül.

<mark>Empirikus variancia (korrigálatlan)</mark>:

$$s_n^2 = \frac{1}{n}\sum_{i=1}^n (X_i - \bar{X})^2$$

<mark>Korrigált empirikus variancia</mark>:

$$(s_n^*)^2 = \frac{1}{n-1}\sum_{i=1}^n (X_i - \bar{X})^2$$

<mark>Empirikus szórás</mark>: $s_n = \sqrt{s_n^2}$, illetve $s_n^* = \sqrt{(s_n^*)^2}$

<div class="callout tip" markdown="1">
**Tipp:** Az $n-1$ nevező azért szerepel a korrigált változatban, mert az átlagot is a mintából becsültük – ezzel "elveszítettünk" egy szabadságfokot. A korrigált variancia torzítatlan becslése a populáció varianciájának, a korrigálatlan csak aszimptotikusan az. (Ez a 2. témakörben lesz bizonyítva.)
</div>

### Momentumok

A $k$-adik **populációs momentum**: $E[X^k]$

A $k$-adik **minta-momentum**: $\dfrac{1}{n}\sum_{i=1}^n X_i^k$

$k=1$ esetén: a várható érték az első populációs momentum, a mintaátlag az első minta-momentum.

### Ferdeség és csúcsosság

<mark>Ferdeség (Skewness)</mark>: az eloszlás szimmetriáját méri.

$$s = \frac{\frac{1}{n}\sum_{i=1}^n (X_i - \bar{X})^3}{\left(\frac{1}{n}\sum_{i=1}^n (X_i - \bar{X})^2\right)^{3/2}}$$

- $s \approx 0$: szimmetrikus eloszlás
- $s > 0$: jobbra ferde (a hosszabb farok jobbra nyúlik)
- $s < 0$: balra ferde (a hosszabb farok balra nyúlik)

<mark>Csúcsosság (Kurtosis)</mark>: azt méri, mennyire "nehézfarkú" az eloszlás a normálishoz képest.

$$c = \frac{\frac{1}{n}\sum_{i=1}^n (X_i - \bar{X})^4}{\left(\frac{1}{n}\sum_{i=1}^n (X_i - \bar{X})^2\right)^2} - 3$$

- $c < 0$: lapos eloszlás (könnyebb farkak)
- $c > 0$: csúcsos eloszlás (nehezebb farkak, több extrém érték)

A $-3$ azért szerepel, hogy a normális eloszlásnál $c = 0$ legyen – így a csúcsosság a normálistól való eltérést méri.

---

## Empirikus eloszlásfüggvény

Az eloszlásfüggvény azt adja meg, hogy a minta hány százaléka esik $x$ alá. Lépcsős függvény: minden megfigyelési pontnál $\frac{1}{n}$-vel ugrik.

<mark>Empirikus eloszlásfüggvény</mark>:

$$F_n(x) = \begin{cases} 0 & \text{ha } x \leq X_1^* \\ \frac{k}{n} & \text{ha } X_k^* < x \leq X_{k+1}^* \quad (k = 1,\ldots,n-1) \\ 1 & \text{ha } X_n^* < x \end{cases}$$

Ekvivalens alak indikátorfüggvénnyel:

$$F_n(x) = \frac{1}{n}\sum_{i=1}^n \mathbf{1}_{X_i < x}, \quad \text{ahol} \quad \mathbf{1}_{X_i < x} = \begin{cases} 0 & \text{ha } x \leq X_i \\ 1 & \text{ha } X_i < x \end{cases}$$

### Kiszámítása – példa

Minta: $(-15.4,\ -8.8,\ 8.2,\ 3.4,\ -7.1,\ 4.5,\ -12.7,\ 5.2,\ -10.6,\ -11.2)$

Rendezés után: $-15.4,\ -12.7,\ -11.2,\ -10.6,\ -8.8,\ -7.1,\ 3.4,\ 4.5,\ 5.2,\ 8.2$

| $x$ | $F_n(x)$ |
|---|---|
| $x < -15.4$ | $0$ |
| $x = -15.4$ | $0.1$ |
| $x = -12.7$ | $0.2$ |
| $x = -11.2$ | $0.3$ |
| $x = -10.6$ | $0.4$ |
| $x = -8.8$ | $0.5$ |
| $x = -7.1$ | $0.6$ |
| $x = 3.4$ | $0.7$ |
| $x = 4.5$ | $0.8$ |
| $x = 5.2$ | $0.9$ |
| $x \geq 8.2$ | $1$ |

<div class="callout exam" markdown="1">
**Vizsgán:** Rendezd a mintát növekvő sorrendbe, majd minden elemnél add hozzá $\frac{1}{n}$-t az előző értékhez. Az első elem előtt $F_n = 0$, az utolsó elem után $F_n = 1$.
</div>

---

## Glivenko–Cantelli-tétel

Ez az empirikus eloszlásfüggvény legfontosabb tulajdonsága: nagy mintánál az empirikus eloszlásfüggvény "utolér" a valódi eloszlásfüggvényt.

<mark>Glivenko–Cantelli-tétel</mark>:

$$P\!\left(\lim_{n \to \infty} \sup_{x \in \mathbb{R}} |F_n(x) - F(x)| = 0\right) = 1$$

Az empirikus eloszlásfüggvény **egyenletesen, majdnem biztosan** konvergál a valódi eloszlásfüggvényhez.

Mit jelent ez pontosan:

- **Egyenletesen**: nem csak egy adott $x$ pontban, hanem egyszerre az összes $x$-re.
- **Majdnem biztosan**: valószínűség 1-gyel, azaz kivételes esettől eltekintve mindig teljesül.

<div class="callout exam" markdown="1">
**Vizsgán:** A tétel kimondja, hogy $\sup_{x \in \mathbb{R}} |F_n(x) - F(x)| \to 0$ majdnem biztosan, ahogy $n \to \infty$. Ez az alap ahhoz, hogy az empirikus eloszlásfüggvényt egyáltalán használhassuk a valódi eloszlás közelítésére.
</div>

<div class="callout tip" markdown="1">
**Tipp:** A Glivenko–Cantelli-tétel az alapja a Kolmogorov–Smirnov tesztnek (4. témakör), amellyel azt vizsgálhatjuk, hogy a minta egy adott eloszlásból származik-e.
</div>