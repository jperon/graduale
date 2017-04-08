\version "2.16"

\header {
  tagline = ""
  composer = ""
}                                        

MetriqueArmure = {
  \time 3/4
  \key c \major
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative c'' {\cadenzaOn
  \tempo 4=60
  c4 c c c\tenuto \bar "'" c b c a2\fermata \bar "|"
  a4 a a a\tenuto \bar "'" a g a b2\fermata \bar "|"
  c4 c c\tenuto \bar "'" c b4. c8 c1\fermata \bar "||"
  
  \tempo 4=100
  e,4 e e a\tenuto \bar "'" b4 c b a2\fermata \bar "|"
  e4 e e g\tenuto \bar "'" f4 e d c2\fermata \bar "|"
  e4 e d c c( b8) a e'1\fermata \bar "|."
}

Paroles = \lyricmode {
  Lau -- da Si -- on Sal -- va -- tó -- rem,
  Lau -- da du -- cem et pas -- tó -- rem,
  In hy -- mnis et cán -- ti -- cis.
  
  \set stanza = "1."
  Quan -- tum pot -- es, tan -- tum au -- de,
  Qui -- a ma -- ior o -- mni lau -- de,
  Nec lau -- dá -- re súf -- fi -- cis.
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
