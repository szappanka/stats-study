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



# Témák

<iframe
  src="{{ '/assets/pdf/Topic list 26S.pdf' | relative_url }}"
  width="100%"
  height="860px"
  style="border: 1px solid var(--border); border-radius: 8px;">
</iframe>


