\version "2.16.0"

\header {
  tagline = ""
  composer = ""
}

MetriqueArmure = {
  \tempo 2=60
  \key f \major
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative c' {\cadenzaOn
  f2 a g a bes a( g2.) f4 f2\fermata \bar "'"
  a2 a g a c b2. c4 c1\fermata \bar "|"
  c2 d c4.( bes8) a2 bes c( bes2.) a4 g2\fermata \bar "'"
  a2 f g a bes a( g2.) f4 f1\fermata \bar ":|"
  \times 2/3 {f2( g f)} e2( f1)\fermata \bar "|."
}

ParolesA = \lyricmode {
  \set stanza = "1."
  O sa -- lu -- tá -- ris Hó -- sti -- a,
  Quæ cæ -- li pan -- dis ó -- sti -- um,
  Bel -- la pre -- munt ho -- stí -- li -- a,
  Da ro -- bur, fer au -- xí -- li -- um.
}

ParolesB = \lyricmode {
  \set stanza = "2."
  U -- ni tri -- nó -- que Dó -- mi -- no
  Sit sem -- pi -- tér -- na gló -- ri -- a_:
  Qui vi -- tam si -- ne tér -- mi -- no
  No -- bis do -- net in pá -- tri -- a.
  A -- men.
}

\score{
  \new Staff <<
    \set Staff.midiInstrument = "flute"
    \new Voice = "theme" {
      \override Score.PaperColumn #'keep-inside-line = ##t
      \autoBeamOff
      \MetriqueArmure
      \MusiqueTheme
    }
    \new Lyrics \lyricsto theme {
      \ParolesA
    }
    \new Lyrics \lyricsto theme {
      \ParolesB
    }
  >>
  \layout{}
  \midi{}
}
