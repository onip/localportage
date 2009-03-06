# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cvs eutils games

DESCRIPTION="3D arcade space shooter"
HOMEPAGE="http://www.realtech-vr.com/nogravity/"
# There's no version number in the data filename
SRC_URI="mirror://sourceforge/${PN}/rt-nogravity-data.zip"

# Must grab from CVS, to include the build scripts
# http://www.v3x.net/forums/viewtopic.php?t=270
ECVS_SERVER="cvs.sourceforge.net:/cvsroot/${PN}"
ECVS_MODULE=${PN}

# Code is GPL-2, data is free-noncomm - from README.TXT
# Confusing: http://www.v3x.net/forums/viewtopic.php?t=361
LICENSE="GPL-2
	free-noncomm"

SLOT="0"

# amd64 is untested: "there might have a lot of misalignment issues"
# http://www.v3x.net/forums/viewtopic.php?t=270
KEYWORDS="~x86"

IUSE=""
RESTRICT="nomirror"

RDEPEND=">=media-libs/libpng-1.2.8
	>=media-libs/libsdl-1.2.8-r1
	>=media-libs/libvorbis-1.1.0
	>=media-libs/sdl-mixer-1.2.6
	>=sys-devel/gcc-3.4.4-r1
	sys-libs/glibc
	sys-libs/zlib
	virtual/opengl
	|| (
		(
			x11-libs/libX11
			x11-libs/libXau
			x11-libs/libXdmcp
			x11-libs/libXext )
		virtual/x11 )"
DEPEND="${RDEPEND}
	app-arch/unzip"

S=${WORKDIR}/${PN}/src/Linux
dir=${GAMES_DATADIR}/${PN}

src_unpack() {
	unpack ${A}
	cvs_src_unpack
}

src_compile() {
	# Fix syntax error - temporary, no doubt
	local bad_file="${WORKDIR}/nogravity/rlx32/src/renderers/opengl/gl_v3x.h"
	if [[ $(grep -c "<GL/glext.h>" "${bad_file}") = "0" ]] ; then
		einfo "Fixing syntax error"
		sed -i "${bad_file}" -e "s:<GL/glext.h:<GL/glext.h>:" || die "sed failed"
	fi

	./bootstrap
	egamesconf --enable-sound=sdl_mixer || die "egamesconf failed"
	emake || die "emake failed"
}

src_install() {
	newgamesbin ${PN} ${PN}.bin || die

	insinto "${dir}"
	cd "${WORKDIR}"
	doins NOGRAVITY.RMX || die
	dodoc ${PN}/README.TXT

	# The source code requires the data file to be in the current directory
	games_make_wrapper ${PN} ${PN}.bin "${dir}"
	make_desktop_entry ${PN} "No Gravity"

	prepgamesdirs
}
