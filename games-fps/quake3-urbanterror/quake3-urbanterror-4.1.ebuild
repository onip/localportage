MOD_DESC="total transformation realism based mod"
MOD_NAME="Urban Terror"
MOD_DIR="q3ut4"
MOD_BINS="ut4"

inherit games games-mods

HOMEPAGE="http://www.urbanterror.net/"
SRC_URI="
	ftp://ftp.snt.utwente.nl/pub/games/urbanterror/UrbanTerror_41_FULL.zip
	http://mirror.kickassctf.com/UrbanTerror_41_FULL.zip
	http://mrsentry.net/release/UrbanTerror_41_FULL.zip
	http://www.iourt.com/urt41/UrbanTerror_41_FULL.zip
	http://mirror.ncsa.uiuc.edu/ut4/urbanterror/UrbanTerror_41_FULL.zip"

LICENSE="freedist"
SLOT="4"
RESTRICT="mirror strip"

KEYWORDS="-* ~amd64 ~ppc ~x86"

RDEPEND="ppc? ( games-fps/${GAME} )
		!ppc? (
		|| (
			games-fps/${GAME}
			games-fps/${GAME}-bin
			games-fps/ioUrbanTerror-bin ) )"


