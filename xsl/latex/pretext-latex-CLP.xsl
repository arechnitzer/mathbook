<?xml version='1.0'?>

<!--********************************************************************
Copyright 2018 Andrew Rechnitzer

This file is part of PreTeXt.

PreTeXt is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 or version 3 of the
License (at your option).

PreTeXt is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with PreTeXt.  If not, see <http://www.gnu.org/licenses/>.
*********************************************************************-->

<!-- Conveniences for classes of similar elements -->
<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "../entities.ent">
    %entities;
]>

<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
>

<!-- Override specific tenplates of the standard conversion -->
<xsl:import href="../mathbook-latex.xsl" />

<!-- Intend output for rendering by pdflatex -->
<xsl:output method="text" />


<!--  ADR added some colours here -->
<xsl:template name="style-colour-definitions">
  <xsl:text>
    \definecolor{DeepSkyBlue}{HTML}{007090}
    \definecolor{DeepGreen}{HTML}{006070}
  </xsl:text>
</xsl:template>



<!-- "objectives", "outcomes" -->
<!-- Default tcb, identically -->
<xsl:template match="objectives|outcomes" mode="tcb-style">
    <xsl:text/>
</xsl:template>

<!-- EXAMPLE-LIKE: "example", "question", "problem" -->
<!-- Default tcolorbox, but with tricolor titles    -->
<!-- Each just slightly different                   -->

<!-- Example styling from CLP -->
<xsl:template match="example" mode="tcb-style">
    <xsl:text>
      colback=white, colframe=black, colbacktitle=white, coltitle=black,
      oversize, enhanced, breakable,
      attach boxed title to top left={xshift=7mm, yshift*=-\tcboxedtitleheight/2},
      frame hidden,
      overlay unbroken={
        \draw[thick, stealth-, rounded corners] ([yshift=-3ex]interior.north west)--(interior.north west)--(title);
        \draw[thick, -stealth, rounded corners] (title)--(interior.north east)--([yshift=-3ex]interior.north east);
        \draw[thick, stealth-stealth, rounded corners] ([yshift=3ex]interior.south west)--(interior.south west)--(interior.south east)--([yshift=3ex]interior.south east);
      },
      overlay first={
        \draw[thick, stealth-, rounded corners] ([yshift=-3ex]interior.north west)--(interior.north west)--(title);
        \draw[thick, -stealth, rounded corners] (title)--(interior.north east)--([yshift=-3ex]interior.north east);
        },
      overlay middle={},
      overlay last={
        \node[draw, thick, rectangle, rounded corners] (repeatTitle) at ([xshift=-12ex]interior.south east) {Example~\thetcbcounter};
        \draw[thick, stealth-, rounded corners] ([yshift=3ex]interior.south west)--(interior.south west)--(repeatTitle);
        \draw[thick,-stealth,rounded corners] (repeatTitle)--(interior.south east)--([yshift=3ex]interior.south east);
        },
    </xsl:text>
</xsl:template>

<xsl:template match="question" mode="tcb-style">
    <xsl:text>
      colback=white, colframe=blue, colbacktitle=white, coltitle=black,
      oversize, enhanced, breakable,
      attach boxed title to top left={xshift=7mm, yshift*=-\tcboxedtitleheight/2},
      frame hidden,
      overlay unbroken={
        \draw[blue, thick, open square-, rounded corners] ([yshift=-3ex]interior.north west)--(interior.north west)--(title);
        \draw[blue,thick, -open square, rounded corners] (title)--(interior.north east)--([yshift=-3ex]interior.north east);
        \draw[blue,thick, open square-open square, rounded corners] ([yshift=3ex]interior.south west)--(interior.south west)--(interior.south east)--([yshift=3ex]interior.south east);
      },
      overlay first={
        \draw[blue,thick, open square-, rounded corners] ([yshift=-3ex]interior.north west)--(interior.north west)--(title);
        \draw[blue,thick, -open square, rounded corners] (title)--(interior.north east)--([yshift=-3ex]interior.north east);
          },
      overlay middle={},
      overlay last={
        \node[draw, blue, thick, rectangle, rounded corners, text=black] (repeatTitle) at ([xshift=-12ex]interior.south east) {Question~\thetcbcounter};
        \draw[blue, thick, open square-, rounded corners] ([yshift=3ex]interior.south west)--(interior.south west)--(repeatTitle);
        \draw[blue, thick, -open square,rounded corners] (repeatTitle)--(interior.south east)--([yshift=3ex]interior.south east);
      },
    </xsl:text>
</xsl:template>

<xsl:template match="problem" mode="tcb-style">
    <xsl:text>
      colback=white, colframe=red, colbacktitle=white, coltitle=black,
      oversize, enhanced, breakable,
      attach boxed title to top left={xshift=7mm, yshift*=-\tcboxedtitleheight/2},
      frame hidden,
      overlay unbroken={
        \draw[red, thick, right to-, rounded corners] ([yshift=-3ex]interior.north west)--(interior.north west)--(title);
        \draw[red,thick, -left to, rounded corners] (title)--(interior.north east)--([yshift=-3ex]interior.north east);
        \draw[red,thick, left to-right to, rounded corners] ([yshift=3ex]interior.south west)--(interior.south west)--(interior.south east)--([yshift=3ex]interior.south east);
      },
      overlay first={
        \draw[red,thick, right to-, rounded corners] ([yshift=-3ex]interior.north west)--(interior.north west)--(title);
        \draw[red,thick, -left to, rounded corners] (title)--(interior.north east)--([yshift=-3ex]interior.north east);
      },
      overlay middle={},
      overlay last={
        \node[draw, thick, red, rectangle, rounded corners, text=black] (repeatTitle) at ([xshift=-12ex]interior.south east) {Problem~\thetcbcounter};
        \draw[red, thick, left to-, rounded corners] ([yshift=3ex]interior.south west)--(interior.south west)--(repeatTitle);
        \draw[red, thick, -right to,rounded corners] (repeatTitle)--(interior.south east)--([yshift=3ex]interior.south east);
      },
    </xsl:text>
</xsl:template>

<!-- DEFINITION-LIKE: "definition"   -->
<!-- Various extreme choices from the tcolorbox documentation -->
<!-- Note: a trailing comma is OK, and maybe a good idea      -->
<!-- Note: the style definition may split across several line -->
<!-- of the LaTeX source using the hex A (dec 10) character   -->
<!-- Note: "enhanced" is necessary for boxed titles           -->
<xsl:template match="&DEFINITION-LIKE;" mode="tcb-style">
  <xsl:text>
    colframe=DeepGreen, colback=DeepGreen!5, colbacktitle=DeepGreen!70, coltitle=black,
    sharp corners=northwest, arc=5pt,
    breakable, enhanced,
    attach boxed title to top left={xshift=4mm, yshift*=-\tcboxedtitleheight/2},
  </xsl:text>
</xsl:template>

<!-- REMARK-LIKE: "remark", "convention", "note",   -->
<!--            "observation", "warning", "insight" -->
<!-- COMPUTATION-LIKE: "computation", "technology"  -->
 <!--White title text, but title backgounds vary    -->
 <!--by category, and remarks have sharp corners    -->
<xsl:template match="&REMARK-LIKE;" mode="tcb-style">
    <xsl:text>
      colframe=white, colback=white, coltitle=black, frame hidden,
      oversize, breakable, enhanced,
      detach title, before upper={\tcbtitle\quad},
      fonttitle=\bfseries,
    </xsl:text>
</xsl:template>

<xsl:template match="warning" mode="tcb-style">
    <xsl:text>
      theoremstyle,
      colback=white, colbacktitle=white, colframe=red,
      boxed title style={rounded corners, colframe=red}
    </xsl:text>
</xsl:template>


<xsl:template match="&COMPUTATION-LIKE;" mode="tcb-style">
    <xsl:text>colbacktitle=blue</xsl:text>
</xsl:template>


<!-- THEOREM-LIKE: "theorem", "corollary", "lemma",    -->
<!--               "algorithm", "proposition",         -->
<!--               "claim", "fact", "identity"         -->
<!-- AXIOM-LIKE: "axiom", "conjecture", "principle",   -->
<!--             "heuristic", "hypothesis",            -->
<!--             "assumption                           -->
<!-- A "skin" example from the tcolorbox documentation -->
<!-- Documentation suggests "title engine=path"        -->
<!-- is necessary, but it seems to not be              -->
<xsl:template match="&THEOREM-LIKE;|&AXIOM-LIKE;" mode="tcb-style">
  <xsl:text>
    colframe=DeepSkyBlue, colback=DeepSkyBlue!5, colbacktitle=orange!15, coltitle=black,
    sharp corners=northwest, arc=5pt,
    breakable, enhanced,
    attach boxed title to top left={xshift=4mm, yshift*=-\tcboxedtitleheight/2},
    boxed title style={sharp corners, colframe=orange},
    fontupper=\normalfont
  </xsl:text>
</xsl:template>

<xsl:template match="lemma" mode="tcb-style">
    <xsl:text>
      theoremstyle,
      colback=white, colbacktitle=white,
      boxed title style={rounded corners, colframe=black}
    </xsl:text>
</xsl:template>

<xsl:template match="fact" mode="tcb-style">
    <xsl:text>
      theoremstyle,
      attach boxed title to top right={xshift=-4mm, yshift*=-\tcboxedtitleheight/2},
      title={Equation~(\thetcbcounter)\ifx\empty#1\else~#1\fi},
    </xsl:text>
</xsl:template>

<xsl:template match="claim" mode="tcb-style">
    <xsl:text>
      theoremstyle,
      colback=white, colbacktitle=white, colframe=red,
      boxed title style={rounded corners, colframe=red}
    </xsl:text>
</xsl:template>


<!-- ASIDE-LIKE: "aside", "historical", "biographical" -->
<xsl:template match="&ASIDE-LIKE;" mode="tcb-style">
    <xsl:text>
      colframe=gray, colback=white, colbacktitle=white, coltitle=black,
      boxrule=0.5pt,
      sharp corners=northwest, arc=5pt,
      enhanced, breakable,
      attach boxed title to top left={xshift=4mm, yshift*=-\tcboxedtitleheight/2},
      boxed title style={rounded corners, colframe=gray, boxrule=0.5pt}
    </xsl:text>
</xsl:template>


</xsl:stylesheet>
