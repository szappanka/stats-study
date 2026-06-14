# Matematikai Statisztika – Tanulási segédlet

Jekyll-alapú statikus oldal, amely a matematikai statisztika tananyagát dolgozza fel. Az oldalak Markdown fájlokban készülnek, néhány egyedi HTML-konvencióval.

## Tartalomtípus-blokkok

A három tananyag-kategória vizuálisan megkülönböztetett blokkban jelenik meg.

**Fogalom** (kék csík):
```html
<div class="concept" markdown="1">
**Valami:** definíció szövege, LaTeX is mehet: \\(X \sim N(\mu, \sigma^2)\\).
</div>
```

**Tétel** (zöld csík):
```html
<div class="tetel" markdown="1">
**Tétel neve:** állítás szövege és a bizonyítás vázlata.

$$\sqrt{n}\,D_n \xrightarrow{d} K$$
</div>
```

**Eljárás** (narancspiros csík):
```html
<div class="eljaras" markdown="1">
**Lépések:** leírás, képletekkel együtt.
</div>
```

## Callout dobozok

Pedagógiai megjegyzések kiemelésére:

```html
<div class="callout tip" markdown="1">
**Tipp:** magyarázat, analógia, emlékeztető.
</div>

<div class="callout trap" markdown="1">
**Figyelem:** gyakori hiba vagy félreértés.
</div>

<div class="callout exam" markdown="1">
**Vizsgán:** amit különösen tudni kell.
</div>
```

## Inline kiemelések

Új fogalom első bevezetésekor:
```html
<mark>fogalom neve</mark>: definíció szövege...
```

## LaTeX

| | Szintaxis | Megjegyzés |
|---|---|---|
| Inline | `\\(képlet\\)` | ajánlott |
| Inline | `$képlet$` | működik, de kerülendő ha `$` dollárjelként is előfordul a szövegben |
| Kiemelt | `$$képlet$$` | |

A MathJax mindkét inline szintaxist ismeri, a fájlokban mégis `\\(...\\)` az egyezmény, mert kramdown néha félreértelmezi a `$` jeleket.

A `markdown="1"` attribútum szükséges ahhoz, hogy a HTML blokkon belül a LaTeX és a Markdown is renderelődjön.

## Fájlstruktúra

```
docs/
  01-alapfogalmak.md
  02-becslestelmelet.md
  03-parameteres-tesztek.md
  04-nemparameteres-tesztek.md
  05-tobbmintas-egzakt-tesztek.md
  06-linearis-regresszio.md
  07-idosorok.md
  08-statisztikai-csapdak.md
assets/css/style.css   ← stílusok
_layouts/              ← Jekyll sablonok
```
