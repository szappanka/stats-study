---
layout: default
title: Idősorok
---

# Idősorok

## Miről szól ez a témakör?

Az eddig tanult módszerek (regresszió, tesztek) **i.i.d.** adatokat feltételeztek – vagyis a megfigyelések sorrendjének nem volt jelentősége. Az idősoroknál ez megváltozik: az adatokat **időrendben** gyűjtjük, és a sorrend maga is információt hordoz. Például a mai hőmérséklet hasonlít a tegnaihoz, de nem feltétlenül a múlt hónapihoz – ezt a fajta függést kell modellezni.

---

## Az idősor fogalma és a modellezés nehézségei

<div class="concept" markdown="1">
**Idősor (time series):** időrendben rögzített megfigyelések sorozata:

$$x_1, x_2, \ldots, x_T$$

ahol t az időindexet jelöli (pl. nap, hónap, negyedév).

**Példák:** napi hőmérséklet, havi GDP, részvényárfolyam, heti betegszám.

**Kritikus különbség az i.i.d. adatoktól:** az idősorban a megfigyelések **nem cserélhetők fel** – a sorrend elpusztítja a trendet, szezonalitást és a függőséget.
</div>

<div class="concept" markdown="1">
**A modellezés alapvető nehézsége:** minden t időponthoz tartozik egy \\(X_t\\) valószínűségi változó, de azt csak **egyszer** figyeljük meg – nincs ismétlés. Ez azt jelenti:

- Nem tudjuk közvetlenül becsülni \\(X_t\\) eloszlását egyetlen \\(x_t\\) értékből
- Nem tudjuk szabadon becsülni az összes \\(\text{Cov}(X_s, X_t)\\) párt

**Megoldás:** strukturális feltételeket kell tennünk – pl. stacionaritást – amelyek lehetővé teszik, hogy különböző időpontokból "tanuljunk" ugyanarról a mechanizmusról.
</div>

<div class="callout tip" markdown="1">
**Tipp:** Gondoljunk erre így: ha a folyamat "szabályai" stabilak az időben (stacionaritás), akkor a múltbeli megfigyelések tanítanak a jövőről. Ha nem stabilak, minden időpont más és más – és semmit sem tudunk tanulni.
</div>

---

## Az idősor komponensei

<div class="concept" markdown="1">
**Klasszikus felbontás:** egy idősort négy komponens összegeként írunk fel:

$$Y_t = T_t + S_t + C_t + \varepsilon_t$$

**Trend (\\(T_t\\)):** a sorozat hosszú távú mozgása. Például az eladások évtizedes növekedése, a klímaváltozás hatása a hőmérsékletre, népesedés. A trend megválaszolja: *hová tart a tipikus szint hosszú távon?*

**Szezonalitás (\\(S_t\\)):** ismétlődő, **ismert, rögzített periódusú** minta. Például: havonta ismétlődő karácsonyi forgalomnövekedés (m=12), negyedéves GDP-ingadozás (m=4), napi elektromos fogyasztás csúcsa (m=24). A szezonalitás megválaszolja: *hol vagyunk a naptári ciklusban?*

**Ciklikusság (\\(C_t\\)):** ismétlődő mozgás, de **nincs rögzített periódusa** – pl. gazdasági ciklus. Nehezebb kezelni, ezért ezt a kurzuson nem tárgyaljuk részletesen.

**Hibatag (\\(\varepsilon_t\\)):** a maradék, amit a többi komponens nem magyaráz.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** A szezonalitásnak van rögzített periódusa (pl. minden év január hidegebb), a ciklikusságnak nincs (pl. a recessziók nem pontosan 4 évente jönnek). Ez a különbség számít a modellezésnél.
</div>

---

## Sztochasztikus folyamat és stacionaritás

<div class="concept" markdown="1">
**Sztochasztikus folyamat:** valószínűségi változók időindexelt gyűjteménye: \\(\{X_t\}_{t \in \mathbb{Z}}\\). A folyamat a lehetséges "pályák" valószínűségi törvényét írja le – az adott idősor ezek egyike.

**Gyenge stacionaritás (weak stationarity):** a \\(\{X_t\}\\) folyamat gyengén stacionárius, ha:
1. \\(E(X_t) = \mu\\) – konstans várható érték
2. \\(\text{Var}(X_t) = \gamma(0) < \infty\\) – konstans variancia
3. \\(\text{Cov}(X_t, X_{t+h}) = \gamma(h)\\) – a kovariancia csak a h **lag**-tól függ, nem az idő abszolút értékétől

**Erős stacionaritás:** minden véges dimenziós eloszlás időeltolás-invariáns. Ez erősebb feltétel, általában a gyenge stacionaritás elegendő.
</div>

<div class="callout tip" markdown="1">
**Tipp:** A stacionaritás **nem** azt jelenti, hogy a sorozat vízszintes (lapos). Azt jelenti, hogy a valószínűségi "szabályok" stabilak: az átlag, a szórás és a lagfüggőség nem változik az idővel. Egy AR(1) folyamat stacionárius lehet, miközben fel-le ingadozik.
</div>

---

## Függőségmértékek: autokovariancia, autokorreláció, parciális autokorreláció

<div class="concept" markdown="1">
**Autokovariancia h lag-nál:** gyengén stacionárius folyamatnál:

$$\gamma(h) = \text{Cov}(X_t, X_{t+h}) = E[(X_t - \mu)(X_{t+h} - \mu)]$$

- \\(\gamma(0) = \text{Var}(X_t)\\)
- \\(\gamma(1)\\): szomszédos megfigyelések közötti lineáris kapcsolat
- \\(\gamma(12)\\) havi adatnál: egy évvel korábbi értékkel való kapcsolat

**Autokorrelációs függvény (ACF):** standardizált változat:

$$\rho(h) = \text{Corr}(X_t, X_{t+h}) = \frac{\gamma(h)}{\gamma(0)}, \quad -1 \leq \rho(h) \leq 1$$

Az ACF azt méri, mennyi "emlék" van a folyamatban: mennyit árul el a jelen a jövőről h lépéssel előre.

**Minta-autokorreláció becslése:**

$$\hat{\rho}(h) = \frac{\hat{\gamma}(h)}{\hat{\gamma}(0)}, \quad \hat{\gamma}(h) = \frac{1}{T}\sum_{t=1}^{T-h}(x_t - \bar{x})(x_{t+h} - \bar{x})$$

**Parciális autokorreláció (PACF):** a \\(X_t\\) és \\(X_{t+h}\\) közötti **közvetlen** lineáris kapcsolat, miután kiszűrtük a közbülső \\(X_{t+1}, \ldots, X_{t+h-1}\\) változók hatását. Az ACF azt kérdezi: "összefügg-e \\(X_t\\) és \\(X_{t+h}\\)?" A PACF azt kérdezi: "még mindig közvetlen kapcsolatban vannak-e, ha kivesszük a köztük lévők hatását?"
</div>

<div class="concept" markdown="1">
**Korrelogram:** az ACF és PACF grafikus megjelenítése – az összes lag értékét egyszerre mutatja. Használata:

- **AR modellek azonosítása:** a PACF élesen levág (p lag után közel nulla)
- **MA modellek azonosítása:** az ACF élesen levág (q lag után közel nulla)
- **Szezonalitás felismerése:** az ACF csúcsai a szezonális lag-oknál jelennek meg (pl. 12, 24, 36 havi adatnál)
- **Reziduálisok diagnosztikája:** ha a modell jó, a reziduálisok ACF-je fehér zajhoz hasonló
</div>

---

## Determinisztikus és sztochasztikus modellek

<div class="concept" markdown="1">
**Determinisztikus trend modell:** a trend matematikailag rögzített függvény az időben:

$$y_t = \beta_0 + \beta_1 t + \varepsilon_t \quad \text{(lineáris trend)}$$

$$y_t = \beta_0 + \beta_1 t + \beta_2 t^2 + \varepsilon_t \quad \text{(másodfokú trend)}$$

A eltérések a trendtől tranzitorikusak – a sorozat visszatér a trend vonalára.

**Sztochasztikus trend (véletlen bolyongás):**

$$X_t = X_{t-1} + \varepsilon_t$$

A sokkok **permanensek** – egy sokk örökre megváltoztatja a szintet. A variancia az idővel nő: \\(\text{Var}(X_t) = t\sigma^2\\), tehát nem stacionárius.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** Mindkét modell látszólag "trendező" sorozatot adhat – de nagyon különböző következményekkel. Determinisztikus trendnél az előrejelzés a rögzített trendvonalhoz tér vissza. Sztochasztikus trendnél az előrejelzési intervallum a horizont növekedésével tágul. A Dickey–Fuller-teszt segít eldönteni, melyik eset áll fenn.
</div>

---

## Exponenciális simítás (trend és szezonalitás nélkül)

<div class="concept" markdown="1">
**Egyszerű exponenciális simítás:** trend és szezonalitás nélküli sorozatoknál a szintbecslést rekurzívan frissítjük:

$$\ell_t = \alpha Y_t + (1-\alpha)\ell_{t-1}, \quad 0 < \alpha < 1$$

Az egylépéses előrejelzés: \\(\hat{Y}_{t+1|t} = \ell_t\\)

**Miért "exponenciális"?** Ismételt helyettesítéssel:

$$\ell_t = \alpha Y_t + \alpha(1-\alpha)Y_{t-1} + \alpha(1-\alpha)^2 Y_{t-2} + \cdots$$

A régebbi megfigyelések **geometriailag csökkenő súlyt** kapnak – ezért az elnevezés.

**Az \\(\alpha\\) értelmezése:**
- Nagy \\(\alpha\\) (pl. 0.9): gyorsan reagál az új adatokra, kevésbé "simít"
- Kis \\(\alpha\\) (pl. 0.1): lassan reagál, erősen simít, inkább a múltra támaszkodik
</div>

---

## MA(q) modellek

<div class="concept" markdown="1">
**MA(1) modell:** a jelenlegi érték a jelenlegi és az előző sokk függvénye:

$$X_t = \varepsilon_t + \theta\varepsilon_{t-1}, \quad \varepsilon_t \sim WN(0, \sigma^2)$$

Az \\(\varepsilon_t\\) sokk azonnal hat \\(X_t\\)-re, és még \\(X_{t+1}\\)-re is (\\(\theta\varepsilon_t\\)-n keresztül), de utána már nem.

**MA(q) modell (általánosan):**

$$X_t = \varepsilon_t + \theta_1\varepsilon_{t-1} + \cdots + \theta_q\varepsilon_{t-q}, \quad \varepsilon_t \sim WN(0, \sigma^2)$$

**Tulajdonságok:**
- A sokkok **rövid ideig** hatnak (q lépésen át)
- Az MA folyamatok **mindig stacionáriusak** (enyhe feltételek mellett), mert fehér zaj véges lineáris kombinációja
- Az **ACF élesen levág** q lag után – azért, mert \\(X_t\\) és \\(X_{t+h}\\) csak akkor osztanak közös sokkot, ha \\(h \leq q\\). Ha \\(h > q\\), a két időpont között nincs közös \\(\varepsilon\\) tag, ezért \\(\rho(h) = 0\\)
- A PACF lassan csökken
</div>

---

## AR(p) modellek

<div class="concept" markdown="1">
**AR(1) modell:** a jelenlegi érték az előző értéktől függ:

$$X_t = \phi X_{t-1} + \varepsilon_t, \quad \varepsilon_t \sim WN(0, \sigma^2)$$

- \\(\phi > 0\\): magas értékeket magas értékek követnek (perzisztencia)
- \\(\phi < 0\\): az előjelek váltakoznak
- Stacionaritási feltétel: \\(|\phi| < 1\\) – különben a sokkok halmozódnak

Ismételt helyettesítéssel: \\(X_t = \varepsilon_t + \phi\varepsilon_{t-1} + \phi^2\varepsilon_{t-2} + \cdots\\) – a múlt sokkjai geometriailag halványuló súllyal hatnak.

**AR(p) modell (általánosan):**

$$X_t = \phi_1 X_{t-1} + \phi_2 X_{t-2} + \cdots + \phi_p X_{t-p} + \varepsilon_t$$

**Tulajdonságok:**
- A jelen **saját múltbeli értékeire** regresszál
- Az **ACF lassan csökken** – azért, mert az AR modellben minden \\(X_{t-k}\\) hat \\(X_t\\)-re (közvetve, a láncon keresztül), és ez a hatás \\(\phi^h\\)-val arányosan halványul, de soha nem szűnik meg hirtelen
- A **PACF élesen levág** p lag után – azért, mert ha kivesszük a közbülső lagok hatását, \\(X_t\\) és \\(X_{t+h}\\) között \\(h > p\\)-nél már nincs közvetlen kapcsolat
- Stacionaritási feltétel: az AR polinom gyökei a komplex egységkörön kívül esnek
</div>

<div class="callout exam" markdown="1">
**Vizsgán – ACF/PACF összefoglaló:**

<table>
  <thead>
    <tr><th>Modell</th><th>Tipikus ACF</th><th>Tipikus PACF</th></tr>
  </thead>
  <tbody>
    <tr><td>Fehér zaj</td><td>Nincs szisztematikus autokorrel.</td><td>Nincs szisztematikus</td></tr>
    <tr><td>AR(p)</td><td>Lassan csökken</td><td>Levág p lag után</td></tr>
    <tr><td>MA(q)</td><td>Levág q lag után</td><td>Lassan csökken</td></tr>
    <tr><td>ARMA(p,q)</td><td>Lassan csökken</td><td>Lassan csökken</td></tr>
  </tbody>
</table>
</div>

---

## Trend szűrése

### Determinisztikus trend szűrése

<div class="eljaras" markdown="1">
**Regressziós detrending:** illesszünk determinisztikus trendmodellt, pl.:

$$y_t = \beta_0 + \beta_1 t + u_t$$

A reziduálisok \\(\hat{u}_t = y_t - \hat{\beta}_0 - \hat{\beta}_1 t\\) adják a detrendált sorozatot. Ezután megnézzük, stacionárius-e \\(\hat{u}_t\\).

**Mozgóátlag trend becslés:** egy m periódusra számított mozgóátlag:

$$\hat{T}_t = \frac{1}{m}\sum_{j=-(m-1)/2}^{(m-1)/2} y_{t+j}$$

A mozgóátlag kisimítja a rövid távú ingadozásokat és kiemeli a hosszú távú trendet.

**H₀ és felhasználás:** ezek nem tesztek, hanem **becslési eljárások** – a trend eltávolítása után vizsgáljuk, mi maradt.
</div>

### Sztochasztikus trend szűrése (differenciálás)

<div class="eljaras" markdown="1">
**Elsőrendű differencia:**

$$\Delta X_t = X_t - X_{t-1}$$

Ha \\(X_t\\) véletlen bolyongás, akkor \\(\Delta X_t = \varepsilon_t\\) fehér zaj – a differenciálás eltávolítja a sztochasztikus trendet.

**Mikor használjuk:** ha a Dickey–Fuller-teszt alapján sztochasztikus trend (egységgyök) van jelen.

**H₀ az eljárás mögött:** a differenciálás az ARIMA modellek alapja – az "I" rész jelenti az integrált folyamatot, amelyet differenciálással stacionárissá teszünk.
</div>

---

## Szezonalitás szűrése

<div class="eljaras" markdown="1">
**Determinisztikus szezonalitás eltávolítása – szezon dummyk:** havi adatnál:

$$y_t = \beta_0 + \beta_1 t + \delta_2 D_{2t} + \cdots + \delta_{12} D_{12,t} + u_t$$

ahol \\(D_{jt} = 1\\) ha a t időpont j-edik hónap, különben 0. Egy hónapot kihagyunk a multikollinearitás elkerülése végett.

A \\(\delta_j\\) együtthatók azt mérik, mennyivel tér el az átlagos szint az adott hónapban a referenciahónaphoz képest.

**Mire figyelni:** a determinisztikus szezonalitás eltávolítása után maradhatnak szezonális lag-oknál ACF-csúcsok – ez sztochasztikus szezonalitásra utal, amelyet szezonális differenciálással (\\(\Delta_m Y_t = Y_t - Y_{t-m}\\)) kezelünk.
</div>

---

## Hibatag diagnosztika

<div class="eljaras" markdown="1">
A modell illesztése után ellenőrizni kell, hogy a reziduálisok **fehér zajhoz hasonlítanak-e** – azaz nincsen bennük további kiaknázható időstruktúra.

Diagnosztikai lépések:
1. Reziduálisok időgrafikonja – nincs-e látható minta, trend, szezonalitás
2. Reziduálisok ACF/PACF grafikonja – nincsenek-e szignifikáns lag-ok
3. Ljung–Box-teszt (formális statisztikai teszt)
4. Szórás konstanciájának ellenőrzése
5. Normalitás ellenőrzése (ha szükséges az intervallumbecsléshez)
</div>

---

## Ljung–Box-teszt

<div class="eljaras" markdown="1">
**Célja:** tesztelni, hogy a reziduálisok fehér zaj-e – azaz nincs-e bennük szignifikáns autokorreláció.

**H₀:** az első h lag autokorreláció mind nulla (a reziduálisok fehér zaj)

**H₁:** legalább egy lag autokorrelációja nem nulla

Ha a teszt elveti H₀-t, a modell nem ragadta meg az összes időbeli struktúrát – bővíteni kell.
</div>

---

## Dickey–Fuller-teszt

<div class="eljaras" markdown="1">
**Célja:** eldönteni, hogy sztochasztikus trend (egységgyök) van-e a sorozatban, vagy a sorozat stacionárius.

**H₀:** egységgyök van (sztochasztikus trend, a sorozat nem stacionárius)

**H₁:** a sorozat stacionárius (nincs egységgyök)

Ha a teszt elveti H₀-t, a sorozat stacionárius, és ARMA modellt illeszthetünk. Ha nem utasítja el, differenciálnunk kell a sorozatot (ARIMA modell).
</div>

<div class="callout exam" markdown="1">
**Vizsgán – összefoglaló: mikor mit használunk:**

<table>
  <thead>
    <tr><th>Probléma</th><th>Megoldás</th><th>Teszt H₀-ja</th></tr>
  </thead>
  <tbody>
    <tr><td>Determinisztikus trend</td><td>Regressziós detrending vagy mozgóátlag</td><td>(nem teszt, becslés)</td></tr>
    <tr><td>Sztochasztikus trend?</td><td>Dickey–Fuller-teszt, majd differenciálás</td><td>Egységgyök van</td></tr>
    <tr><td>Determinisztikus szezonalitás</td><td>Szezon dummyk</td><td>(nem teszt, becslés)</td></tr>
    <tr><td>Sztochasztikus szezonalitás</td><td>Szezonális differenciálás</td><td>(nem teszt, becslés)</td></tr>
    <tr><td>Reziduálisokban autokorreláció?</td><td>Ljung–Box-teszt</td><td>A reziduálisok fehér zaj</td></tr>
  </tbody>
</table>
</div>