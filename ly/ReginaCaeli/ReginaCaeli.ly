\version "2.12.4"

\header{
        title = "Regina cæli"
	tagline = ""
}

\paper {
	paper-width = 14.8\cm
	line-width = 12\cm
	paper-height = 21.0\cm
	top-margin = 2.2\cm
	make-footer=##f
}


Soprano = \relative c' {
	\autoBeamOff
        \partial 8 c8
        a'4 a8 bes a bes
        c4. a
        c4. d4 c8
        bes2.
        a4. c8[ bes] a
        g4. r4 c,8
        f4 f8 g f g
        a4( c8) c4.
        bes4( c8) d[ c] bes
        a4. r4.
        \bar "||"
        a4 a8 a bes a
        g8 a g f[ a f]
        c4. a'
        a8[ g] a bes4.
        bes4 bes8 bes c bes
        a8 g f a4( c8)
        c4. bes4( c8)
        d8[ c] bes a4.
	\bar "|."
}

Alto = \relative c' {
	\autoBeamOff
        \partial 8 c8
        f4 f8 g f g
        a4. f
        a4. bes4 a8
        g2.
        f4. a4 f8
        c4. r4 c8
        f4 f8 g f g
        a4( c8) c4.
        g4( a8) bes[ a] g
        f4. r4.
        
        a4 a8 a bes a
        g8 a g f[ a f]
        c4. f
        f8[ e] f g4.
        bes4 bes8 bes c bes
        a8 g f a4( c8)
        c4. g4( a8)
        bes8[ a] g f4.
}


Paroles = \lyricmode {
	Re -- gi -- na cæ -- li, læ -- ta -- re,
        Al -- le -- lu -- ia, Al -- le -- lu -- ia,
        Re -- gi -- na cæ -- li, læ -- ta -- re,
        Al -- le -- lu -- ia.
        
        \set stanza = #"1. "
        Qui -- a quem me -- ru -- i -- sti por -- ta -- re,
        Al -- le -- lu -- ia,
        Qui -- a quem me -- ru -- i -- sti por -- ta -- re,
        Al -- le -- lu -- ia.
}

Couplets = \markup {
    \column{
      "2. Resurrexit sicut dixit, Alleluia."
      "3. Ora pro nobis Deum, Alleluia."
      }
}


%\book{
%	#(set-global-staff-size 24)
	\score {
		\new ChoirStaff
		<<
		\new Staff {
		\override Score . LyricText #'font-name = #"Linux Libertine O"
		\override Score . LyricText #'font-size = #3
%		\cadenzaOn
			<<
			\set Staff.midiInstrument = "flute"
			\clef treble
			\key f\major
                        \time 6/8
                        \tempo 4.=60
			{
				\new Voice = "soprano" {
					\voiceOne
					\Soprano
				}
			}
			\new Voice = "alto" {
				\voiceTwo
				\Alto
			}
			>>
		}
		\new Lyrics \lyricsto soprano {
			\Paroles
		}
		>>
		\layout{
		  \context {
		    \Staff \RemoveEmptyStaves
		    \override VerticalAxisGroup #'remove-first = ##t
		  }
		}
		\midi{}
	}
                \Couplets

