\version "2.16.0"
\language "français"

\header {
  tagline = ""
  composer = ""
}

MetriqueArmure = {
  \tempo 4=70
  \key sol \major
  \time 6/8
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative do'' {
  \partial 8*2 sol8[\mf la]
  si4 si8 la8[ si] do
  si4( la8) sol4 \breathe la8
  si4 re8 re4 do8
  si4.~ si8 r sol16[ la]
  si4 si8 la[ si] do
  si4( la8) sol4 \breathe la8
  si4 re8 re4 do8
  si4.~ si8 r re
  re4\< do8 si[ do] re
  mi4.\! re4 \breathe re8
  re4 si8 sol[ la] si
  la4.~ la8 r re
  re4\< do8 si[ do] re
  mi4.\! re4 \breathe re16[ do]
  si4 si8 la[\> do] la
  sol4.~\! sol8
  \bar "|."
}

Paroles = \lyricmode {
  \set stanza = "1."
  Oi mi -- ra -- kui -- lu gu -- ziz es -- pan -- ta -- gar -- ri -- a_!
  O -- gi -- a -- ren i -- du -- riz Je -- sus es -- ta -- li -- a_!
  Hu -- ra dut a -- do -- ra -- tzen al -- da -- re gai -- ne -- an,
  Hu -- ra be -- ra dut ja -- ten ko -- mu -- ni -- o -- ne -- an.
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
