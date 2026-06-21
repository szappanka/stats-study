---
title: Felismerési puska
layout: default
has_todo: true
---

# Felismerési puska – Matstat teszt választás

## 1. Hány csoport / minta?
- 1 minta → egymintás teszt
- 1 minta, bináris kimenet, konkrét arányhoz hasonlítva → binomiális teszt
- 2 független csoport → kétmintás teszt
- 2 csoport, ugyanazok az alanyok (előtte-utána) → páros teszt
- 3+ független csoport → ANOVA vagy Kruskal-Wallis
- 3+ csoport, ismételt mérés ugyanazon alanyokon → Repeated-measures ANOVA vagy Friedman

## 2. Ismert-e a szórás / normális-e az eloszlás?
- Ismert szórás → z-teszt
- Ismeretlen szórás, normális vagy nagy minta → t-teszt
- Nem tudjuk hogy normális, vagy kicsi a minta és nem normális → nemparaméteres alternatíva
- Bináris kimenet (siker/kudarc) → nem normalitás kérdés, hanem binomiális eloszlás

## 3. Változó típusa

**Paraméteres** (numerikus, normális vagy nagy minta)
Példák: testmagasság (cm), vérnyomás, hőmérséklet, reakcióidő (ezredmásodperc), jövedelem nagy mintán

**Nemparaméteres** (ordinális VAGY numerikus de nem normális)
- Ordinális példák: elégedettségi pontszám 1-5, fájdalom skála 1-10, iskolai végzettség szintje
- Nem normális numerikus példák: jövedelem kis mintán (ferde eloszlás), várakozási idő, korlátos skála sok szélsőértékkel

**Kategorikus** (gyakoriság alapú, nincs sorrend)
Példák: nem (férfi/nő), vércsoport, párt amire szavazott, igen/nem válasz, beteg/egészséges státusz
Itt nem átlagot hasonlítunk, hanem gyakoriságokat/arányokat
- Speciális eset: bináris kimenet (siker/kudarc) egyetlen mintán, konkrét aránnyal összevetve, pl. "a betegek legalább 70 százalékánál hatásos" → binomiális teszt

## 4. Mit kérdez a feladat?
- Eltér-e az átlag/medián egy adott értéktől → egymintás teszt
- Egyetlen mintában a sikerek aránya eltér-e (vagy legalább/legfeljebb annyi-e) egy állított aránytól → binomiális teszt
- Különböznek-e a csoportok átlagai/eloszlásai → kétmintás vagy többmintás teszt
- Függ-e két kategorikus változó egymástól → χ²-függetlenségvizsgálat
- Illeszkedik-e az adat egy eloszlásra → Kolmogorov-Smirnov vagy χ²-illeszkedésvizsgálat
- Van-e kapcsolat/hatás két numerikus változó között → regresszió
- Van-e trend/szezonalitás → idősor diagnosztika (Dickey-Fuller, Ljung-Box)
- Kicsi a minta, extrém pontos eredmény kell → egzakt teszt (Fisher exact, Lady Tasting Tea, binomiális teszt)
- Páros, bináris kimenet (pl. előtte/utána igen-nem) → McNemar teszt

## 5. Szórások egyenlősége (két csoportnál) - csak paraméteresnél (t-teszt esetén)
- Ha feltesszük hogy egyenlő a szórás → sima kétmintás t-teszt
- Ha nem feltesszük → Welch-teszt
- A szórások egyenlőségét magát az F-teszttel vizsgáljuk
- Ha nemparaméteres útra mentél (2-3. lépésben), ez a pont nem releváns

## 6. Paraméteres vs nemparaméteres párok

<table class="test-table">
  <thead>
    <tr>
      <th>Paraméteres</th>
      <th>Nemparaméteres megfelelő</th>
      <th>Mikor</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><span class="tip" data-tip="A mintaátlag és a feltételezett érték különbségét osztjuk a becsült standard hibával. Ha a különbség sok standard hibányira van nullától, elutasítjuk H0-t.">Egymintás t-teszt</span></td>
      <td><span class="tip" data-tip="A mintaértékeket a feltételezett mediánhoz képest rangsoroljuk, majd a pozitív és negatív rangösszegeket hasonlítjuk. Sign test: csak az előjeleket számolja, nem a rangokat.">Wilcoxon signed-rank (egymintás) / sign test</span></td>
      <td>1 minta</td>
    </tr>
    <tr>
      <td><span class="tip" data-tip="A párok különbségeiből (Dᵢ = Xᵢ − Yᵢ) egymintás t-tesztet csinálunk a különbségek várható értékére (H0: a különbségek átlaga 0).">Páros t-teszt</span></td>
      <td><span class="tip" data-tip="A párok különbségeit vesszük, előjel nélkül rangsoroljuk, majd az előjeleket visszarakjuk a rangokra. Ha a pozitív és negatív rangok összege nagyon eltér egymástól, az szisztematikus különbségre utal.">Wilcoxon signed-rank teszt</span></td>
      <td>2 csoport, ugyanazok az alanyok</td>
    </tr>
    <tr>
      <td><span class="tip" data-tip="A két csoportátlag különbségét osztjuk a különbség becsült standard hibájával. Welchnél a standard hiba számítása nem tételezi fel az egyenlő varianciát, ezért a szabadságfok is más (törtszámú lehet).">Kétmintás t-teszt</span></td>
      <td><span class="tip" data-tip="Az összes megfigyelést (mindkét csoportból) közösen rangsoroljuk, majd az egyik csoport rangösszegét nézzük. Ha az egyik csoport értékei szisztematikusan magasabb rangot kapnak, az a csoportok közötti különbségre utal.">Mann-Whitney (= Wilcoxon rank-sum)</span></td>
      <td>2 független csoport</td>
    </tr>
    <tr>
      <td><span class="tip" data-tip="A csoportok közötti szórást hasonlítja a csoportokon belüli szóráshoz. Ha a csoportok közötti eltérés sokkal nagyobb mint a véletlen ingadozás, elutasítjuk H0-t. Az F-statisztika ennek a két szórásnak a hányadosa.">ANOVA</span></td>
      <td><span class="tip" data-tip="A Mann-Whitney általánosítása 3+ csoportra: minden megfigyelést közösen rangsorolunk, majd megnézzük, hogy a csoportok átlagrangja mennyire tér el egymástól.">Kruskal-Wallis</span></td>
      <td>3+ független csoport</td>
    </tr>
    <tr>
      <td><span class="tip" data-tip="Az ANOVA kiterjesztése ismételt mérésekre: ugyanazokat az alanyokat mérjük több feltétel alatt. Az alanyok közötti variabilitást kivonja a hibából, növelve a teszt statisztikai erejét.">Repeated-measures ANOVA</span></td>
      <td><span class="tip" data-tip="A Kruskal-Wallis általánosítása ismételt mérésekre: minden alany adatait együtt rangsoroljuk, majd az egyes feltételek rangösszegeit hasonlítjuk egymáshoz.">Friedman teszt</span></td>
      <td>3+ csoport, ugyanazok az alanyok</td>
    </tr>
  </tbody>
</table>

**Külön eset (nincs paraméteres párja, mindig egzakt/kategorikus):**

| Teszt | Mikor |
|---|---|
| Binomiális teszt | 1 minta, bináris kimenet, konkrét aránnyal összevetve |
| Fisher exact teszt | kis minta, kontingenciatábla, kategorikus változók kapcsolata |
| McNemar teszt | páros, bináris kimenet (pl. igen/nem előtte-utána) |
| χ²-teszt | kategorikus változók függetlensége vagy illeszkedés |

## 7. Hipotézisfelírás szabálya
- H0 mindig egyenlőséget tartalmaz, ez a "nincs különbség / nincs hatás" állapot
- H1 az amit ki akarunk mutatni, ez tartalmazza a "van különbség / van hatás" állítást
- Kétoldali, ha a szöveg csak annyit kérdez: különbözik-e, eltér-e
- Egyoldali, ha a szöveg irányt mond: nagyobb-e, csökkenti-e, javít-e, legalább annyi-e
- H0-ba mindig az kerül, amit a kutató meg akar cáfolni, nem a saját állítása

## 8. Tesztstatisztika logikája (mit csinál a teszt valójában)

<div class="callout exam">
  <p><strong>Vizsgán:</strong> a Tételsor szerint a legtöbb tesztnél elég a feltételeket, a hipotéziseket, a tesztstatisztikát és annak eloszlását fogalmi szinten ismerni — nem kell kézzel levezetni vagy kiszámolni. Van viszont 4 kivétel, ahol kifejezetten <strong>levezetést</strong> várnak el: az egy- és kétmintás z-teszt, az egymintás t-teszt képlete, az ANOVA tesztstatisztika levezetése, és az R² képletének levezetése. Ezeket lentebb külön, részletesebben kifejtve találod.</p>
</div>

---

### z-teszt (egymintás)

**Mi a probléma, amit megold?**

Van egy állításod egy populáció átlagáról. Megmérsz egy mintát, és az átlaga kicsit más, mint az állított érték. A kérdés: ez azért van, mert tényleg téves az állítás, vagy csak véletlen ingadozás a mintában?

**Az alaplogika**

Minden mintának van természetes ingadozása. A teszt azt méri, hogy a mért és az állított érték közötti különbség mekkora ahhoz képest, amennyi ingadozást a véletlen simán okozhatna egy ekkora mintánál.

**Feltételek**

- A megfigyelések normális eloszlásból származnak (vagy elég nagy a minta)
- A populáció szórása (σ) **ismert** — a szövegben konkrét, a mintától független σ-érték szerepel, vagy ki van mondva hogy "ismert a szórás"
- Ha a szöveg "nem ismert szórást" mond, vagy egyáltalán nem ad meg σ-t → nem z-teszt, hanem t-teszt kell

**Levezetés**

1. \\(X_1, \ldots, X_n \sim \mathcal{N}(\mu, \sigma^2)\\) független megfigyelések
2. A mintaátlag maga is valószínűségi változó, \\(\bar{X} \sim \mathcal{N}(\mu, \sigma^2/n)\\) — az átlagolás kisimítja az egyedi ingadozást, minél nagyobb \\(n\\), annál stabilabb az átlag
3. \\(H_0\\) alatt (\\(\mu = \mu_0\\)) standardizálva:

$$Z = \frac{\bar{X} - \mu_0}{\sigma / \sqrt{n}} \sim \mathcal{N}(0, 1)$$

Ha \\(\lvert Z \rvert\\) nagy, az azt jelenti hogy a mintaátlag sok "standard hibányira" van az állított értéktől → gyanús, elutasítjuk \\(H_0\\)-t.

**Mini példa**

Egy gyár azt állítja, az általuk gyártott elemek átlagélettartama 500 óra. Korábbi, nagy mintás mérésekből tudjuk, hogy a populáció szórása \\(\sigma = 40\\) óra. Egy 64 elemes mintát vizsgálva az átlag 488 óra.

\\(H_0\colon \mu = 500\\), \\(H_1\colon \mu \neq 500\\)

$$Z = \frac{488 - 500}{40 / \sqrt{64}} = \frac{-12}{5} = -2.4$$

Ez a Z-érték (\\(-2.4\\)) elég messze van 0-tól (a kritikus érték kétoldali \\(\alpha = 0.05\\)-nél kb. \\(\pm 1.96\\)), tehát \\(\lvert Z \rvert > 1.96\\), elutasítjuk \\(H_0\\)-t — a valódi átlagélettartam valószínűleg nem 500 óra.

<div class="callout exam">
  <p><strong>Mire figyelj a felismerésnél</strong></p>
  <p>A z-teszt felismerésének egyetlen konkrét jele: a szöveg explicit megadja vagy kimondja, hogy ismert a populáció szórása. Ha ez nincs kimondva, t-tesztre kell váltani.</p>
</div>

### t-teszt (egymintás)

**Mi a probléma, amit megold?**

Ugyanaz a helyzet mint a z-tesztnél (egy mintaátlagot hasonlítasz egy állított értékhez), de itt **nem ismered a populáció szórását** \\(\sigma\\). Meg kell becsülnöd a mintából.

**Az alaplogika**

Mivel a szórást \\(\sigma\\) helyett a mintából becsült \\(S\\)-sel helyettesítjük, ez **extra bizonytalanságot** visz a számításba — nemcsak az átlag bizonytalan, hanem a "mérce" (a szórásbecslés) is. Emiatt a teszt statisztika nem pontosan normális eloszlású többé, hanem egy szélesebb szélű eloszlást követ: a t-eloszlást. Kis mintánál ez a többletbizonytalanság nagyobb (szélesebb a t-eloszlás), nagy mintánál a t-eloszlás egyre jobban közelít a normálishoz.

**Feltételek**

- A megfigyelések normális eloszlásból származnak (kisebb mintánál ez fontosabb, nagy mintánál kevésbé kritikus a centrális határeloszlás-tétel miatt)
- A populáció szórása **nem ismert** — ezt a mintából becsüljük (\\(S\\))
- Ha a szöveg konkrét, a mintától független \\(\sigma\\)-t ad meg → nem t-teszt, hanem z-teszt kell

**Levezetés / képlet**

\\(\sigma\\) helyett a korrigált tapasztalati szórást (\\(S\\)) használjuk:

$$T = \frac{\bar{X} - \mu_0}{S / \sqrt{n}} \sim t(n-1)$$

A szabadságfok \\(n-1\\), mert a mintaátlag kiszámításához már felhasználtunk egy "szabadságot" az adatokból (az \\(S\\) becsléséhez az átlagot is fel kell használni, ez köti meg az egyik szabadságfokot).

**Mini példa**

Egy kávézó azt állítja, hogy egy csésze kávéjuk átlagosan 25 g kávét tartalmaz. Egy vásárló 16 csészét megmér, mintaátlag 23.8 g, mintaszórás \\(S = 3\\) g. A populáció szórása nem ismert.

\\(H_0\colon \mu = 25\\), \\(H_1\colon \mu \neq 25\\)

$$T = \frac{23.8 - 25}{3 / \sqrt{16}} = \frac{-1.2}{0.75} = -1.6$$

Szabadságfok: \\(n-1 = 15\\). A kritikus érték kétoldali \\(\alpha=0.05\\)-nél, 15 szabadságfoknál kb. \\(\pm 2.131\\). Mivel \\(\lvert T \rvert = 1.6 < 2.131\\), **nem utasítjuk el** \\(H_0\\)-t — nincs elég bizonyíték arra, hogy a valódi átlag eltérne a 25 g-tól.

<div class="callout exam">
  <p><strong>Mire figyelj a felismerésnél</strong></p>
  <p>Ez a leggyakoribb egymintás teszt a gyakorlatban, mert a populáció szórását ritkán ismerjük előre. Ha a szöveg nem ad meg explicit \\(\sigma\\)-t, vagy kimondja hogy "ismeretlen a szórás" → t-teszt.</p>
</div>

### z-teszt / t-teszt (kétmintás)

**Mi a probléma, amit megold?**

Nem egy fix állított értékhez hasonlítasz egy mintaátlagot, hanem **két különböző csoport mintaátlagát egymáshoz**. Pl. két gyár termékének átlagos élettartamát hasonlítod össze.

**Az alaplogika**

Mindkét mintaátlag külön-külön ingadozik (mintánként mást kapnál). Amikor a kettő **különbségét** nézed, ez a két bizonytalanság **összeadódik** — a különbség jobban ingadozik, mint bármelyik mintaátlag önmagában.

**Feltételek**

- Mindkét minta normális eloszlásból származik (vagy elég nagy minta)
- A két minta egymástól független
- Ha mindkét populáció szórását ismered (\\(\sigma_1, \sigma_2\\)) → kétmintás z-teszt (ritka a gyakorlatban)
- Ha nem ismered, mintából becsülöd (\\(S_1, S_2\\)) → kétmintás t-teszt, és itt eldöntendő:
  - Egyenlőnek tekinthető-e a két csoport szórása (ezt F-teszttel ellenőrizheted) → "sima" kétmintás t-teszt
  - Ha nem egyenlő a szórás → Welch-teszt

**Kétmintás z-teszt — levezetés**

1. Két független minta: \\(\bar{X}_1 \sim \mathcal{N}(\mu_1, \sigma_1^2/n_1)\\), \\(\bar{X}_2 \sim \mathcal{N}(\mu_2, \sigma_2^2/n_2)\\)
2. Független normális változók lineáris kombinációja is normális, a varianciák összeadódnak:

$$\bar{X}_1 - \bar{X}_2 \sim \mathcal{N}\left(\mu_1 - \mu_2,\ \frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}\right)$$

3. \\(H_0\\) alatt (\\(\mu_1 = \mu_2\\)) standardizálva:

$$Z = \frac{\bar{X}_1 - \bar{X}_2}{\sqrt{\dfrac{\sigma_1^2}{n_1} + \dfrac{\sigma_2^2}{n_2}}} \sim \mathcal{N}(0,1)$$

**Kétmintás t-teszt (egyenlő szórás feltételezve) — képlet**

Mivel \\(\sigma_1, \sigma_2\\) nem ismert, közös ("pooled") szórásbecslést használunk mindkét csoportra:

$$S_p^2 = \frac{(n_1-1)S_1^2 + (n_2-1)S_2^2}{n_1+n_2-2}$$

$$T = \frac{\bar{X}_1 - \bar{X}_2}{S_p\sqrt{\dfrac{1}{n_1}+\dfrac{1}{n_2}}} \sim t(n_1+n_2-2)$$

**Welch-teszt — mikor és miért más**

Ha nem feltehető az egyenlő szórás, a két csoport szórását külön-külön kezeljük (nincs közös pooled becslés):

$$T = \frac{\bar{X}_1 - \bar{X}_2}{\sqrt{\dfrac{S_1^2}{n_1}+\dfrac{S_2^2}{n_2}}}$$

A szabadságfok bonyolultabb, törtszámú is lehet (a Tételsor szerint a pontos képletet nem kell tudni, csak hogy ez van).

**Mini példa**

Két gyár csavarjainak hosszát hasonlítjuk. A szórás nem ismert egyik gyárnál sem, de korábbi tapasztalatok alapján feltehető hogy a két gyár gyártási folyamata hasonlóan szórt (egyenlő szórás).

A gyár: \\(n_1=20\\), \\(\bar{X}_1=50.2\\) mm, \\(S_1=1.5\\) mm
B gyár: \\(n_2=20\\), \\(\bar{X}_2=49.5\\) mm, \\(S_2=1.4\\) mm

\\(H_0\colon \mu_1=\mu_2\\), \\(H_1\colon \mu_1\neq\mu_2\\)

$$S_p^2 = \frac{19(1.5^2)+19(1.4^2)}{38} = \frac{19(2.25)+19(1.96)}{38} = \frac{42.75+37.24}{38} \approx 2.105$$

$$S_p \approx 1.45$$

$$T = \frac{50.2-49.5}{1.45\sqrt{\frac{1}{20}+\frac{1}{20}}} = \frac{0.7}{1.45 \times 0.316} \approx \frac{0.7}{0.458} \approx 1.53$$

Szabadságfok: \\(n_1+n_2-2=38\\). Kritikus érték kétoldali \\(\alpha=0.05\\)-nél kb. \\(\pm 2.02\\). Mivel \\(\lvert T\rvert = 1.53 < 2.02\\), **nem utasítjuk el** \\(H_0\\)-t — nincs elég bizonyíték a két gyár átlagos csavarhossza közti különbségre.

<div class="callout exam">
  <p><strong>Mire figyelj a felismerésnél</strong></p>
  <ul>
    <li>2 független csoport, ismert mindkét \\(\sigma\\) → z-teszt (ritka)</li>
    <li>2 független csoport, ismeretlen \\(\sigma\\), feltehető egyenlő szórás → sima t-teszt</li>
    <li>2 független csoport, ismeretlen \\(\sigma\\), nem feltehető egyenlő szórás (vagy az F-teszt ezt mutatja) → Welch-teszt</li>
  </ul>
</div>

### páros t-teszt

**Mi a probléma, amit megold?**

Ugyanazokat az alanyokat méred meg **kétszer** (pl. előtte-utána egy kezelés előtt és után), és azt akarod tudni, hogy van-e szisztematikus változás.

**Az alaplogika**

Ahelyett hogy bonyolult kétmintás logikát használnál (ami két független csoportot tételez fel), egyszerűsíted a problémát: mivel ugyanazok az alanyok, kivonod a párokat egymásból (\\(D_i = X_i - Y_i\\)), és az így kapott **egyetlen különbség-oszlopon** csinálsz egymintás t-tesztet — azt nézed, hogy ennek a különbségnek az átlaga eltér-e nullától.

Ez azért előnyös, mert kiküszöböli az alanyok közötti egyéni eltéréseket (pl. ha valaki eleve magasabb vérnyomású volt, ez nem zavarja a "változás" mérését, mert mindig saját magához viszonyítjuk).

**Feltételek**

- Az alanyok párosítottak (ugyanazok mérve kétszer, vagy természetesen összetartozó párok)
- A párok különbségei (\\(D_i\\)) normális eloszlásból származnak (nem maguk az eredeti megfigyelések kell hogy normálisak legyenek, hanem a különbségeik)
- A populáció szórása a különbségekre nem ismert (a mintából becsüljük)

**Lépések / képlet**

1. Számold ki minden párra a különbséget: \\(D_i = X_i - Y_i\\)
2. Számold ki a különbségek átlagát (\\(\bar{D}\\)) és szórását (\\(S_D\\))
3. \\(H_0\colon \mu_D = 0\\) (nincs szisztematikus változás)

$$T = \frac{\bar{D} - 0}{S_D/\sqrt{n}} \sim t(n-1)$$

ahol \\(n\\) a párok száma.

**Mini példa**

8 betegnél megmérik a vérnyomást egy új gyógyszer bevétele előtt és után (Hgmm-ben):

| Beteg | Előtte | Utána | \\(D_i\\) |
|---|---|---|---|
| 1 | 140 | 132 | 8 |
| 2 | 150 | 145 | 5 |
| 3 | 138 | 130 | 8 |
| 4 | 145 | 140 | 5 |
| 5 | 160 | 150 | 10 |
| 6 | 135 | 133 | 2 |
| 7 | 142 | 138 | 4 |
| 8 | 148 | 142 | 6 |

\\(\bar{D} = (8+5+8+5+10+2+4+6)/8 = 48/8 = 6\\)

\\(S_D \approx 2.62\\) (a \\(D_i\\) értékek szórása)

\\(H_0\colon \mu_D = 0\\), \\(H_1\colon \mu_D \neq 0\\)

$$T = \frac{6 - 0}{2.62/\sqrt{8}} = \frac{6}{0.926} \approx 6.48$$

Szabadságfok: \\(n-1=7\\). Kritikus érték kétoldali \\(\alpha=0.05\\)-nél, 7 szabadságfoknál kb. \\(\pm 2.36\\). Mivel \\(\lvert T\rvert = 6.48 \gg 2.36\\), **elutasítjuk** \\(H_0\\)-t — a gyógyszer szignifikánsan csökkenti a vérnyomást.

<div class="callout exam">
  <p><strong>Mire figyelj a felismerésnél</strong></p>
  <p>A kulcsszó: <strong>ugyanazok az alanyok</strong>, kétszer mérve (vagy természetesen összetartozó párok, pl. ikerpárok). Ha két <strong>különböző</strong> csoportról van szó, az kétmintás teszt, nem páros.</p>
</div>

### ANOVA

**Mi a probléma, amit megold?**

Több (3 vagy több) független csoport átlagát szeretnéd összehasonlítani egyszerre — pl. 4 különböző gyár termékeinek átlagos élettartamát. Páronkénti t-tesztekkel ezt megtehetnéd, de minél több párt hasonlítasz, annál nagyobb az esély hogy véletlenül találsz "szignifikáns" különbséget (többszörös tesztelés problémája). Az ANOVA egyetlen teszttel dönti el, van-e egyáltalán különbség valahol a csoportok között.

**Az alaplogika**

A teljes adatban megfigyelt változékonyságot (mennyire térnek el az értékek az összátlagtól) két forrásra bontjuk:
- **csoportok közötti** változékonyság: mennyire térnek el a csoportátlagok az összátlagtól
- **csoporton belüli** változékonyság: mennyire szórnak az egyedi értékek a saját csoportátlaguk körül (ez a "véletlen zaj")

Ha a csoportok közötti eltérés **sokkal nagyobb**, mint amit a véletlen zaj önmagában indokolna, az arra utal, hogy valódi különbség van a csoportok között.

**Feltételek**

- Minden csoport normális eloszlásból származik
- A csoportok egymástól függetlenek
- A csoportok varianciája egyenlő (homoszcedaszticitás)

**Levezetés**

Legyen \\(k\\) a csoportok száma, \\(n\\) az összes megfigyelés száma, \\(\bar{X}\\) az összátlag, \\(\bar{X}_j\\) a \\(j\\)-edik csoport átlaga.

<div class="callout tip">
  <p><strong>Jelölések:</strong> SS = Sum of Squares (négyzetösszeg), MS = Mean Square (átlagos négyzetösszeg); a végső betű: <strong>T</strong>otal (összesen), <strong>B</strong>etween groups (csoportok között), <strong>W</strong>ithin groups (csoporton belül).</p>
</div>

A teljes négyzetösszeg felbontása:

$$\underbrace{SST}_{\text{összesen}} = \underbrace{SSB}_{\text{csoportok között}} + \underbrace{SSW}_{\text{csoporton belül}}$$

ahol

$$SST = \sum_{j=1}^{k}\sum_{i=1}^{n_j}(X_{ij}-\bar{X})^2$$

a teljes változékonyság,

$$SSB = \sum_{j=1}^{k} n_j(\bar{X}_j-\bar{X})^2$$

a csoportok közötti négyzetösszeg (mennyire térnek el a csoportátlagok az összátlagtól, súlyozva a csoportmérettel),

$$SSW = \sum_{j=1}^{k}\sum_{i=1}^{n_j}(X_{ij}-\bar{X}_j)^2$$

a csoporton belüli négyzetösszeg (mennyire szórnak az egyedi értékek a saját csoportátlaguk körül).

Mindkét négyzetösszeget elosztjuk a megfelelő szabadságfokával, hogy átlagos négyzetösszeget (varianciabecslést) kapjunk:

$$\underbrace{MSB}_{\text{csop. között}} = \frac{SSB}{k-1}, \qquad \underbrace{MSW}_{\text{csop. belül}} = \frac{SSW}{n-k}$$

A tesztstatisztika ezek hányadosa:

$$F = \frac{\underbrace{MSB}_{\text{csop. között}}}{\underbrace{MSW}_{\text{csop. belül}}} \sim F(k-1,\ n-k)$$

Ha \\(H_0\\) igaz (minden csoportátlag egyenlő), \\(MSB\\) és \\(MSW\\) hasonló nagyságúak, \\(F\approx 1\\). Ha a csoportok között valódi eltérés van, \\(MSB\\) nagy lesz \\(MSW\\)-hez képest, \\(F\\) nagy lesz.

**Hipotézisek**

\\(H_0\colon \mu_1=\mu_2=\ldots=\mu_k\\) (minden csoportátlag egyenlő)
\\(H_1\colon\\) legalább két csoportátlag különbözik

**Mini példa**

3 tanítási módszer hatását hasonlítjuk diákok vizsgaeredményén, csoportonként 5 diák (\\(n=15\\), \\(k=3\\)):

* A módszer: 70, 75, 72, 68, 74 → átlag 71.8

* B módszer: 80, 85, 82, 78, 84 → átlag 81.8

* C módszer: 65, 70, 68, 63, 69 → átlag 67

Összátlag: \\(\bar{X} = (71.8+81.8+67)/3 \approx 73.5\\)

$$SSB = 5(71.8-73.5)^2+5(81.8-73.5)^2+5(67-73.5)^2 \approx 5(2.89)+5(68.89)+5(42.25)\approx 569$$

Tegyük fel \\(SSW \approx 100\\) (csoporton belüli szórásokból számolva).

$$\underbrace{MSB}_{\text{csop. között}} = 569/(3-1) = 284.5, \qquad \underbrace{MSW}_{\text{csop. belül}} = 100/(15-3)=8.33$$

$$F = 284.5/8.33 \approx 34.2$$

Szabadságfok: (2, 12). Kritikus érték \\(\alpha=0.05\\)-nél kb. 3.89. Mivel \\(F=34.2 \gg 3.89\\), **elutasítjuk** \\(H_0\\)-t — legalább két módszer között szignifikáns különbség van az átlagos eredményben.

<div class="callout exam">
  <p><strong>Mire figyelj a felismerésnél</strong></p>
  <p>3 vagy több <strong>független</strong> csoport, numerikus, normális eloszlású változó, és a kérdés az, hogy "különböznek-e az átlagok valahol" — ekkor ANOVA. Ha a szignifikáns ANOVA után tudni akarod <strong>melyik</strong> csoportok különböznek pontosan, post-hoc tesztek kellenek (pl. páronkénti összehasonlítások korrekcióval).</p>
</div>

### Repeated-measures ANOVA

**Mi a probléma, amit megold?**

Ugyanaz mint az ANOVA-nál (3+ csoport/feltétel átlagát hasonlítod), de itt **ugyanazok az alanyok** vannak mérve mindegyik feltétel alatt (nem független csoportok), pl. ugyanazon betegek vérnyomását mérik 3 különböző kezelés alatt.

**Az alaplogika**

Az ANOVA logikáját kiterjeszti ismételt mérésekre: mivel ugyanazok az alanyok szerepelnek minden feltételnél, az alanyok közötti egyéni eltérések (pl. valaki eleve magasabb vérnyomású) nem véletlen zajként jelennek meg, hanem külön kezelhetők és kivonhatók a hibatagból. Ez megnöveli a teszt erejét (pontosabban ki tudja mutatni a valódi különbséget), mert kevesebb "zajt" kell a hibához számolni.

**Feltételek**

- Ugyanazok az alanyok minden feltétel/időpont alatt
- A mérések (megfelelő transzformáció után) normális eloszlásúak
- Szferitás feltétel: a feltételek közötti különbségek varianciája megközelítőleg egyenlő

**Hipotézisek**

\\(H_0\colon\\) minden feltétel/időpont átlaga egyenlő (nincs hatása az időnek/kezelésnek)
\\(H_1\colon\\) legalább két feltétel átlaga különbözik

**Felismerés**

3+ feltétel/időpont, **ugyanazok az alanyok** mérve mindegyiknél, numerikus, normális eloszlású változó → Repeated-measures ANOVA. Ez az ANOVA párja arra az esetre, amikor a páros t-tesztet kéne általánosítani 3+ csoportra.

### Wilcoxon signed-rank (egymintás)

**Mi a probléma, amit megold?**

Ugyanaz mint az egymintás t-tesztnél (egy mintát hasonlítasz egy állított mediánhoz), de itt **nem tehető fel a normalitás**, vagy a változó csak ordinális.

**Az alaplogika**

Mivel nem bízhatunk az átlagban (torzítható szélsőértékekkel, vagy nem is értelmezhető pontosan ordinális adatnál), a **rangokkal** dolgozunk. A mintaértékek és az állított medián közötti különbségeket vesszük, ezeket **abszolút értékben rangsoroljuk**, majd az eredeti előjeleket visszarakjuk a rangokra. Ha a pozitív és negatív rangok összege nagyon eltér egymástól, az szisztematikus eltérésre utal a feltételezett mediántól.

**Feltételek**

- A megfigyelések legalább ordinális skálán mérhetők
- A különbségek eloszlása szimmetrikus a medián körül (ez gyengébb feltétel mint a normalitás)

**Hipotézisek**

\\(H_0\colon\\) a populáció mediánja egyenlő az állított értékkel
\\(H_1\colon\\) a populáció mediánja eltér az állított értéktől

**Mini példa**

Egy cég azt állítja, hogy egy feladat elvégzésének medián ideje 10 perc. 6 dolgozónál mérik: 12, 9, 15, 8, 11, 14 perc.

Különbségek a 10-től: 2, −1, 5, −2, 1, 4

Abszolút értékek rangsorolva (legkisebb=1): |−1|=1→rang 1, |1|=1→rang 1 (átlagolt rang, mert egyenlő), |2|=2→rang 3, |−2|=2→rang 3, |4|=4→rang 5, |5|=5→rang 6

Pozitív rangok összege (a 2, 1, 5, 4 különbségekhez tartozó rangok): kb. 3+1+6+5=15
Negatív rangok összege (a −1, −2 különbségekhez tartozók): kb. 1+3=4

Ha a pozitív rangösszeg sokkal nagyobb mint a negatív, az arra utal, hogy az adatok inkább a 10 perc fölött vannak — tehát a valódi medián valószínűleg nagyobb mint 10 perc. A pontos p-érték táblázatból vagy szoftverrel számolható (kis mintánál egzakt eloszlásból, nagy mintánál az aszimptotikus normális közelítésből).

<div class="callout exam">
  <p><strong>Mire figyelj a felismerésnél</strong></p>
  <p>1 minta, ordinális vagy nem normális numerikus változó, egy konkrét mediánhoz hasonlítva → Wilcoxon signed-rank (egymintás). Ez a nemparaméteres párja az egymintás t-tesztnek.</p>
</div>

### Wilcoxon signed-rank (páros)

**Mi a probléma, amit megold?**

Ugyanaz mint a páros t-tesztnél (ugyanazokat az alanyokat méred kétszer, pl. előtte-utána), de itt **nem tehető fel a normalitás** a párok különbségeire.

**Az alaplogika**

A páros t-teszthez hasonlóan itt is a párok különbségeiből (\\(D_i = X_i - Y_i\\)) indulunk ki, de mivel nem bízhatunk a normalitásban, nem az átlagot nézzük, hanem **rangsoroljuk** a különbségek abszolút értékét, majd visszarakjuk az eredeti előjeleket. Ha a pozitív és negatív rangok összege nagyon eltér egymástól, az szisztematikus változásra utal.

Ez gyakorlatilag ugyanaz az eljárás, mint az egymintás Wilcoxon signed-rank, csak itt a "mintaérték" maga a párok közötti különbség (\\(D_i\\)), és az állított érték amihez hasonlítunk mindig 0 (nincs változás).

**Feltételek**

- Az alanyok párosítottak (ugyanazok mérve kétszer)
- A párok különbségei legalább ordinális skálán értelmezhetők
- A különbségek eloszlása szimmetrikus 0 körül

**Hipotézisek**

\\(H_0\colon\\) a párok különbségének mediánja 0 (nincs szisztematikus változás)
\\(H_1\colon\\) a párok különbségének mediánja eltér 0-tól

**Mini példa**

6 betegnél mérik a fájdalom-pontszámot (1-10 skála) egy kezelés előtt és után:

| Beteg | Előtte | Utána | \\(D_i\\) |
|---|---|---|---|
| 1 | 7 | 5 | 2 |
| 2 | 8 | 8 | 0 |
| 3 | 6 | 4 | 2 |
| 4 | 9 | 6 | 3 |
| 5 | 5 | 5 | 0 |
| 6 | 8 | 3 | 5 |

A 0 különbségű párokat (2. és 5. beteg) kihagyjuk a rangsorolásból, mert nincs irányuk. Maradék: 2, 2, 3, 5 (mind pozitív, vagyis mind csökkent a fájdalom).

Mivel minden megmaradt különbség pozitív irányú (csökkenés), a pozitív rangok összege maximális, a negatív rangok összege 0 — ez erős jele annak, hogy szisztematikus csökkenés történt.

<div class="callout exam">
  <p><strong>Mire figyelj a felismerésnél</strong></p>
  <p>Ugyanazok az alanyok, kétszer mérve, de ordinális vagy nem normális adat → Wilcoxon signed-rank (páros). Ez a nemparaméteres párja a páros t-tesztnek. Ha mindkét mérés bináris (pl. igen/nem), akkor nem ez kell, hanem a McNemar teszt.</p>
</div>

### Mann-Whitney (Wilcoxon rank-sum)

**Mi a probléma, amit megold?**

Ugyanaz mint a kétmintás t-tesztnél (két független csoportot hasonlítasz össze), de itt **nem tehető fel a normalitás**, vagy a változó csak ordinális.

**Az alaplogika**

Mivel nem bízhatunk az átlagban, az **összes** megfigyelést (mindkét csoportból együtt) közösen rangsoroljuk, majd megnézzük, hogy az egyik csoport értékei szisztematikusan magasabb vagy alacsonyabb rangot kapnak-e, mint a másiké. Ha a két csoport rangjai jól keverednek (nincs rendszeres különbség), az arra utal, hogy nincs valódi különbség az eloszlások között. Ha az egyik csoport rangjai szisztematikusan magasabbak, az arra utal, hogy az egyik csoport értékei jellemzően nagyobbak.

**Feltételek**

- A két csoport egymástól független
- A megfigyelések legalább ordinális skálán mérhetők
- A két eloszlás alakja hasonló (csak az elhelyezkedésük térhet el) — ekkor a teszt gyakorlatilag a mediánok különbségét vizsgálja

**Hipotézisek**

\\(H_0\colon\\) a két csoport eloszlása azonos (nincs szisztematikus különbség)
\\(H_1\colon\\) a két csoport eloszlása különbözik (az egyik csoport értékei szisztematikusan nagyobbak/kisebbek)

**Mini példa**

Két oktatási módszer hatását hasonlítjuk, 4-4 diák vizsgapontszámán:

A módszer: 65, 70, 72, 68
B módszer: 80, 85, 78, 90

Az összes 8 értéket közösen rangsoroljuk (legkisebb=1. rang):
65→1, 68→2, 70→3, 72→4, 78→5, 80→6, 85→7, 90→8

A módszer rangjai: 1, 3, 4, 2 → rangösszeg = 10
B módszer rangjai: 5, 6, 7, 8 → rangösszeg = 26

Ha nem lenne különbség a két módszer közt, a rangoknak nagyjából egyenletesen kéne keveredniük (mindkét csoport rangösszege kb. 18 körül lenne, mert az összes rang összege 36, két egyenlő csoportnál fejenként 18). Itt B csoport rangösszege (26) sokkal nagyobb az elvárt 18-nál, A csoporté (10) sokkal kisebb — ez arra utal, hogy B módszer szisztematikusan jobb eredményt hozott. A pontos p-érték a Mann-Whitney U statisztikából (vagy a rangösszegekből) számolható, kis mintánál egzakt eloszlással, nagy mintánál aszimptotikus normális közelítéssel.

<div class="callout exam">
  <p><strong>Mire figyelj a felismerésnél</strong></p>
  <p>2 független csoport, ordinális vagy nem normális numerikus változó → Mann-Whitney. Ez a nemparaméteres párja a kétmintás t-tesztnek. Ha ugyanazok az alanyok mindkét csoportban (páros adat), nem ez kell, hanem a Wilcoxon signed-rank (páros).</p>
</div>

### Kruskal-Wallis

**Mi a probléma, amit megold?** Ugyanaz mint az ANOVA-nál (3+ független csoport átlagát/eloszlását hasonlítod), de nem tehető fel a normalitás.

**Alaplogika** A Mann-Whitney általánosítása 3+ csoportra: minden megfigyelést (az összes csoportból együtt) közösen rangsorolunk, majd megnézzük, mennyire térnek el a csoportok átlagrangjai egymástól. Ha nagyon eltérnek, az szisztematikus különbségre utal.

**Feltételek** Független csoportok, legalább ordinális adat, hasonló alakú eloszlások csoportonként.

**Hipotézisek** \\(H_0\colon\\) minden csoport eloszlása azonos. \\(H_1\colon\\) legalább két csoport eloszlása különbözik.

**Mini példa** 3 diéta hatását hasonlítjuk testsúlycsökkenésen, csoportonként 3 fő. Az összes 9 értéket közösen rangsoroljuk 1-9-ig, majd csoportonként összeadjuk a rangokat. Ha az egyik csoport rangösszege sokkal nagyobb a többinél (pl. 21 a várt 15 helyett), az arra utal, hogy az a diéta szisztematikusan jobb eredményt hozott. A tesztstatisztika (H) ezekből a rangösszegekből számolódik, és nagy mintánál \\(\chi^2(k-1)\\) eloszlást közelít.

**Felismerés** 3+ független csoport, nem normális vagy ordinális adat → Kruskal-Wallis (ANOVA nemparaméteres párja).

---

### Friedman teszt

**Mi a probléma, amit megold?**

Ugyanaz mint a Repeated-measures ANOVA-nál (3+ feltétel/időpont, ugyanazok az alanyok mérve mindegyiknél), de itt **nem tehető fel a normalitás**, vagy a változó csak ordinális.

**Az alaplogika**

A Kruskal-Wallis ismételt mérésekre általánosított változata: minden alany adatait **alanyon belül** rangsoroljuk a feltételek között (nem az összes adatot együtt, mint Kruskal-Wallisnál), majd megnézzük, hogy az egyes feltételek rangösszegei mennyire térnek el egymástól. Ha egy feltétel szisztematikusan magasabb rangot kap minden alanynál, az arra utal, hogy az a feltétel valóban eltér a többitől.

**Feltételek**

- Ugyanazok az alanyok minden feltétel alatt
- A megfigyelések legalább ordinális skálán mérhetők

**Hipotézisek**

\\(H_0\colon\\) minden feltétel eloszlása azonos (a feltételek rangja véletlenszerűen oszlik el alanyonként)
\\(H_1\colon\\) legalább egy feltétel szisztematikusan eltér a többitől

**Felismerés**

3+ feltétel/időpont, ugyanazok az alanyok, ordinális vagy nem normális adat → Friedman teszt. Ez a Repeated-measures ANOVA nemparaméteres párja, ahogy Kruskal-Wallis az ANOVA párja.

### χ²-teszt

**Mi a probléma, amit megold?** Kategorikus adatoknál nézzük, hogy a megfigyelt gyakoriságok illeszkednek-e egy elvárt eloszláshoz (**illeszkedésvizsgálat**), vagy két kategorikus változó összefügg-e egymással (**függetlenségvizsgálat**).

**Alaplogika** Minden cellában összehasonlítjuk a megfigyelt és az elvárt (H0 szerinti) gyakoriságot: minél nagyobb az eltérés, annál nagyobb a teszt statisztika.

$$\chi^2 = \sum \frac{(O-E)^2}{E}$$

ahol \\(O\\) a megfigyelt, \\(E\\) az elvárt gyakoriság minden cellában.

**Feltételek** Kategorikus adat, elég nagy várt gyakoriságok minden cellában (általában elvárás: minden cellában \\(E\geq 5\\), egyébként Fisher exact teszt kell).

**Hipotézisek (függetlenségvizsgálat)** \\(H_0\colon\\) a két kategorikus változó független. \\(H_1\colon\\) összefüggnek.

**Mini példa** Nem (férfi/nő) és fizetési mód (kártya/utalás) kapcsolata, 200 vásárlónál. Egy 2×2-es kontingenciatáblát készítünk a megfigyelt gyakoriságokról, majd kiszámoljuk az elvárt gyakoriságokat (ha függetlenek lennének, a peremgyakoriságokból). Ha pl. a férfiaknál sokkal több kártyás fizetés van a vártnál, az nagy \\(\chi^2\\) értéket ad, ami azt jelzi: a két változó összefügg. A statisztika \\(\chi^2((r-1)(c-1))\\) eloszlást követ, ahol \\(r,c\\) a sorok/oszlopok száma.

**Felismerés** Két kategorikus változó kapcsolata → függetlenségvizsgálat. Egy kategorikus változó egy elméleti eloszláshoz hasonlítva → illeszkedésvizsgálat.

---

### Fisher exact teszt

**Mi a probléma, amit megold?** Ugyanaz mint a χ²-függetlenségvizsgálatnál (két kategorikus változó kapcsolata kontingenciatáblán), de **kis mintánál**, ahol a χ²-közelítés nem megbízható (kis várt gyakoriságok).

**Alaplogika** Nem közelítő eloszlást használ, hanem **pontosan** kiszámolja annak valószínűségét, hogy a megfigyeltnél legalább ennyire szélsőséges táblát kapnánk H0 (függetlenség) mellett, a hipergeometrikus eloszlás alapján.

**Feltételek** Kis minta, jellemzően 2×2-es kontingenciatábla, valamelyik várt gyakoriság 5 alatt van.

**Hipotézisek** \\(H_0\colon\\) a két kategorikus változó független. \\(H_1\colon\\) összefüggnek.

**Mini példa (Lady Tasting Tea)** Egy hölgy azt állítja, meg tudja különböztetni, hogy a teába előbb öntötték-e a tejet vagy a teát. 8 csészét kap (4-4 mindkét típusból), és neki kell eltalálnia melyik melyik. A Fisher exact teszt pontosan kiszámolja, mekkora az esélye, hogy véletlenül is ennyire jó (vagy jobb) találati arányt érne el, ha valójában nem tudja megkülönböztetni őket.

**Felismerés** Kis minta + kontingenciatábla + kategorikus változók kapcsolata → Fisher exact, nem χ².

---

### McNemar teszt

**Mi a probléma, amit megold?** Páros, **bináris** adatoknál (ugyanazok az alanyok, igen/nem válasz előtte és utána) nézi, hogy van-e szisztematikus elmozdulás.

**Alaplogika** Csak azokat a párokat veszi figyelembe, ahol **változott** a válasz (igen→nem vagy nem→igen) — azokat a párokat, ahol nem változott semmi, kihagyja, mert azok nem informatívak az elmozdulásra nézve. Ha a két irányú változás (igen→nem, illetve nem→igen) aránya nagyon eltér egymástól, az szisztematikus eltolódásra utal.

**Feltételek** Páros, bináris kimenetű adat (ugyanazok az alanyok kétszer mérve).

**Hipotézisek** \\(H_0\colon\\) a két irányú változás (igen→nem és nem→igen) valószínűsége egyenlő (nincs szisztematikus elmozdulás).

**Mini példa** 100 választó véleményét kérdezik egy jelöltről, kampány előtt és után (támogatja/nem támogatja). 15-en váltottak nem→igen irányba, 5-en igen→nem irányba (a többi nem változott). Mivel 15 és 5 nagyon eltér egymástól, ez arra utal, hogy a kampány szisztematikusan növelte a támogatottságot.

**Felismerés** Páros adat + bináris kimenet (igen/nem) → McNemar. Ha a kimenet nem bináris hanem numerikus/ordinális, akkor páros t-teszt vagy Wilcoxon signed-rank kell.

---

### Binomiális teszt

**Mi a probléma, amit megold?** Egyetlen mintán, **bináris** kimenetnél (siker/kudarc) azt nézi, hogy a megfigyelt sikerarány eltér-e egy konkrét, állított valószínűségtől.

**Alaplogika** Ha n független, bináris kísérletet végzel, és mindegyiknél p a siker valószínűsége, a sikerek száma binomiális eloszlást követ. A teszt kiszámolja, mekkora valószínűséggel kapnánk a megfigyeltnél legalább ennyire szélsőséges sikerszámot, ha a H0-ban állított p igaz lenne — pontosan, nem közelítő eloszlással.

**Feltételek** Egyetlen minta, bináris kimenet, konkrét állított arányhoz (\\(p_0\\)) hasonlítva.

**Hipotézisek** \\(H_0\colon p = p_0\\) (vagy \\(p \geq p_0\\) / \\(p \leq p_0\\) egyoldali esetben). \\(H_1\colon\\) ennek ellentéte.

**Mini példa** Egy cég azt állítja, az új tablettájuk legalább 70%-ban hatásos. 150 betegnél tesztelik, 95-nél volt hatásos (63.3%). \\(H_0\colon p\geq 0.70\\), \\(H_1\colon p<0.70\\). A binomiális teszt kiszámolja, mekkora valószínűséggel kapnánk 95-nél kevesebb (vagy annyi) sikert 150 próbálkozásból, ha valójában \\(p=0.70\\) lenne — ha ez a valószínűség kicsi (pl. \\(p<0.05\\)), elutasítjuk H0-t, és arra következtetünk, hogy a valódi hatásosság alacsonyabb a 70%-nál.

**Felismerés** 1 minta + bináris kimenet + konkrét állított arányhoz hasonlítva → binomiális teszt.


### Kolmogorov-Smirnov teszt

**Mi a probléma, amit megold?**

Azt nézi, hogy a minta **illeszkedik-e egy adott elméleti eloszlásra** (egymintás eset), vagy két minta **ugyanabból az eloszlásból származik-e** (kétmintás eset) — nem csak az átlagot vagy mediánt hasonlítja, hanem a **teljes eloszlás alakját**.

**Az alaplogika**

A minta **empirikus eloszlásfüggvényét** (lépcsős függvény, ami megmutatja hányad rész esik egy adott érték alá) hasonlítja az elméleti eloszlásfüggvényhez (vagy a másik minta empirikus eloszlásfüggvényéhez). A tesztstatisztika a két függvény közötti **legnagyobb függőleges távolság**:

$$D = \sup_x \lvert F_n(x) - F(x) \rvert$$

ahol \\(F_n\\) az empirikus, \\(F\\) az elméleti (vagy másik minta) eloszlásfüggvény. Ha ez a legnagyobb eltérés nagy, az arra utal, hogy a minta nem az adott eloszlásból származik.

**Feltételek**

- Folytonos eloszlású változó (nem kategorikus)
- Egymintás esetben: ismerni kell az elméleti eloszlás konkrét paramétereit is (nem becsülve a mintából)

**Hipotézisek**

\\(H_0\colon\\) a minta az adott elméleti eloszlásból származik (egymintás), vagy a két minta azonos eloszlásból származik (kétmintás)
\\(H_1\colon\\) ennek ellentéte

**Mini példa**

Egy gyár azt állítja, hogy egy alkatrész élettartama \\(N(500, 40^2)\\) eloszlású. 50 alkatrészt megmérünk, és felrajzoljuk az empirikus eloszlásfüggvényt, majd összevetjük az elméleti \\(N(500,40^2)\\) eloszlásfüggvénnyel. Ha a két görbe a legnagyobb eltérés pontján (\\(D\\)) túl messze kerül egymástól ahhoz a kritikus értékhez képest, amit a Kolmogorov-Smirnov táblázat ad az adott mintaméretre, elutasítjuk, hogy az élettartam ezt az eloszlást követi.

**Felismerés**

A kérdés "illeszkedik-e az adat egy eloszlásra" (vagy két minta eloszlása azonos-e) → Kolmogorov-Smirnov. Eltér a χ²-illeszkedésvizsgálattól abban, hogy folytonos eloszlásra alkalmazható (nem kategorizált adatra), és nem csak néhány kategóriát hasonlít, hanem a teljes eloszlásgörbét.

---

### Regresszió és R²

**Mi a probléma, amit megold?**

Azt modellezi, hogyan függ egy numerikus változó (\\(Y\\)) egy vagy több másik numerikus változótól (\\(X\\)). Pl. hogyan függ a fizetés a munkatapasztalattól.

**A modell**

$$Y_i = \beta_0 + \beta_1 x_i + \varepsilon_i$$

ahol \\(\beta_0\\) a tengelymetszet, \\(\beta_1\\) a meredekség (mennyit változik \\(Y\\) átlagosan, ha \\(x\\) eggyel nő), \\(\varepsilon_i\\) a hibatag.

**Feltételek a hibatagra (Gauss-Markov)**

- Várható értéke 0
- Állandó varianciája van (homoszcedaszticitás)
- A hibatagok egymástól függetlenek
- (Normalitás csak a szignifikanciatesztekhez kell, magához a becsléshez nem)

**Gauss-Markov tétel**

Ha a fenti feltételek teljesülnek, a legkisebb négyzetek módszerével becsült paraméterek **torzítatlanok**, és az összes lineáris torzítatlan becslés közül **minimális varianciájúak** (BLUE: best linear unbiased estimator).

**Legkisebb négyzetek becslés (egy magyarázó változó esetén)**

A becslés azt a \\(\hat\beta_0, \hat\beta_1\\) párt keresi, ami minimalizálja a megfigyelt és becsült értékek közötti eltérések négyzetösszegét:

$$\hat\beta_1 = \frac{\sum (x_i-\bar{x})(y_i-\bar{y})}{\sum (x_i-\bar{x})^2}, \qquad \hat\beta_0 = \bar{y} - \hat\beta_1 \bar{x}$$

**R² levezetése**

A teljes változékonyságot (SST) két részre bontjuk, ugyanúgy mint ANOVA-nál:

$$SST = SSR + SSE$$

ahol \\(SSR\\) a modell által megmagyarázott rész, \\(SSE\\) a meg nem magyarázott (hiba) rész.

$$R^2 = \frac{SSR}{SST} = 1-\frac{SSE}{SST}$$

\\(R^2\\) megmutatja, \\(Y\\) változékonyságának hányad részét magyarázza meg a modell (0 = semennyit, 1 = mindent). Több magyarázó változónál a korrigált \\(R^2\\) (adjusted \\(R^2\\)) azért hasznos, mert az \\(R^2\\) önmagában mindig nő, ha újabb változót adsz a modellhez (még ha az lényegtelen is) — a korrigált változat bünteti a felesleges változók hozzáadását.

**Mini példa**

10 dolgozó fizetését (\\(Y\\), ezer Ft) és munkatapasztalatát (\\(X\\), év) vizsgáljuk. A becsült modell: \\(\hat{Y} = 250 + 15x\\). Ez azt jelenti, minden plusz év tapasztalat átlagosan 15 ezer Ft-tal növeli a fizetést. Ha \\(R^2=0.72\\), az azt jelenti, a tapasztalat a fizetés varianciájának 72%-át magyarázza meg, a maradék 28% más, a modellben nem szereplő tényezőknek (pl. képzettség, iparág) tudható be.

**Felismerés**

Két (vagy több) numerikus változó közötti kapcsolat/hatás kérdése → regresszió.

---

### Idősor-diagnosztikák (Ljung-Box, Dickey-Fuller)

**Mi a probléma, amit megoldanak?**

Idősoroknál (időben rendezett megfigyeléseknél) speciális problémák merülnek fel: a megfigyelések nem függetlenek egymástól (a mai érték összefügg a tegnapival), és lehet trend vagy szezonalitás. Ezekre külön diagnosztikai tesztek vannak.

**A Tételsor szerint ezeknél elég tudni, mire valók — mélyebb logika vagy levezetés nem szükséges.**

**Ljung-Box teszt**

Azt vizsgálja, hogy a reziduumok (egy illesztett modell hibái) tartalmaznak-e még **autokorrelációt** — vagyis van-e még kihasználatlan időbeli mintázat bennük, amit a modell nem ragadott meg.

\\(H_0\colon\\) a reziduumok nem korrelálnak egymással (a modell jól megragadta az időbeli függőséget)
\\(H_1\colon\\) van még autokorreláció a reziduumokban (a modell hiányos)

**Dickey-Fuller teszt**

Azt vizsgálja, hogy egy idősor **stacionárius-e**, vagy van benne **egységgyök** (unit root) — vagyis sztochasztikus trendje van-e (random walk jellegű viselkedés).

\\(H_0\colon\\) az idősornak van egységgyöke (nem stacionárius, sztochasztikus trend van benne)
\\(H_1\colon\\) az idősor stacionárius

**Mini példa**

Egy napi árfolyam-idősorra ARIMA modellt illesztünk. A Ljung-Box teszttel ellenőrizzük, hogy a modell reziduumaiban maradt-e még mintázat (ha igen, a modell javítható). A Dickey-Fuller teszttel pedig azt nézzük meg illesztés előtt, hogy szükség van-e differenciálásra (az eredeti árfolyam-sor valószínűleg nem stacionárius, mert van benne trend, ezért a Dickey-Fuller teszt nem utasítja el a "van egységgyök" nullhipotézist).

**Felismerés**

"Van-e még mintázat a reziduumokban" → Ljung-Box. "Stacionárius-e az idősor / van-e benne trend" → Dickey-Fuller.

## 9. Mit hasonlítunk: átlag, medián vagy arány?

A teszt családja szabja meg mit kell írnod H0/H1-ben és az értelmezésben.

| Teszt családja | Mit hasonlítunk | Kulcsszó a válaszban |
|---|---|---|
| t, z, F, ANOVA, Welch | várható érték (μ) | "átlag", "várható érték" |
| Wilcoxon, Mann-Whitney, Kruskal-Wallis, Friedman, sign test | medián / eloszlás elhelyezkedése | "medián", "eloszlás" |
| χ² (illeszkedésvizsgálat), Fisher exact, McNemar, binomiális teszt | arány / gyakoriság | "arány", "gyakoriság" |
| χ² (függetlenségvizsgálat) | két kategorikus változó kapcsolata | "függetlenség", "összefüggés" |

- Paraméteres tesztek a normális eloszlás paraméterét (μ) becsülik, ezért itt mindig átlagról/várható értékről beszélünk
- Nemparaméteres tesztek nem teszik fel a normalitást, ezért nem az átlagot hasonlítják (ami torzítható szélsőértékekkel), hanem a mediánt vagy az eloszlás elhelyezkedését
- Kategorikus teszteknél (egy változó esetén) nincs számszerű érték aminek átlagát vagy mediánját vennéd, csak arányokat/gyakoriságokat hasonlítasz
- Két kategorikus változó kapcsolatánál (χ²-függetlenségvizsgálat) nem arányt hasonlítunk egy konkrét értékhez, hanem azt teszteljük, hogy a két változó eloszlása összefügg-e egymással — itt a kulcsszó a "függetlenség"

### χ²-függetlenségvizsgálat vs χ²-illeszkedésvizsgálat
- **Illeszkedésvizsgálat**: egyetlen kategorikus változó megfigyelt gyakoriságait hasonlítja egy elméleti (elvárt) eloszláshoz. H0: az adatok az állított eloszlásból származnak.
- **Függetlenségvizsgálat**: két kategorikus változó kapcsolatát vizsgálja egy kontingenciatáblán. H0: a két változó független egymástól.
- Mindkettő ugyanazt a képletet használja: Σ(megfigyelt−várt)²/várt, csak a "várt" érték számítási módja más (illeszkedésnél az elméleti eloszlásból, függetlenségnél a peremgyakoriságokból számolva).

<!-- TODO: hiányzik még az 1. témakör (Glivenko-Cantelli tétel, empirikus eloszlásfüggvény) és a 2. témakör (MLE, momentum módszer, torzítatlanság/konzisztencia tételei, konfidenciaintervallumok) - ezekhez külön fejezetet kell nyitni, nem hipotézistesztek -->