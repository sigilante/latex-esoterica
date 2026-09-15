# latex-esoterica

Esoteric symbols for LaTeX: glyphs from Freemasonry, the Golden Dawn, Druidry
and related traditions.

> **Status: draft (v0.1.0).** The commands and options may still change, and
> many glyphs are first-pass designs that need refinement; the proof sheets in
> the manual show where things stand. The package is not yet on CTAN.

Unlike [`alchemist`](https://ctan.org/pkg/alchemist), which maps names onto
characters in existing Unicode fonts, `esoterica` draws its own glyphs with
TikZ. Most of these symbols have no Unicode codepoint. The glyphs work with
pdfLaTeX, XeLaTeX and LuaLaTeX, scale with the text and follow its colour.

```latex
\usepackage{esoterica}
...
The \MasonicSquareAndCompasses{} and the \eso{goldendawn/Pentagram}.
\GoldenDawnHexagram[scale=2, color=blue]
\esotericascript{royalarch}{Holiness to the Lord}   % Royal Arch cipher
\esotericascript[direction=rtl]{enochian}{Madriax}  % Enochian
```

The full manual, with glyph tables, is `doc/esoterica.tex`.

## Layout

```
tex/esoterica.sty            core: registry, drivers, user commands
tex/esoterica-<name>.def     one module per tradition (glyph definitions)
doc/esoterica.tex            manual, glyph tables and proof sheets
testfiles/*.lvt, *.tlg       l3build regression tests
build.lua                    l3build configuration
```

## Development

Everything goes through [l3build](https://ctan.org/pkg/l3build):

```sh
l3build check          # run regression tests on pdfTeX, XeTeX and LuaTeX
l3build save <test>    # accept new output for testfiles/<test>.lvt
l3build doc            # typeset the manual to doc/esoterica.pdf
l3build install        # install into TEXMFHOME for use in other documents
l3build ctan           # build a CTAN upload
```

To try the package without installing it, point TeX at the sources:

```sh
TEXINPUTS=$PWD/tex//: pdflatex mydoc.tex
```

## Adding a glyph

1. Pick a tradition module in `tex/` (or add `esoterica-<name>.def` and list
   it in `\c__esoterica_modules_clist` in `esoterica.sty`).
2. Declare the glyph on the unit grid, where x runs from 0 to `width` and y
   from 0 to 1:

   ```latex
   \DeclareEsotericGlyph{masonic}{Plumb}{
     description = {The plumb (Junior Warden)},
     width = 0.6,
     draw = {
       \draw (0.3,0.94) -- (0.3,0.3);
       \fill (0.3,0.22) circle[radius=0.07];
     },
   }
   ```

3. Proof it with `\esotericaproof{masonic/Plumb}` or
   `\esotericaproofsheet{masonic}`, which draw the grid, the box and the
   baseline next to a specimen at text size.

The manual covers the design conventions (stroke usage, edge clearance, shared
geometry).

## License

MIT; see [LICENSE](LICENSE).
