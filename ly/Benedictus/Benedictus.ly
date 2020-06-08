\version "2.16.0"

\header {
  tagline = ""
  composer = ""
}

MetriqueArmure = {
  \tempo 4=80
  \time 4/4
  \key ees \major
}


roman = { \override Score . LyricText #'font-series = #'normal \override Score . LyricText #'font-shape = #'roman }

italique = { \roman \override Score . LyricText #'font-shape = #'italic }

gras = { \roman \override Score . LyricText #'font-series = #'bold }

MusiqueTheme = \relative c' {
  \partial 4 ees8 f
  g2 g4 g
  bes2( aes4 g)
  f2 r4 f8[ g]
  aes2 aes4 aes
  c2( bes4) aes
  g2 r4 ees8 ees
  c'2 c4 c
  bes2 bes4 \breathe ees,
  aes2 aes4 g
  f4. ees8 ees4\fermata \bar "'" ees4
  c'2 c4. \breathe c8
  ees2 bes4 \breathe ees,
  aes4 bes8[ c] bes4 aes
  g2( f)
  ees1\fermata \bar "|."
  
  \cadenzaOn
  ees8 f g g g g g g f g ees ees2 \bar "|"
  g8 g g g g g g g g g g g g g ees f[ g] f ees2 \bar "|."
}

MusiqueDeux = \relative c' {
  \partial 4 ees8 d
  ees2 ees4 ees
  ees2( f4 ees)
  d2 r4 d8[ ees]
  f2 f4 f4
  aes2( ees4 f)
  ees2 r4 ees8 des
  c2 f4 d
  ees2 d4 c
  c4( f) f ees
  d4. ees8 ees4 ees
  ees2 f4 fis
  g2 g4 ees4
  f4 g8[ aes] g4 f
  ees2( d)
  ees1
}

Paroles = \lyricmode {
  Be -- ne -- dí -- ctus qui ve -- nit
  in nó -- mi -- ne Dó -- mi -- ni.
  Be -- ne -- dí -- ctus qui ve -- nit
  in nó -- mi -- ne Dó -- mi -- ni.
  Ho -- sán -- na, ho -- sán -- na,
  ho -- sán -- na in ex -- cél -- sis_!
  
  \set stanza = "1."
  Be -- ne -- dí -- ctus Dó -- mi -- nus, De -- \italique us \gras Is -- \roman ra -- ël_:_*
  Qui -- a vi -- si -- tá -- vit, et fe -- cit red -- em -- pti -- ó -- nem \italique ple -- bis \gras su -- \roman æ.
}

\score{
  \new Staff <<
    \set Staff.midiInstrument = "flute"
    \new Voice = "theme" {\voiceOne
      \override Score.PaperColumn #'keep-inside-line = ##t
      \autoBeamOff
      \MetriqueArmure
      \MusiqueTheme
    }
    \new Voice = "deux" {\voiceTwo
      \override Score.PaperColumn #'keep-inside-line = ##t
      \autoBeamOff
      \MetriqueArmure
      \MusiqueDeux
    }
    \new Lyrics \lyricsto theme {
      \Paroles
    }
  >>
  \layout{}
  \midi{}
}
