\version "2.16"
\language "français"

\header {
  tagline = ""
  composer = ""
}

MetriqueArmure = {
  \tempo 4.=60
  \time 6/8
  \key do \major
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative do' {
  mi4. mi4 fa8
  sol4 sol8 sol4.
  do4.( la4) la8
  sol4.~ sol4 r8
  fa4. fa
  \times 3/2 {mi8 mi do mi}
  sol4.(  mi)
  re4.~ re4 r8
  mi4. mi4( re8)
  do4.~ do4 r8
  sol'4. sol4( fa8)
  mi4.~ mi4 r8
  do'4. si4( la8)
  \times 3/2 {sol8 fa mi re}
  mi4.( re)
  do2. \bar "||"
  
  \cadenzaOn
  do8 mi sol sol sol sol sol sol sol sol do si si la sol4\fermata \bar "|"
  sol8 sol sol sol sol sol sol mi fa[( mi]) re4 do2\fermata \bar "|."
}

Paroles = \lyricmode {
  Lau -- da, Ie -- rú -- sa -- lem, Dó -- mi -- num_;
  Lau -- da De -- um tu -- um, Si -- on_!
  Ho -- sán -- na, Ho -- sán -- na,
  Ho -- sán -- na Fí -- li -- o Da -- vid_!
  
  \set stanza = "1."
  Quó -- ni -- am con -- for -- tá -- vit se -- ras por -- tá -- rum tu -- á -- rum_:
  be -- ne -- dí -- xit fí -- li -- is tu -- is in te.
}

\score{
  <<
    \new Staff <<
      \set Staff.midiInstrument = "flute"
      \set Staff.autoBeaming = ##f
      \new Voice = "theme" {
        \override Score.PaperColumn #'keep-inside-line = ##t
        \MetriqueArmure
        \MusiqueTheme
      }
    >>
    \new Lyrics \lyricsto theme {
      \Paroles
    }
  >>
  \layout{}
  \midi{}
}
