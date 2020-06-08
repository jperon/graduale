%Compilation:lilypond AingeruBatek.ly
%Apercu:evince AingeruBatek.pdf
%Esclaves:timidity -ia AingeruBatek.midi
\version "2.12.1"
\language "français"

\header {
	title = "Aingeru batek"
	tagline = ""
	composer = ""
}

\paper {
	paper-width = 14.8\cm
	paper-height = 21\cm
	top-margin = 2\cm
	left-margin = 1.5\cm
	right-margin = 1.5\cm
}

MetriqueArmure = {
	\tempo 4.=70
	\time 6/8
	\key fa \major
}

italique = { \override Score . LyricText #'font-shape = #'italic }

roman = { \override Score . LyricText #'font-shape = #'roman }

MusiqueTheme = \relative do' {
	\partial 8*3 do8 do do
	fa4 fa8 sol8 sol sol
	la4 r8 la8 sol la
	do8[ sib] la la[ sib] la
	sol4 r8 do,8 do do
	fa4 fa8 sol8 sol sol
	la4 r8 do8 do do
	re8[ do] sib la4.
	sib4. do4 r8
	do8 do do re[ do] sib
	la4. sol
	fa4.
	\bar "||"
}

MusiqueAccompagnement = \relative do' {
	\partial 8*3 s8*3
	la4 la8 do do do
	fa4 r8 fa8 mi fa
	la8 sol fa fa sol fa
	mi4 r8 s8*3
	la,4 la8 do do do
	fa4 r8 la8 la la
	sib8 la sol fa4.
	do4. fa4 r8
	la8 la la
	sib8 la sol fa4.
	do4. la4.
}

Paroles = \lyricmode {
	Ain -- ge -- ru ba -- tek Ma -- ri -- a -- ri
	Di -- o_: «_Gra -- zi -- az be -- the -- a._»
	Jaun Goi -- ko -- a -- ren Se -- me -- a -- ri
	E -- ma -- nen dio -- zu sor -- tze -- a,
	E -- ma -- nen dio -- zu sor -- tze -- a.
}

Couplets = \markup {
	\column {
		\vspace #0.5
		\line { \bold "2."
			\column {
				"Jainkoaren nahi saindua"
				"Ni-baitan dadin egina !"
				"Izan nadien amatua,"
				"Bainan geldituz Birjina. (bis)"
			}
			\bold "3."
			\column {
				"Orduan Berbo dibinoa"
				"Gorputz batez da beztitzen"
				"Oi ! ontasun egiazkoa :"
				"Jauna gurekin egoiten. (bis)"
			}
		}
		\vspace #1.0
		\line { \hspace #18.0 \bold "4."
			\column {
				"Othoitz zazu zure Semea,"
				"Gure Ama amultsua ;"
				"Izan dezagun fagorea"
				"Ardiesteko zerua. (bis)"
			}
		}
	}
}

\score{
	\new Staff <<
		\set Staff.midiInstrument = "flute"
		\new Voice = "theme" {
			\override Score.PaperColumn #'keep-inside-line = ##t
			\autoBeamOff
			\MetriqueArmure
			<<
				\MusiqueTheme
				\MusiqueAccompagnement
			>>
		}
		\new Lyrics \lyricsto theme {
			\Paroles
		}                       
	>>
	\layout{}
	\midi{}
}

\Couplets
