\version "2.16.0"

\header {
  tagline = ""
  composer = ""
}

MetriqueArmure = {
  \tempo 4=60
  \key bes \major
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative c' {
  \time 2/4
  r4 f8. f16
  f4 bes8. bes16
  bes4 d8. d16
  d4 c8. bes16
  a4\fermata \bar "'" c8. c16
  c4 g8. a16
  bes4 a8. bes16
  d4 c8. bes16
  bes2 \bar "||"
  
  \time 6/8 \tempo 4.=60
  \set Timing.measureLength = #(ly:make-moment 1 8)
  f8
  \set Timing.measureLength = #(ly:make-moment 6 8)
  f4 bes8 bes4 d8
  d4.~ d4 \bar "'" d8
  d4 c8 ees4 d8
  c4.~ c8 \bar "" r8 c8
  c4 bes8 a4 g8
  f4.~ f4 \bar "'" g8
  f4 a8 c4 d8
  bes4.~ bes8 r8 \bar "" d8
  d4 d8 d4 bes8
  g4.~ g4 \bar "'" g8
  ees'4 ees8 ees4 c8
  a4.~ a8 r8 \bar "" f8
  f4 bes8 bes4 d8
  d4.~ d4 \bar "'" d8
  ees4 d8 c4 d8
  bes4.~ bes4 r8 \bar "|."
}

Paroles = \lyricmode {
  A -- do -- ra de -- za -- gun men -- de -- ren men -- de -- tan
  Je -- sus Jain -- ko Jau -- na Sa -- kra -- men -- du hun -- tan.
  
  \set stanza = "1."
  Je -- sus a -- mo -- di -- oz_/ bi -- ho -- tza gain -- di -- an
  Zein mi -- ra -- gar -- ri zen_/ az -- ken a -- fa -- ri -- an_!
  Gu -- re -- tzat ze -- la -- rik_/ hil -- tze -- rat a -- bi -- an,
  Ge -- ro -- kotz e -- re zen_/ gu -- re -- kin na -- hi -- an.
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
