# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="World of Padman: Stand-Alone Complex"
HOMEPAGE="http://worldofpadman.com/"
SRC_URI="http://thilo.kickchat.com/download/worldofpadman.run
	http://camelot.snt.utwente.nl/padman/worldofpadman.run
	http://btc3x6.che.uni-bayreuth.de/~tl/wop_final/worldofpadman.run
	http://thilo.kickchat.com/download/wop_padpack.zip
	http://btc3x6.che.uni-bayreuth.de/~tl/wop_final/wop_padpack.zip
	ftp://ftp.snt.utwente.nl/pub/games/padman/wop_padpack.zip"

# See copyright_en.txt
LICENSE="${PN}"
SLOT="0"
KEYWORDS="-* ~amd64 ~ppc ~x86"
IUSE="doc linguas_de"
RESTRICT="strip"

DEPEND="app-arch/unzip"
RDEPEND="
	x86? (
		media-libs/libvorbis
		virtual/opengl
		x11-libs/libXext
		x11-libs/libX11
		x11-libs/libXau
		x11-libs/libXdmcp )
	amd64? ( >=app-emulation/emul-linux-x86-sdl-10.1 )"

S=${WORKDIR}
dir=${GAMES_PREFIX_OPT}/wop

get_arch() {
	local arch=i386
	use amd64 && arch="x86_64"
	use ppc && arch="ppc"
	echo "${arch}"
}

src_unpack() {
	unpack_makeself worldofpadman.run
	unpack wop_padpack.zip

	mkdir engine
	cd engine
	local arch=$(get_arch)
	unpack "./../wop-engine.${arch}.tar"
	cd "${S}"

	mkdir data
	cd data
	unpack ./../wop-data.tar
	# Include map pack
	mv ../*.pk3 . || die
	cd "${S}"

	if use doc ; then
		mkdir doc
		cd doc
		unpack ./../readme.tar
	fi
}

src_install() {
	insinto "${dir}"
	doins copyright_en.txt wop.png
	use linguas_de && doins copyright_de.txt

	insinto "${dir}"/wop
	doins -r data/* || die "doins data"

	exeinto "${dir}"
	doexe engine/* || die "doexe"

	local arch=$(get_arch)
	games_make_wrapper ${PN} "./wop-engine.${arch}" "${dir}"
	doicon wop.png || die "doicon"
	make_desktop_entry ${PN} "World of Padman" wop.png

	if use doc ; then
		insinto "${dir}"
		doins -r doc || die "doins doc"
	fi

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "To play this game, run:  wop"
}
