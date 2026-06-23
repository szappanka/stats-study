---
layout: default
title: Témák
---

## 10. Példafeladatok és megoldások

### 1. feladat — Változótípusok és mérési szintek

**Feladat:** Egy adatbázisban négy változó van: hallgató azonosítószáma, vizsgapontszám (0-100), elégedettségi értékelés (1-5), és a terem hőmérséklete Celsius-ban. Azonosítsd mindegyik változó mérési szintjét, és mondd meg melyiknél lenne kérdéses az átlag számítása és miért.

**Elméleti háttér**

A négy mérési szint:
- **Nominális** — csak kategóriák, nincs sorrend (pl. nem, vércsoport, azonosítószám)
- **Ordinális** — van sorrend, de a távolságok nem feltétlenül egyenlők (pl. elégedettségi skála, iskolai jegyek)
- **Intervallum** — egyenlő távolságok, de nincs valódi nulla (pl. Celsius fok — 0°C nem jelenti hogy "nincs hőmérséklet")
- **Arány** — egyenlő távolságok + valódi nulla (pl. pontszám, magasság, súly)

Az átlag csak akkor értelmes, ha az értékek közötti távolságok egyenlők és értelmesek. Nominális változónál az átlag teljesen értelmetlen (csak címkék), ordinális változónál kérdéses (nem garantált az egyenlő távolság).

**Megoldás**

| Változó | Mérési szint | Miért |
|---|---|---|
| Hallgató azonosítószáma | Nominális | Csak címke, nem mennyiség |
| Vizsgapontszám | Arány | Egyenlő távolságok + valódi nulla (0 pont = semmit sem teljesített) |
| Elégedettségi értékelés | Ordinális | Van sorrend, de a távolságok nem feltétlenül egyenlők |
| Terem hőmérséklete | Intervallum | Egyenlő távolságok, de 0°C nem jelenti "nincs hőmérséklet" |

Az átlag kérdéses:
- **Azonosítószámnál** — teljesen értelmetlen, a számok csak címkék (az átlag azonosítószám semmit nem jelent)
- **Elégedettségi értékelésnél** — kérdéses, mert feltételezi hogy a különbség 3 és 4 között ugyanakkora mint 4 és 5 között, ami nem biztos

---

### 2. feladat — Paraméter vs mintastatisztika

**Feladat:** Egy modell szerint a háztartások havi villamosenergia-fogyasztása normális eloszlást követ ismeretlen μ várható értékkel és ismeretlen σ² varianciával. 80 háztartásból álló véletlenszerű mintában az átlagos fogyasztás 236 kWh. Azonosítsd a releváns paramétert és a mintastatisztikát. Magyarázd meg miért adna valószínűleg más eredményt egy másik 80 háztartásból álló minta!

**Elméleti háttér**

- **Paraméter** — a teljes populáció valódi, fix (de ismeretlen) jellemzője. Nem változik mintáról mintára.
- **Mintastatisztika** — a mintából kiszámolt érték, ami a paramétert becsüli. Mintáról mintára ingadozik, mert minden mintában más megfigyelések szerepelnek.
- **Mintavételi ingadozás** — az a jelenség, hogy különböző minták különböző statisztikákat adnak, még ha ugyanabból a populációból származnak is. Ez az egész statisztikai következtetés alapja.

**Megoldás**

- **Paraméter:** μ — a teljes populáció (összes háztartás) valódi átlagos havi fogyasztása. Fix, de ismeretlen szám.
- **Mintastatisztika:** X̄ = 236 kWh — a 80 háztartásból kiszámolt mintaátlag. Ismert, de csak becslése μ-nek.

Egy másik 80 háztartásból álló minta más átlagot adna, mert más háztartások kerülnének bele — minden háztartásnak más a fogyasztása, ezért a mintaátlag mintánként véletlenszerűen ingadozik (mintavételi ingadozás). A paraméter (μ) mindig ugyanaz marad, de a mintastatisztika (X̄) minden új mintánál más értéket vesz fel.

---

### 3. feladat — Konfidenciaintervallum értelmezése

**Feladat:** Egy jelentés azt írja: "A várakozási idő átlagára vonatkozó 95%-os konfidenciaintervallum [18.2, 21.6] perc." Döntsd el melyik értelmezés helyes, és javítsd ki a helyteleneket:

a) 95% valószínűséggel tartalmazza ez a konkrét intervallum a valódi átlagot.
b) Ha ugyanezt a mintavételi eljárást sokszor megismételnénk, az így kapott intervallumok kb. 95%-a tartalmazná a valódi átlagot.
c) Az egyéni várakozási idők kb. 95%-a 18.2 és 21.6 perc közé esik.
d) Az intervallum a valódi átlag plauzibilis értékeit adja meg, nem az egyéni megfigyelésekét.

**Elméleti háttér**

A konfidenciaintervallum a **populáció átlagára** vonatkozó becslés — azt adja meg, hogy a valódi átlag milyen értékek között valószínűleg mozog, adott konfidenciaszint mellett.

Két dolgot fontos megérteni:
- A 95% **a módszerre** vonatkozik, nem egy konkrét intervallumra. Miután kiszámoltuk az intervallumot, az már fix — vagy tartalmazza a valódi átlagot, vagy nem. A 95% azt jelenti, hogy ha sokszor megismételnénk a mintavételt és minden alkalommal kiszámolnánk az intervallumot, azok 95%-a tartalmazná a valódi átlagot.
- A konfidenciaintervallum **az átlagra** vonatkozik, nem az egyéni megfigyelésekre. Az egyéni értékek sokkal jobban szóródnak — erre a predikciós intervallum vonatkozik, ami mindig szélesebb.

**Megoldás**

- **a) helytelen** — miután az adatokat megfigyeltük és kiszámoltuk az intervallumot, az már fix. Nem mondhatjuk hogy "95% valószínűséggel" tartalmazza a valódi átlagot — a 95% a hosszú távú módszer megbízhatóságára vonatkozik, nem erre a konkrét intervallumra.
- **b) helyes** — ez a klasszikus frequentista értelmezés: ha sokszor megismételjük a mintavételt, az intervallumok 95%-a tartalmazza a valódi átlagot.
- **c) helytelen** — összekeveri a konfidenciaintervallumot a predikciós intervallummal. A konfidenciaintervallum az átlag plausibilis értékeit adja meg, nem az egyéni megfigyelésekét. Az egyéni várakozási idők sokkal jobban szóródnak mint az átlag.
- **d) helyes** — pontosan leírja mit jelent a konfidenciaintervallum: az átlag plausibilis értékeit adja meg, nem az egyéni megfigyelésekét.

---

### 4. feladat — p-érték értelmezése és döntés

**Feladat:** Egy tesztben \\(H_0\colon \mu=100\\) vs \\(H_1\colon \mu\neq100\\), és a p-érték 0.032. Mi a döntés \\(\alpha=0.05\\)-nél és \\(\alpha=0.01\\)-nél? Miért helytelen ez a mondat: "annak valószínűsége hogy H0 igaz, 3.2%"?

**Elméleti háttér**

A döntési szabály egyszerű: ha \\(p < \alpha\\) → elutasítjuk \\(H_0\\)-t, ha \\(p \geq \alpha\\) → nem utasítjuk el \\(H_0\\)-t.

A p-érték kiszámításakor **feltesszük hogy H0 igaz**, és megkérdezzük: ha H0 igaz lenne, mekkora valószínűséggel kapnánk ilyen vagy még szélsőségesebb adatot?

$$p\text{-érték} = P(\text{ilyen vagy szélsőségesebb adat} \mid H_0 \text{ igaz})$$

Ez **nem** ugyanaz mint annak valószínűsége hogy H0 igaz — ez a feltételes valószínűség megfordítása lenne, amit **prosecutor's fallacy**-nek (ügyész tévedésének) nevezünk.

**Megoldás**

- **\\(\alpha=0.05\\)-nél:** \\(p=0.032 < 0.05\\) → **elutasítjuk \\(H_0\\)-t**
- **\\(\alpha=0.01\\)-nél:** \\(p=0.032 > 0.01\\) → **nem utasítjuk el \\(H_0\\)-t**

Ez megmutatja, hogy ugyanaz a p-érték különböző \\(\alpha\\) szinteken különböző döntést adhat — minél szigorúbb az \\(\alpha\\), annál nehezebb elutasítani \\(H_0\\)-t.

**Miért helytelen a "H0 igaz valószínűsége 3.2%"?**

A p-érték kiszámításakor feltesszük hogy H0 igaz — tehát a p-érték ezt méri:

$$p = P(\text{adat} \mid H_0 \text{ igaz})$$

A helytelen mondat viszont ezt állítja:

$$P(H_0 \text{ igaz} \mid \text{adat}) = 3.2\%$$

Ez megfordítja a feltételes valószínűséget — ezt hívják **prosecutor's fallacy**-nek. A p-érték nem mondja meg mekkora valószínűséggel igaz H0, csak azt hogy mennyire meglepő lenne az adatunk, ha H0 igaz lenne.


### 5. feladat — p-érték és α kapcsolata

**Feladat:** Tegyük fel hogy \\(H_0\\)-t elutasítottuk \\(\alpha=0.05\\)-nél. Mit tudunk mondani a döntésről \\(\alpha=0.10\\)-nél és \\(\alpha=0.01\\)-nél?

**Elméleti háttér**

A döntési szabály: ha \\(p < \alpha\\) → elutasítjuk \\(H_0\\)-t.

Ha tudjuk hogy \\(H_0\\)-t elutasítottuk \\(\alpha=0.05\\)-nél, akkor biztosan tudjuk hogy \\(p < 0.05\\). Ebből következik:
- Minden \\(\alpha > 0.05\\)-nél is igaz hogy \\(p < \alpha\\) → elutasítjuk \\(H_0\\)-t
- \\(\alpha < 0.05\\)-nél nem tudunk dönteni, mert csak annyit tudunk hogy \\(p < 0.05\\), de nem tudjuk pontosan mekkora

Általános szabály:
- Kisebb \\(\alpha\\) → szigorúbb feltétel → nehezebb elutasítani \\(H_0\\)-t
- Nagyobb \\(\alpha\\) → lazább feltétel → könnyebb elutasítani \\(H_0\\)-t

**Megoldás**

- **\\(\alpha=0.10\\)-nél:** biztosan **elutasítjuk \\(H_0\\)-t** — mert ha \\(p < 0.05\\), akkor \\(p < 0.10\\) is teljesül
- **\\(\alpha=0.01\\)-nél:** **nem tudunk dönteni** — csak annyit tudunk hogy \\(p < 0.05\\), de ez lehet pl. 0.008 (akkor elutasítjuk) vagy 0.03 (akkor nem utasítjuk el)

A szigorúbb \\(\alpha\\) szint tehát nem következik automatikusan a lazábból — a döntés csak "lefelé" (lazább irányba) terjeszthető ki biztosan, "felfelé" (szigorúbb irányba) nem.


### 6. feladat — I. és II. típusú hiba

**Feladat:** Egy tűzjelző rendszert hipotézisvizsgálatként modellezünk. \\(H_0\\): "nincs veszélyes füst", és a jelző akkor csörög, ha elutasítjuk \\(H_0\\)-t. Mi az I. és II. típusú hiba? Ha sokkal kevésbé érzékennyé tesszük a jelzőt, melyik hibatípus valószínűsége nő és melyiké csökken?

**Elméleti háttér**

| | H0 igaz | H0 hamis |
|---|---|---|
| Nem utasítjuk el H0-t | Helyes döntés | **II. típusú hiba (β)** |
| Elutasítjuk H0-t | **I. típusú hiba (α)** | Helyes döntés (statisztikai erő) |

- **I. típusú hiba (α):** H0 igaz, de mégis elutasítjuk — hamis pozitív
- **II. típusú hiba (β):** H0 hamis, de nem utasítjuk el — hamis negatív
- A két hibatípus egymással szemben áll: ha az egyiket csökkented, a másik nő

**Megoldás**

- **I. típusú hiba:** nincs veszélyes füst, de a jelző mégis csörög → **hamis riasztás**
- **II. típusú hiba:** van veszélyes füst, de a jelző nem csörög → **elmulasztott észlelés**
- **Kevésbé érzékeny jelző:** ritkábban csörög → kevesebb hamis riasztás (I. típusú hiba csökken), de több elmulasztott észlelés (II. típusú hiba nő)

Ez a statisztikai tesztek alapvető dilemmája: az I. és II. típusú hiba egymással szemben áll — szigorúbb α (kisebb I. típusú hiba) szükségszerűen növeli a II. típusú hiba valószínűségét, és csökkenti a teszt erejét (power = 1−β).

### 7. feladat — t-eloszlás vs normális eloszlás

**Feladat:** Egy kutató egymintás t-konfidenciaintervallumot szeretne számolni ismeretlen várható értékre, ismeretlen varianciával. Miért jelenik meg a t-eloszlás a normális helyett? Milyen szerepe van a mintaméretnek?

**Elméleti háttér**

Ha a populáció szórása (σ) ismert, a standardizált mintaátlag normális eloszlást követ:

$$Z = \frac{\bar{X} - \mu}{\sigma/\sqrt{n}} \sim \mathcal{N}(0,1)$$

Ha σ nem ismert, a mintából becsült S szórással helyettesítjük:

$$T = \frac{\bar{X} - \mu}{S/\sqrt{n}} \sim t(n-1)$$

Az S maga is egy becslés (mintánként ingadozik), ez **extra bizonytalanságot** visz a számításba. Emiatt a tesztstatisztika nem normális eloszlású többé, hanem t-eloszlású — ami szélesebb szélű, mint a normális, hogy ezt a többletbizonytalanságot figyelembe vegye.

**Megoldás**

**Miért t-eloszlás?**

Mert σ ismeretlen, ezért S-sel becsüljük. Az S maga is bizonytalan (mintánként más értéket vesz fel), ez extra bizonytalanságot visz a számításba — ezért a tesztstatisztika t-eloszlást követ, nem normálist. A t-eloszlás szélesebb szélű mint a normális, hogy ezt a bizonytalanságot tükrözze.

**A mintaméret szerepe**

A mintaméret a szabadságfokban jelenik meg: \\(t(n-1)\\).

- **Kis n** → az S becslése bizonytalan → t-eloszlás szélesebb szélű → szélesebb konfidenciaintervallum
- **Nagy n** → az S becslése megbízhatóbb → t-eloszlás egyre jobban közelít a normális eloszláshoz → szűkebb konfidenciaintervallum

Nagy mintánál (kb. n > 30) a t-eloszlás és a normális eloszlás között már alig van különbség.

### 8. feladat — Regresszió értelmezése és reziduumdiagnosztika

**Feladat:** Egy kutató egyszerű lineáris regressziót illeszt ahol Y a vizsgaeredmény és x a tanulással töltött órák száma. A becsült meredekség pozitív. A reziduumplot ívelt mintázatot mutat. Értelmezd β₁-et szavakkal, mit jelent az ívelt mintázat, és bizonyítja-e a pozitív meredekség hogy a több tanulás jobb eredményt okoz?

**Elméleti háttér**

- **β₁ értelmezése:** a meredekség azt mutatja, mennyit változik Y várható értéke átlagosan, ha x eggyel nő — a lineáris modell szerint, minden más változatlansága mellett
- **Reziduumdiagnosztika:** egy jó modellben a reziduumok véletlenszerűen szóródnak. Ha mintázat látható, az azt jelzi hogy a modell valamit nem ragadott meg
- **Korreláció vs kauzalitás:** statisztikai összefüggés (pozitív meredekség) nem bizonyít okozati kapcsolatot — ehhez véletlenszerű kísérlet kellene

**Megoldás**

**1. β₁ értelmezése**

β₁ azt jelenti, hogy egy plusz tanult óra **átlagosan** ennyivel változtatja a várható vizsgaeredményt, a lineáris modell szerint. Ha β₁ > 0, a több tanulás magasabb várható vizsgaeredménnyel jár együtt.

**2. Ívelt mintázat a reziduumplotban**

Az ívelt mintázat azt jelzi, hogy a **linearitás feltétele sérül** — a tanulási órák és a vizsgaeredmény közötti kapcsolat nem lineáris. Lehet hogy egy bizonyos pont után a több tanulás már nem hoz arányos javulást. Megoldás: magasabb fokú tagot vagy más változót kellene hozzáadni a modellhez.

**3. Bizonyítja-e a pozitív meredekség az okozati kapcsolatot?**

Nem. A pozitív meredekség csak **összefüggést** (korrelációt) mutat, nem **okozati kapcsolatot** (kauzalitást). Lehetnek zavaró változók (confounders) amelyek mindkét változót befolyásolják:
- A motivált diákok egyszerre tanulnak többet ÉS érnek el jobb eredményt — a motiváció lehet az igazi ok
- Az okosabb diákok gyorsabban tanulnak ÉS jobb eredményt érnek el

Ahhoz hogy okozati kapcsolatot bizonyíts, véletlenszerű kísérlet kellene (pl. véletlenszerűen osztod el a diákokat "sokat tanul" és "keveset tanul" csoportokba). Observációs adatokból okozati következtetés nem vonható le.

### 9. feladat — Idősor stacionaritása és autokorreláció

**Feladat:** Egy napi idősor rögzíti egy weboldal látogatóinak számát. A plot hosszú távú növekvő trendet és egyértelmű heti mintázatot mutat. Plauzibilis-e a gyenge stacionaritás az eredeti sorra? Nevezz meg egy transzformációt ami közelebb vinné a sort a stacionaritáshoz! Mit jelent egy nagy pozitív autokorreláció a 7-es lagnál?

**Elméleti háttér**

**Stacionaritás:** egy idősor gyengén stacionárius, ha:
- Az átlaga időben állandó (nincs trend)
- A szórása időben állandó
- Az autokovarianciája csak a lagnál függ, nem az időponttól

**Autokorreláció:** azt méri, mennyire függ össze egy időpont értéke egy korábbi időpont értékével:
- Lag 1 = tegnap és ma összefüggése
- Lag 7 = 7 nappal ezelőtti és mai értékek összefüggése

**Differenciálás:** az idősor minden értékéből kivonjuk az előző értéket → eltávolítja a trendet. Szezonális differenciálásnál (lag 7) minden értékből a 7 nappal korábbit vonjuk ki → eltávolítja a heti szezonalitást.

**Megoldás**

**1. Plauzibilis-e a gyenge stacionaritás?**

Nem plauzibilis, két okból:
- **Növekvő trend** → az átlag folyamatosan nő → az átlag nem állandó → sérti a stacionaritás feltételét
- **Heti mintázat** → szisztematikus ismétlődő ciklus → az autokovariancia struktúra időponttól függ → sérti a stacionaritás feltételét

**2. Transzformáció a stacionaritáshoz**

- **Differenciálás** (első differencia) → eltávolítja a trendet: minden értékből kivonjuk az előző értéket
- **Szezonális differenciálás** (lag 7) → eltávolítja a heti szezonalitást: minden értékből kivonjuk a 7 nappal korábbit
- Más lehetőség: trend regresszió illesztése és a reziduumok vizsgálata, vagy mozgóátlag alapú trendszűrés

**3. Nagy pozitív autokorreláció lag 7-nél**

Azt jelenti, hogy a mai látogatószám szisztematikusan hasonló a 7 nappal ezelőttihez — vagyis **heti szezonalitás** van. Pl. minden hétfőn hasonló a forgalom mint az előző hétfőn, minden vasárnap hasonló mint az előző vasárnap. Ez megerősíti hogy a heti mintázat valódi és szisztematikus, nem véletlen ingadozás.

### 10. feladat — Többszörös tesztelés és p-hacking

**Feladat:** Egy cég 20 különböző weboldal-variánst tesztel, mindegyiket \\(\alpha=0.05\\) szignifikanciaszinten, majd bejelentik azt a variánst amelyiknél p=0.04. Mi a statisztikai probléma, és hogyan lehetne megbízhatóbbá tenni az elemzést?

**Elméleti háttér**

Ha egyszerre több hipotézist tesztelünk, a hamis pozitív eredmény valószínűsége megnő. Ha m független tesztet futtatunk α=0.05-tel, legalább egy hamis pozitív valószínűsége:

$$P(\text{legalább egy hamis pozitív}) = 1 - (1-\alpha)^m$$

| Tesztek száma (m) | Legalább egy hamis pozitív valószínűsége |
|---|---|
| 1 | 5% |
| 5 | 22.6% |
| 10 | 40.1% |
| 20 | 64.2% |
| 50 | 92.3% |

Tehát 20 tesztnél már 64.2% az esélye hogy legalább egy hamis pozitív eredményt kapunk — még akkor is, ha valójában egyik variáns sem jobb a másiknál.

**Bonferroni-korrekció:** ha m tesztet futtatunk és az összesített hamis pozitív arányt α szinten akarjuk tartani, minden egyes tesztnél \\(\alpha/m\\) küszöböt kell használni.

$$\alpha_{korrigált} = \frac{\alpha}{m} = \frac{0.05}{20} = 0.0025$$

**Megoldás**

**A probléma:** p-hacking és többszörös tesztelés. A cég 20 tesztet futtat, és csak azt jelenti be ahol p=0.04. Ez félrevezető, mert:
- 20 tesztnél 64.2% az esélye legalább egy hamis pozitívnak
- A p=0.04 eredmény lehet teljesen véletlen, nem valódi hatás
- A "legszignifikánsabb" eredmény kiválasztása és bejelentése torzítja az elemzést

**A megoldás:**
- **Bonferroni-korrekció:** α/20 = 0.0025 küszöböt kellene használni — a p=0.04 ekkor nem lenne szignifikáns
- **Előzetes regisztráció:** a primer kimeneteket előzetesen rögzíteni, mielőtt az adatokat megnézik
- **Exploratív jelölés:** a többi összehasonlítást exploratívként jelölni, nem konfirmatívként

# Témák

<iframe
  src="{{ '/assets/pdf/Topic list 26S.pdf' | relative_url }}"
  width="100%"
  height="860px"
  style="border: 1px solid var(--border); border-radius: 8px;">
</iframe>


