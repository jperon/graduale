\version "2.16.0"

\header {
  tagline = ""
  composer = ""
}

MetriqueArmure = {
  \tempo 4=90
  \time 3/4
  \key f \major
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative c'' {
  \partial 4 c8[ bes]
  a4 a8 a g a
  c4( bes4) \breathe bes8[ a]
  g4 g8 g c bes
  a2 \breathe c,8[ f]
  f4 f8 f g g
  a2 \breathe bes8[ d]
  c4 c8 a bes g
  f2 \bar "||"
  a8 bes
  d4 c c8 d
  c4 bes \breathe bes8 c
  a4 a c8 a
  g2 \breathe g8 a
  bes4 bes a8 g
  a4 a \breathe a8 f
  g4 c b8 d
  c2 \bar "|."
}

Paroles = \lyricmode {
  Lou -- é soit à tout in -- stant
  Jé -- sus au Saint_- Sa -- cre -- ment,
  Lou -- é soit à tout in -- stant
  Jé -- sus au Saint_- Sa -- cre -- ment.
  
  \set stanza = "1."
  Jé -- sus veut, par un mi -- ra -- cle,
  Près de nous, la nuit, le jour,
  Ha -- bi -- ter au Ta -- ber -- na -- cle,
  Pri -- son -- nier de son a -- mour.
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
      \Paroles
    }
  >>
  \layout{}
  \midi{}
}
