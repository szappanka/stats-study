---
layout: default
title: Statisztikai csapdák és paradoxonok
---

# Statisztikai csapdák és paradoxonok

## Miről szól ez a témakör?

A statisztikai félrevezetés legtöbbször nem hamis számokat használ – hanem **helyes számokat rossz összehasonlítási keretbe** helyez. Egy igaz százalék, egy valódi korreláció, egy valódi szignifikáns eredmény is lehet félrevezető, ha rossz nevezővel, rossz feltételezéssel vagy rossz összesítéssel mutatják be.

Ebben a fejezetben olyan helyzeteket tanulunk felismerni, ahol a statisztikai elemzés vagy prezentáció hibás következtetésre vezet.

---

## Félrevezető gyakorlatok

### Félrevezető adatvizualizáció

<div class="concept" markdown="1">
A grafikonok nem semleges ablakok az adatokra. Minden ábra választ tengelyt, skálát, időablakot, csoportosítást és geometriát – és ezek a döntések manipulálhatnak.

**Levágott y-tengely:** ha az y-tengely nem nulláról indul, kis változások drámai növekedésnek látszanak. Például egy 100-ról 102-re emelkedő index 2%-os növekedés, de ha a tengely 98-tól 104-ig fut, vizuálisan megduplázódásnak tűnhet.

**Cseresznyézett időablak:** egy hosszú, zajos sorozatból a legdramatikusabb kezdő és záró dátumot választják, és "trendet" olvasnak ki belőle – ami a teljes adatsoron nem látszik.

**3D kördiagram:** a perspektíva megváltoztatja az érzékelt területet – az előtérbeli szelet nagyobbnak látszik. A néző dizájnból olvas ki adatot.

**Túl sok információ:** sok sorozat, szín és felirat technikailag igaz lehet, de kognitívan használhatatlan.

**Javítás:** kérdezd meg, milyen döntést tett láthatatlanná a grafikon. A manipuláció általában a tervezési döntésben rejlik, nem az adatpontban.
</div>

### Adatok kontextus nélküli közlése

<div class="concept" markdown="1">
Egy szám önmagában ritkán értelmes – mindig kell valamilyen összehasonlítási alap.

**Példa:** "Ez a város havi 500 bűncselekménnyel rendelkezik." Ez sok vagy kevés? Ha a város 100 000 főből áll, az más, mint ha 1 000 000 főből.

**Relatív változás alap nélkül:** "Az eladások 300%-kal nőttek" – de ha 10 egységről 40-re nőtt, az abszolút volumen még mindig kicsi.

**Javítás:** mindig adj arányszámot: főre, háztartásra, kilométerre, expozícióra vetítve. Mutasd meg az abszolút változást is, ne csak a relatívat.
</div>

### Nem megfelelő leíró statisztika választása

<div class="concept" markdown="1">
A statisztikának illeszkednie kell a mérési skálára, az eloszlásra és a kérdésre.

**Átlag vs. medián:** ha a jövedelemeloszlás jobbra ferde (néhány nagyon gazdag ember felfelé húzza az átlagot), az átlag nem jellemzi a tipikus személyt – a medián jobb. Például: 20, 22, 24, 25, 500 – az átlag 118, a medián 24. Az "átlagjövedelem nőtt" nem jelenti, hogy a tipikus ember jövedelmre nőtt.

**Más hibás választások:**
- átlag erősen ferde adatnál
- korreláció nemlineáris kapcsolatnál
- kétmintás teszt páros adatnál
- ordinális kategóriák precíz mérésként kezelése

**Javítás:** a statisztika illeszkedjen a mérési skálához, az eloszláshoz és a kérdéshez.
</div>

### Feltételek ellenőrzése nélküli módszerek alkalmazása

<div class="concept" markdown="1">
Minden statisztikai módszernek vannak feltételei, amelyek nem teljesülése esetén az eredmény félrevezető.

**Példák:**
- Lineáris regresszió használata nemlineáris kapcsolatnál (lásd: Anscombe-kvartett – négy adatsor, amelyeknek szinte azonos az átlaga, szórása, korrelációja és regressziós egyenese, de teljesen különböző a szóródiagramjuk)
- Homoszkedaszticitás feltételezése heteroszkedasztikus adatnál (változó szórás)
- Független minták tesztje páros adatnál

**Javítás:** rajzold fel az adatokat, vizsgáld meg a reziduálisokat, ellenőrizd a feltételeket mielőtt következtetést vonol le.
</div>

### Korreláció összekeverése kauzalitással

<div class="concept" markdown="1">
Két változó összefüggése nem jelenti, hogy az egyik okozza a másikat.

**Klasszikus példa:** a fagylalt-eladások és az erőszakos bűncselekmények száma egyaránt nő nyáron. Az összefüggés valódi, de az ok a meleg időjárás, a szezonalitás és a szabadtéri tevékenységek – nem a fagylalt.

**Rejtett változó:** mindkét változót egy harmadik (konfundáló) változó vezérli.

**Javítás:** ok-okozati következtetéshez kell egy megfelelő kutatási terv: véletlenszerű kísérlet, természetes kísérlet, instrumentális változó, különbségek különbsége, regressziós diszkontinuitás vagy megbízható kauzális modell.
</div>

### Kis mintákból való következtetés

<div class="concept" markdown="1">
Kis minták esetén a mintavételi variabilitás nagy, és véletlenszerűen is kaphatunk szélsőséges eredményeket.

**Példa:** egy közvélemény-kutatás n=1000 fős mintánál kb. ±3%-os hibahatárral becsüli az arányt. Ha a különbség 2 pont, az kisebb a hibahatárnál – a verseny statisztikailag bizonytalan, mégis azt írják: "A jelölt vezet 2 ponttal."

**Javítás:** mindig mutasd a mintaméretet, a konfidenciaintervallumot és a hibahatárt. Ne vonj le szilárd következtetést kis mintából.
</div>

### p-hacking és többszörös tesztelés

<div class="concept" markdown="1">
**p-hacking:** rugalmas elemzéssel "előállítani" egy szignifikáns eredményt – sok kimenetet próbálni, sok alcsoportot, megállni ha p < 0.05, kizárni kényelmetlenül ható megfigyeléseket, az átalakításokat utólag választani.

**Miért veszélyes:** ha m független nullhipotézist tesztelünk 5%-os szinten, legalább egy hamis pozitív valószínűsége:

$$P(\text{legalább egy hamis pozitív}) = 1 - (1-0.05)^m$$

<table>
  <thead>
    <tr><th>m (tesztek száma)</th><th>1</th><th>5</th><th>10</th><th>20</th><th>50</th><th>100</th></tr>
  </thead>
  <tbody>
    <tr><td>Valószínűség</td><td>5%</td><td>22.6%</td><td>40.1%</td><td>64.2%</td><td>92.3%</td><td>99.4%</td></tr>
  </tbody>
</table>

**Extrém eset:** egy genomszintű asszociációs vizsgálat kb. 10⁶ variánst tesztel. Ha mind null, 5%-os szinten ~50 000 hamis pozitivot kapnánk. Ezért ilyen vizsgálatokban a küszöb ~5·10⁻⁸.

**Javítás:** előzetesen rögzíts primer kimeneteket, jelentess minden elemzést, korrigálj többszörös összehasonlításra (pl. Bonferroni), és jelöld az exploratív eredményeket exploratívként.
</div>

### Mintavételi torzítások

<div class="concept" markdown="1">
Ha a minta nem reprezentálja a célpopulációt, a következtetés torzított lesz.

**Berkson-paradoxon (kórházi mintavétel):** ha csak kórházi betegeken vizsgálunk összefüggést, a kórházi felvétel szelektál – a populációban független betegségek a kórházi mintában összefüggőnek látszhatnak (lásd részletesebben lent).

**Önkéntes/kényelmi minta:** az önként jelentkezők nem reprezentatívak – például egészségesebb, motiváltabb, vagy gazdagabb emberek hajlamosak részt venni.

**Barátság-paradoxon (hálózati mintavétel):** ha barátainkon keresztül mintázunk, a nagy fokszámú (sok baráttal rendelkező) emberek felülreprezentáltak. Ezért a "legtöbbeknek kevesebb barátja van, mint barátaiknak" – nem illúzió, hanem matematikai tény.

**Javítás:** kérdezd meg, mi a mintavétel egysége (személy, barátság, kórházi látogatás, hírfolyam-bejegyzés), és ki kerülhetett be a mintába.
</div>

---

## Félreértelmezések

### Az ügyész tévedése (Prosecutor's fallacy)

<div class="concept" markdown="1">
**A csapda:** \\(P(\text{bizonyíték} \mid \text{ártatlan})\\) kis értékét összetévesztjük \\(P(\text{ártatlan} \mid \text{bizonyíték})\\)-kel. Ez a feltételes valószínűség megfordítása.

**Bayes-tétel:**

$$P(\text{ártatlan} \mid \text{bizonyíték}) = \frac{P(\text{bizonyíték} \mid \text{ártatlan}) \cdot P(\text{ártatlan})}{P(\text{bizonyíték})}$$

**Sally Clark-eset:** egy szakértő ~"1 a 73 millióból" valószínűséget adott meg két csecsemő hirtelen haláláról egy családban. A Királyi Statisztikai Társaság figyelmeztetett, hogy ezt a számot tévesen az ártatlanság valószínűségeként értelmezték. Két hiba volt:
1. **Függetlenségi hiba:** a két haláleset kockázatát megszorozták, mintha a halálok független lenne – de genetikai és környezeti tényezők összefügghetnek.
2. **Feltételezési hiba:** \\(P(\text{bizonyíték} \mid \text{ártatlan}) \neq P(\text{ártatlan} \mid \text{bizonyíték})\\)

**DNS-adatbázis:** ha egy DNS-profil véletlen egyezési valószínűsége 1/1 000 000, de 5 000 000 főt tartalmazó adatbázisban keresünk, várhatóan **5 véletlen egyezés** van. Az "egymillióból egy" kifejezés egészen mást jelent egyetlen előzetesen megjelölt gyanúsított esetén, mint adatbázis-keresés után.
</div>

### A ritka betegség problémája és az alaparány elhanyagolása

<div class="concept" markdown="1">
**A csapda:** figyelmen kívül hagyjuk az alaparányt (base rate), és csak a teszt érzékenységére koncentrálunk.

**Mammográfia példa:** 10 000 nőből 100-nak van mellrákja. A teszt érzékenysége 90%, hamis pozitív aránya 9%.

<table>
  <thead>
    <tr><th></th><th>Pozitív teszt</th><th>Negatív teszt</th></tr>
  </thead>
  <tbody>
    <tr><td>Rák (100 fő)</td><td>90</td><td>10</td></tr>
    <tr><td>Nincs rák (9 900 fő)</td><td>891</td><td>9 009</td></tr>
  </tbody>
</table>

$$P(\text{rák} \mid \text{pozitív}) = \frac{90}{90 + 891} \approx 9.2\%$$

Egy pozitív eredmény komoly és utánkövetést igényel, de **nem egyenlő a diagnózissal**. Az alacsony alaparány (1%) miatt a hamis pozitívak száma messze meghaladja az igazi pozitívakét.
</div>

### Időhöz kötött torzítás

<div class="concept" markdown="1">
**A csapda:** az időbeli összehasonlítás torzítást okoz, amelyet figyelmen kívül hagynak.

**Will Rogers-jelenség:** jobb diagnosztikai technológia a határeseteket az "korai stádiumú" csoportból "késői stádiumú" csoportba sorolhatja át. Mindkét csoport átlagos túlélése javulhat – anélkül, hogy egyetlen beteg is egészségesebb lett volna.

Példa: korábbi "korai stádium": {90, 80, 70, 40}, átlag = 70. "Késői stádium": {30, 20, 10}, átlag = 20. Ha a 40-et átsoroljuk: "korai": {90, 80, 70}, átlag = 80; "késői": {40, 30, 20, 10}, átlag = 25. Mindkét csoport átlaga nőtt – de senki nem gyógyult meg.

**Újságírói csapda:** "minden stádiumban javult a túlélés" tükrözhet puszta átsorolást, nem jobb kezelést.
</div>

### Abszolút és relatív gyakoriságok összetévesztése

<div class="concept" markdown="1">
**A csapda:** csak a relatív változást közlik az abszolút alap nélkül.

**1995-ös fogamzásgátló-pánik:** egy figyelmeztetés szerint egyes harmadik generációs fogamzásgátlók megduplázták a vénás tromboemboliák kockázatát. Ez igaz volt, de a legtöbb tudósítás nem adta meg az alapkockázatot.

| Keretezés | Szám | Érzelmi hatás |
|---|---|---|
| Relatív növekedés | kockázat megkétszereződött | riasztó |
| Abszolút növekedés | kb. 1 extra eset/7000 felhasználó/év | döntésorientált |

Ha a kockázat 1/7000-ről 2/7000-re nő, a relatív növekedés 100%, de az abszolút növekedés 0.014%.

**Javítás:** mindig add meg mindkettőt – az abszolút különbséget és a relatív változást.
</div>

### Relatív gyakoriság visszaélés kis százalékoknál

<div class="concept" markdown="1">
**A csapda:** amikor az alapszint nagyon kicsi, a relatív változás félrevezető nagynak tűnik.

Ha valami 0.001%-ról 0.002%-ra nő, ez "100%-os növekedés" – de az abszolút különbség elhanyagolható. A "megduplázódott" kifejezés drámai, holott a valódi kockázat minimális maradt.

**Javítás:** kis abszolút szintű jelenségeknél mindig mutasd az abszolút számokat is. A "hányszorosára nőtt" önmagában nem informatív.
</div>

---

## Paradoxonok és jelenségek

### Simpson-paradoxon

<div class="concept" markdown="1">
**Lényege:** egy trend megjelenik minden alcsoportban, de eltűnik vagy megfordul, ha az alcsoportokat összesítjük. A mechanizmus nem mágia: az összesítés megváltoztatja a súlyokat.

**Berkeley-eset (1975):** az összesített adatok szerint a férfiakat sokkal nagyobb arányban vették fel az egyetemre (44.3% vs. 34.6%). De kar szintjén vizsgálva a nők több karon hasonlóan vagy jobban teljesítettek. A magyarázat: a nők arányaiban több olyan karra jelentkeztek, ahol alacsonyabb volt a felvételi arány.

| Kar | Férfiak felvételi aránya | Nők felvételi aránya |
|---|---|---|
| A | 62% | 82% |
| B | 63% | 68% |
| C | 37% | 34% |
| D | 33% | 35% |
| E | 28% | 24% |
| F | 6% | 7% |
| **Összesen** | **44.3%** | **34.6%** |

**Vesekő-kezelés:** az összesített adatok szerint a kevésbé invazív kezelés jobb (82.6% vs. 78.0%), de kis és nagy kövek esetén egyaránt az invazívabb a jobb. Az összesítés megfordult, mert az invazív módszert nehezebb esetekre alkalmazták.

**Matematikai magyarázat:**

$$P(A \mid G) = \sum_d P(A \mid G, D=d) \cdot P(D=d \mid G)$$

Az alcsoporton belüli arányok és a csoport súlyai (melyik alcsoportba kerülnek) együtt határozzák meg az összesített számot.

**Javítás:** releváns alcsoportok szerint is elemezz. Az összesített szám elfedhet döntő különbségeket.
</div>

### Berkson-paradoxona

<div class="concept" markdown="1">
**Lényege:** ha szelektált mintán (pl. kórházi betegeken) végzünk vizsgálatot, a populációban független betegségek a mintában összefüggőnek látszhatnak – a szelekciós mechanizmus miatt.

**Példa:** tegyük fel, hogy A betegség és B betegség egymástól független, mindkettő prevalenciája 10%, 10 000 fős populációban:

<table>
  <thead>
    <tr><th></th><th>B beteg</th><th>B egészséges</th><th>Összesen</th></tr>
  </thead>
  <tbody>
    <tr><td>A beteg</td><td>100</td><td>900</td><td>1 000</td></tr>
    <tr><td>A egészséges</td><td>900</td><td>8 100</td><td>9 000</td></tr>
  </tbody>
</table>

Populációban: \\(P(B \mid A) = 10\%\\), \\(P(B \mid A^c) = 10\%\\) – nincs összefüggés.

Ha a kórházi mintába csak azok kerülnek be, akiknek A vagy B betegségük van (az "egyik sem" cella eltűnik):

<table>
  <thead>
    <tr><th></th><th>B beteg</th><th>B egészséges</th><th>Összesen</th></tr>
  </thead>
  <tbody>
    <tr><td>A beteg</td><td>100</td><td>900</td><td>1 000</td></tr>
    <tr><td>A egészséges</td><td>900</td><td>0</td><td>900</td></tr>
  </tbody>
</table>

Kórházi mintában: \\(P(B \mid A) = 10\%\\), de \\(P(B \mid A^c) = 100\%\\). Az A betegség most úgy tűnik, **védi** B ellen – holott valójában teljesen független tőle. A szelekció hozta létre a látszólagos összefüggést.

**Javítás:** ne elemezz szelektált alcsoportot úgy, mintha a teljes populáció véletlen mintája lenne. Modellezd vagy mérd a szelekciós mechanizmust.
</div>

### Hand-paradoxon

<div class="concept" markdown="1">
**Lényege:** A legyőzheti B-t, B legyőzheti C-t, és C legyőzheti A-t. A páronkénti fölény nem feltétlenül hoz létre konzisztens globális rangsorát.

$$A \succ B, \quad B \succ C, \quad C \succ A$$

**Hol jelenik meg:** módszerek összehasonlítása különböző adathalmazokon, metrikákon vagy alcsoportokon. "Ez a módszer jobb, mint az" – de ez az összehasonlítástól, az adathalmaztól és a metrikától függ.

**Újságírói csapda:** "Az X módszer jobb, mint az Y módszer" – de melyik versenytárs, melyik adathalmaz, melyik metrika és melyik alcsoport alapján?
</div>

<div class="callout exam" markdown="1">
**Vizsgán – hogyan ismerd fel ezeket:**

A legtöbb statisztikai félrevezetés öt "keret-hibából" ered:
1. **Rossz nevező** – mit osztunk mire?
2. **Rossz feltételezés** – melyik esemény van a feltételes jel után?
3. **Rossz összesítés** – Simpson-paradoxon, rejtett súlyok
4. **Rossz időablak** – cseresznyézett időszak, Will Rogers-jelenség
5. **Rossz kauzális történet** – korreláció ≠ kauzalitás
</div>