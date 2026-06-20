---
title: Felismerési puska
layout: default
---

# Felismerési puska – Matstat teszt választás

## 1. Hány csoport / minta?
- 1 minta → egymintás teszt
- 2 független csoport → kétmintás teszt
- 2 csoport, ugyanazok az alanyok (előtte-utána) → páros teszt
- 3+ független csoport → ANOVA vagy Kruskal-Wallis
- 3+ csoport, ismételt mérés ugyanazon alanyokon → Repeated-measures ANOVA vagy Friedman

## 2. Ismert-e a szórás / normális-e az eloszlás?
- Ismert szórás → z-teszt
- Ismeretlen szórás, normális vagy nagy minta → t-teszt
- Nem tudjuk hogy normális, vagy kicsi a minta és nem normális → nemparaméteres alternatíva

## 3. Változó típusa

**Paraméteres** (numerikus, normális vagy nagy minta)
Példák: testmagasság (cm), vérnyomás, hőmérséklet, reakcióidő (ezredmásodperc), jövedelem nagy mintán

**Nemparaméteres** (ordinális VAGY numerikus de nem normális)
- Ordinális példák: elégedettségi pontszám 1-5, fájdalom skála 1-10, iskolai végzettség szintje
- Nem normális numerikus példák: jövedelem kis mintán (ferde eloszlás), várakozási idő, korlátos skála sok szélsőértékkel

**Kategorikus** (gyakoriság alapú, nincs sorrend)
Példák: nem (férfi/nő), vércsoport, párt amire szavazott, igen/nem válasz, beteg/egészséges státusz
Itt nem átlagot hasonlítunk, hanem gyakoriságokat/arányokat

## 4. Mit kérdez a feladat?
- Eltér-e az átlag/medián egy adott értéktől → egymintás teszt
- Különböznek-e a csoportok átlagai/eloszlásai → kétmintás vagy többmintás teszt
- Függ-e két kategorikus változó egymástól → χ²-függetlenségvizsgálat
- Illeszkedik-e az adat egy eloszlásra → Kolmogorov-Smirnov vagy χ²-illeszkedésvizsgálat
- Van-e kapcsolat/hatás két numerikus változó között → regresszió
- Van-e trend/szezonalitás → idősor diagnosztika (Dickey-Fuller, Ljung-Box)
- Kicsi a minta, extrém pontos eredmény kell → egzakt teszt (Fisher exact, Lady Tasting Tea)

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

## 7. Hipotézisfelírás szabálya
- H0 mindig egyenlőséget tartalmaz, ez a "nincs különbség / nincs hatás" állapot
- H1 az amit ki akarunk mutatni, ez tartalmazza a "van különbség / van hatás" állítást
- Kétoldali, ha a szöveg csak annyit kérdez: különbözik-e, eltér-e
- Egyoldali, ha a szöveg irányt mond: nagyobb-e, csökkenti-e, javít-e, legalább annyi-e
- H0-ba mindig az kerül, amit a kutató meg akar cáfolni, nem a saját állítása

## 8. Tesztstatisztika logikája (mit csinál a teszt valójában)

**t-teszt (egymintás)**
A mintaátlag és a feltételezett érték különbségét osztjuk a becsült standard hibával. Ha a különbség sok standard hibányira van nullától, elutasítjuk H0-t.

**t-teszt (kétmintás) / Welch-teszt**
A két csoportátlag különbségét osztjuk a különbség becsült standard hibájával. Welchnél a standard hiba számítása nem tételezi fel az egyenlő varianciát, ezért a szabadságfok is más (törtszámú lehet).

**Páros t-teszt**
A párok különbségeiből (Di = Xi - Yi) egymintás t-tesztet csinálunk a különbségek várható értékére (H0: a különbségek átlaga 0).

**F-teszt**
Két variancia hányadosát nézi (nagyobb/kisebb variancia). Ha a hányados messze van 1-től, a varianciák különböznek.

**ANOVA**
A csoportok közötti szórást (mennyire térnek el a csoportátlagok az összátlagtól) hasonlítja a csoportokon belüli szóráshoz. Ha a csoportok közötti eltérés sokkal nagyobb mint a véletlen ingadozás, elutasítjuk H0-t. Az F-statisztika ennek a két szórásnak a hányadosa.

**Mann-Whitney / Wilcoxon rank-sum**
Az összes megfigyelést (mindkét csoportból) közösen rangsoroljuk, majd az egyik csoport rangösszegét nézzük. Ha az egyik csoport értékei szisztematikusan magasabb rangot kapnak, az a csoportok közötti különbségre utal.

**Wilcoxon signed-rank (páros)**
A párok különbségeit vesszük, előjel nélkül rangsoroljuk, majd az előjeleket visszarakjuk a rangokra. Ha a pozitív és negatív rangok összege nagyon eltér egymástól, az szisztematikus különbségre utal.

**Kruskal-Wallis**
A Mann-Whitney általánosítása 3+ csoportra: minden megfigyelést közösen rangsorolunk, majd megnézzük, hogy a csoportok átlagrangja mennyire tér el egymástól.

**χ²-teszt**
A megfigyelt gyakoriságokat hasonlítja az elvárt (H0 szerinti) gyakoriságokhoz: (megfigyelt-várt)²/várt összegzése minden cellára. Nagy eltérés nagy χ²-értéket ad.

**Fisher exact teszt**
Kis mintánál, kontingenciatáblán a pontos valószínűségét számolja ki annak, hogy a megfigyeltnél legalább ennyire szélsőséges elrendezést kapnánk H0 mellett (hipergeometrikus eloszlás alapján), nem közelítő eloszlást használ.

**Kolmogorov-Smirnov**
A minta empirikus eloszlásfüggvénye és az elméleti (vagy másik minta) eloszlásfüggvénye közötti legnagyobb függőleges távolságot nézi.