---
layout: default
title: Alapfogalmak
---

# Alapfogalmak

## Populáció

<div class="concept" markdown="1">
**Populáció:** a vizsgált egyedek teljes halmaza. A matematikai modellben a populációt a \\(\Omega\\) (omega) mintaterrel azonosítjuk.
</div>

<div class="callout tip" markdown="1">
**Tipp:** A populáció nem csak embereket jelent – bármi lehet, amit vizsgálunk. A lényeg, hogy az összes lehetséges egyedet tartalmazza, nem csak azokat, amelyeket ténylegesen megfigyeltünk.
</div>

## Minta

<div class="concept" markdown="1">
**Minta (sample):** a populációból kiválasztott egyedek részhalmaza, amelyeket ténylegesen megfigyeltünk. A mérés előtt minden egyes megfigyelés bizonytalan – ezt modellezzük \\(X_1, X_2, \ldots, X_n\\) valószínűségi változókkal, ahol \\(n\\) a mintaméret. A mérés után kapjuk a konkrét \\(x_1, x_2, \ldots, x_n\\) értékeket. Például 10 háztartás áramfogyasztásának mérésekor \\(X_1, \ldots, X_{10}\\) a mérés előtti bizonytalanság, \\(x_1 = 210, x_2 = 340, \ldots\\) a tényleges mért értékek kWh-ban.
</div>

<div class="concept" markdown="1">
**Véletlen minta (random sample):** az \\(X_1, X_2, \ldots, X_n\\) változókat véletlen mintának nevezzük, ha egymástól független és azonos eloszlású (i.i.d.) valószínűségi változók. Jelölés: \\(X_1, \ldots, X_n \overset{\text{iid}}{\sim} F\\).
</div>

<div class="callout tip" markdown="1">
**Tipp:** A nagybetűs \\(X_i\\) a modell – egy véletlenszerű változó, mielőtt megfigyeljük. A kisbetűs \\(x_i\\) a konkrét megfigyelt érték. Ez ugyanolyan különbség, mint az esővalószínűség (véletlen) és a ténylegesen lehullott csapadék (konkrét szám) között.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** Az i.i.d. feltétel kritikus. Ha a megfigyelések összefüggnek egymással (pl. idősorokban egymást követő értékek), a minta nem i.i.d., és teljesen más eszközökre van szükség.
</div>

## Adatmátrix

<div class="concept" markdown="1">
**Adatmátrix (data matrix):**

<div class="callout trap" markdown="1">
**TODO:** Az adatmátrix definíciója nem szerepel a PDF-ben – utánanézni és pótolni.
</div>
</div>


## Átlag, empirikus variancia, korrigált empirikus variancia

<div class="concept" markdown="1">
**Mintaátlag (mean):** a minta értékeinek számtani átlaga – azt mutatja meg, hogy "jellemzően" mekkora értékeket figyeltünk meg:

$$\bar{X} = X_n = \frac{\sum_{i=1}^n X_i}{n}$$
</div>

<div class="concept" markdown="1">
**Empirikus variancia (uncorrected sample variance):** azt méri, mennyire "ugrálnak" az értékek az átlag körül. Ha mindenki pontosan az átlagot méri, a variancia nulla. Minél jobban szóródnak az értékek, annál nagyobb:

$$s_n^2 = \frac{1}{n}\sum_{i=1}^n (X_i - \bar{X})^2$$

**Korrigált empirikus variancia (corrected sample variance):** ugyanolyan logikájú, de \\(n-1\\) a nevező. Azért korrigált, mert az átlagot is a mintából számoltuk – ez egy kis torzítást visz be, amit az \\(n-1\\) kompenzál:

$$({s_n^*})^2 = \frac{1}{n-1}\sum_{i=1}^n (X_i - \bar{X})^2$$

**Empirikus szórás:** a variancia négyzetgyöke. A variancia mértékegysége az eredeti adat négyzetében van (pl. cm²), ami nehezen értelmezhető. A négyzetgyök visszahozza az eredeti mértékegységet (pl. cm), így a szórás már közvetlenül összehasonlítható az adatokkal:

$$s_n = \sqrt{s_n^2}, \quad s_n^* = \sqrt{({s_n^*})^2}$$
</div>

<div class="callout tip" markdown="1">
**Tipp:** A variancia azért négyzeteli a különbségeket, mert különben a pozitív és negatív eltérések kiejtenék egymást – és az átlagtól való eltérések összege mindig nulla lenne.
</div>

## Empirikus eloszlásfüggvény

<div class="concept" markdown="1">
**Empirikus eloszlásfüggvény:** azt mutatja meg, hogy a mintában szereplő értékek hány százaléka esik egy adott \\(x\\) érték alá. Arra való, hogy az adatokból közelítsük az ismeretlen valódi eloszlást.

Például ha 10 mérésünk van és \\(x = 5\\), akkor \\(F_n(5)\\) megmondja, hogy a 10 mérésből hány esett 5 alá – mondjuk 3, akkor \\(F_n(5) = 0.3\\).

Ha az összes mérést sorba rendezzük \\((X_1^{\ast}, X_2^{\ast}, \ldots, X_n^{\ast})\\) alakban (legkisebbtől legnagyobbig), a függvény így néz ki:

$$F_n(x) = \begin{cases} 0 & \text{ha } x \leq X_1^* \\ \frac{k}{n} & \text{ha } X_k^* < x \leq X_{k+1}^* \\ 1 & \text{ha } X_n^* < x \end{cases}$$

Olvasata: a legkisebb érték előtt 0, minden egyes megfigyelésnél \\(\frac{1}{n}\\)-vel ugrik, a legnagyobb után 1. Ezért hívják lépcsős függvénynek.
</div>

<div class="callout tip" markdown="1">
**Tipp:** Az indikátorfüggvényes alak ugyanezt fejezi ki tömörebben:

$$F_n(x) = \frac{1}{n}\sum_{i=1}^n \mathbf{1}_{X_i < x}$$

A \\(\mathbf{1}_{X_i < x}\\) csak 1-et vagy 0-t vesz fel: 1 ha \\(X_i < x\\), különben 0. Tehát az összeg megszámolja, hány megfigyelés esik \\(x\\) alá, majd elosztjuk \\(n\\)-nel hogy arányt kapjunk.
</div>


## Glivenko–Cantelli-tétel

<div class="tetel" markdown="1">
**Glivenko–Cantelli-tétel:** ahogy a mintaméret növekszik, az empirikus eloszlásfüggvény egyre jobban közelíti a valódi eloszlásfüggvényt – mégpedig egyszerre az összes \\(x\\) értékre:

$$P\!\left(\lim_{n \to \infty} \sup_{x \in \mathbb{R}} |F_n(x) - F(x)| = 0\right) = 1$$

Az empirikus eloszlásfüggvény **egyenletesen, majdnem biztosan** konvergál a valódi eloszlásfüggvényhez.
</div>

<div class="callout tip" markdown="1">
**Tipp:** A tétel három dolgot mond egyszerre:

- **Szuprémum:** minden \\(x\\) pontban kiszámoljuk a különbséget \\(|F_n(x) - F(x)|\\) és ezek közül a legnagyobbat nézzük – tehát a legrosszabb esetben is jól kell közelíteni, nem elég csak néhány pontban.
- **Egyenletesen:** egyszerre az összes \\(x\\)-re közelít. Nem fordulhat elő, hogy egyik pontban jól közelít, másikban rosszul.
- **Majdnem biztosan:** valószínűsége 1 hogy bekövetkezik. Elméletileg léteznek kivételek, de ezek valószínűsége nulla – a gyakorlatban sosem fordulnak elő.
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** A tétel lényege: nagy mintánál az empirikus eloszlásfüggvény "utolér" a valódi eloszlásfüggvényt – ezért egyáltalán érdemes az empirikus eloszlásfüggvényt használni a valódi közelítésére.
</div>

## Az empirikus eloszlásfüggvény kiszámítása

<div class="eljaras" markdown="1">
**Lépések:**

1. Rendezd sorba a mintát növekvő sorrendben: \\(X_1^{\ast} \leq X_2^{\ast} \leq \ldots \leq X_n^{\ast}\\)
2. A legkisebb érték előtt \\(F_n = 0\\)
3. Minden elemnél add hozzá \\(\frac{1}{n}\\)-t az előző értékhez – ha 10 elem van, minden lépésnél 0.1-et
4. Az utolsó elem után \\(F_n = 1\\)

**Hogyan olvasod le:** ha tudni akarod, hogy a minta hány százaléka esik egy adott érték alá, megkeresed a táblázatban a megfelelő sort. Például \\(x = -8.8\\)-nál \\(F_n = 0.5\\) azt jelenti, hogy a minta 50%-a esik \\(-8.8\\) alá.

**Példa:** minta: \\((-15.4,\ -8.8,\ 8.2,\ 3.4,\ -7.1,\ 4.5,\ -12.7,\ 5.2,\ -10.6,\ -11.2)\\), \\(n = 10\\)

Rendezés után: \\(-15.4,\ -12.7,\ -11.2,\ -10.6,\ -8.8,\ -7.1,\ 3.4,\ 4.5,\ 5.2,\ 8.2\\)

<table>
  <thead>
    <tr><th>x</th><th>Fn(x)</th></tr>
  </thead>
  <tbody>
    <tr><td>x &lt; −15.4</td><td>0</td></tr>
    <tr><td>x = −15.4</td><td>0.1</td></tr>
    <tr><td>x = −12.7</td><td>0.2</td></tr>
    <tr><td>x = −11.2</td><td>0.3</td></tr>
    <tr><td>x = −10.6</td><td>0.4</td></tr>
    <tr><td>x = −8.8</td><td>0.5</td></tr>
    <tr><td>x = −7.1</td><td>0.6</td></tr>
    <tr><td>x = 3.4</td><td>0.7</td></tr>
    <tr><td>x = 4.5</td><td>0.8</td></tr>
    <tr><td>x = 5.2</td><td>0.9</td></tr>
    <tr><td>x ≥ 8.2</td><td>1</td></tr>
  </tbody>
</table>
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** Rendezd a mintát növekvő sorrendbe, majd minden elemnél add hozzá \\(\frac{1}{n}\\)-t. Az első elem előtt \\(F_n = 0\\), az utolsó után \\(F_n = 1\\). Egy adott \\(x\\) értékre \\(F_n(x)\\) megmutatja, hogy a minta hány százaléka esik \\(x\\) alá.
</div>