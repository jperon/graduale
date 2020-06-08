\version "2.16.0"

\header {
  tagline = ""
  composer = ""
}

MetriqueArmure = {
  \tempo 4.=60
  \time 6/8
  \key bes \major
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative c' {
  f4 d'8 d[ c] d
  bes4. bes
  c4 c8 c[ bes] c
  d4. bes4 r8
  f4 d'8 d[ c] d
  bes4. bes4 bes8
  c4.~ c4 c8
  d4.~ d4 r8
  ees4 ees8 ees[ d] c
  d4. d4 \breathe bes8
  c4.~ c4 a8
  bes4.~ bes4 r8 \bar "||"
  
  f4 f8 f[ g] a
  bes4. d4.
  c8[ d] c bes[ g] a
  f4.~ f4 r8
  f4 f8 f[ g] a
  bes4. d4.
  c8[ d] c bes[ g] a
  f4.~ f4 r8
  f4 bes8 bes4 bes8
  bes4. c4 r8
  f,4 bes8 bes4 bes8
  bes4. c4 r8
  f,4. a
  g4. f4 r8 \bar "|."
}

Paroles = \lyricmode {
  Kris -- to Er -- re -- ge -- ri_/ E -- skual -- du -- nek a -- gur_!
  Kris -- to Er -- re -- ge -- ri_/ a -- gur_! a -- gur_!
  Kris -- to Er -- re -- ge -- ri_/ a -- gur_! a -- gur_!
  
  \set stanza = "1."
  I -- tsa -- so, men -- di -- ak,_/ i -- bai, ze -- la -- iak,
  Zu -- re -- tzat e -- gi -- nak,_/ di -- ra zu -- re -- ak.
  U -- re -- ko u -- hai -- nek,_/ men -- di -- ko oi -- ha -- nek_:
  Kris -- to, a -- gur_!
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
