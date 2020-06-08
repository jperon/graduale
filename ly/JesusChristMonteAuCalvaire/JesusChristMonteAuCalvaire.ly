\version "2.16"
\language "français"

\header {
  tagline = ""
  composer = ""
}

MetriqueArmure = {
  \tempo 4=80
  \time 3/4
  \key sol \major
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative do'' {
  \partial 4 sol8 fad
  mi4 sol si8 si
  la8[( sol]) fad4 sol8 fad
  mi4 sol8[( fad]) mi re
  mi2 sol8 fad
  mi4 sol si8 si
  la8[( sol]) fad4 sol8 fad
  mi4 sol8[( fad]) mi re
  mi2 sol8 la
  si4 si do8 si
  si8[( la]) la4 si8 la
  sol4 si la8 sol
  fad2 sol8 fad
  mi4 sol si8 si
  la8[( sol]) fad4 sol8 fad
  mi4 sol8[( fad]) mi re
  mi2 \bar "|."
}

Alto = \relative do'' {
  sol8 fad
  mi4 mi mi8 mi
  fad8[ mi] re4 re8 re
  mi4 do si8 si
  mi2 sol8 fad
  mi4 mi mi8 mi
  fad8[ mi] re4 re8 re
  mi4 do si8 si
  mi2 mi8 re
  re4 sol mi8 mi
  fad4 fad fad8 fad
  mi4 mi mi8 mi
  re2 re8 re
  mi4 mi mi8 mi
  fad8[ mi] re4 re8 re
  mi4 do si8 si
  mi2
}

Tenor = \relative do' {
  sol8 fad
  mi4 sol sol8 sol
  do4 si si8 la
  sol4 la fad8 fad
  sol2 sol8 fad
  mi4 sol sol8 sol
  do4 si si8 la
  sol4 la fad8 fad
  sol2 sol8 fad
  sol4 sol sol8 sol
  do4 do si8 si
  si4 si do8 do
  si2 si8 la
  sol4 sol sol8 sol
  do4 si si8 la
  sol4 la fad8 fad
  sol2
}

Basse = \relative do' {
  sol8 fad
  mi4 do sol8 sol
  la4 si si8 si
  do4 la si8 si
  mi2 sol8 fad
  mi4 do sol8 sol
  la4 si si8 si
  do4 la si8 si
  mi2 mi8 fad
  sol4 sol sol,8 sol
  re'4 re re8 re
  mi4 sol, la8 la
  si2 si8 si
  mi4 do sol8 sol
  la4 si si8 si
  do4 la si8 si
  mi2
}

Paroles = \lyricmode {
  Jé -- sus_- Christ monte au Cal -- vai -- re,
  Il y va pour y mou -- rir.
  Sui -- vons_- le, c'est no -- tre Frè -- re,
  Qui pour nous vou -- lut souf -- frir.
  En mou -- rant, il nous dé -- li -- vre
  Du far -- deau de nos pé -- chés,
  Et ce -- lui qui veut le sui -- vre
  Sous la Croix de -- vra mar -- cher.
}

\score{
  \new StaffGroup
  <<
    \new Staff <<
      \set Staff.midiInstrument = "flute"
      \set Staff.autoBeaming = ##f
      \new Voice = "theme" {\voiceOne
        \override Score.PaperColumn #'keep-inside-line = ##t
        \MetriqueArmure
        \MusiqueTheme
      }
      \new Voice = "alto" {\voiceTwo
        \override Score.PaperColumn #'keep-inside-line = ##t
        \MetriqueArmure
        \Alto
      }
    >>
    \new Lyrics \lyricsto theme {
      \Paroles
    }
    \new Staff <<
      \clef bass
      \set Staff.midiInstrument = "flute"
      \set Staff.autoBeaming = ##f
      \new Voice = "tenor" {\voiceOne
        \override Score.PaperColumn #'keep-inside-line = ##t
        \MetriqueArmure
        \Tenor
      }
      \new Voice = "basse" {\voiceTwo
        \override Score.PaperColumn #'keep-inside-line = ##t
        \MetriqueArmure
        \Basse
      }
    >>
  >>
  \layout{}
  \midi{}
}
