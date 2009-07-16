# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
WX_GTK_VER="2.8"
inherit cmake-utils mercurial flag-o-matic wxwidgets

EHG_REPO_URI="http://www.luxrender.net/hg/lux"

DESCRIPTION="A GPL unbiased renderer"
HOMEPAGE="http://www.luxrender2.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="sse2 doc debug"

RDEPEND=">=dev-libs/boost-1.37
	media-libs/openexr
	media-libs/tiff
	media-libs/libpng
	media-libs/jpeg
	media-libs/ilmbase
	virtual/opengl
	x11-libs/wxGTK:2.8[X,opengl,sdl]"

DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex
	doc? ( >=app-doc/doxygen-1.5.7[-nodot] )"

S="${WORKDIR}/lux"

src_prepare() {
	# upstream ships with their own CFLAGS\CXXFLAGS that we need to strip
	epatch "${FILESDIR}/${PN}-0.6_rc4-flags.patch"
}

src_configure() {
	use sse2 && append-flags "-msse2 -DLUX_USE_SSE"
	use debug && append-flags -ggdb

	need-wxwidgets unicode
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	dodoc AUTHORS.txt

	# installing API(s) docs
	if use doc; then
		pushd "${S}"/doxygen > /dev/null
		doxygen doxygen.conf
		dohtml html/*
		popd > /dev/null
	fi

	make_desktop_entry "${PN}" "Lux Render" "/usr/share/pixmaps/luxrender.svg" "Graphics;3DGraphics;"
}

