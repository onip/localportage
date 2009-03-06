# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils cvs eutils flag-o-matic

ECVS_SERVER="cvs.savannah.nongnu.org:/sources/ecume"
#ECVS_SERVER="offline"
ECVS_AUTH="pserver"
ECVS_USER="anonymous"
ECVS_PASS=""
ECVS_MODULE="lux"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DESCRIPTION="A GPL unbiased renderer"
HOMEPAGE="http://www.luxrender2.org/"

EAPI="2"

IUSE="opengl sse2 wxwindows"

DEPEND="dev-libs/boost
		media-libs/openexr
		x11-libs/fltk
		sys-devel/bison
		sys-devel/flex
		media-libs/tiff
		media-libs/libpng
		wxwindows? ( x11-libs/wxGTK:2.8[X,opengl,sdl] )"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${ECVS_MODULE}

CMAKE_IN_SOURCE_BUILD="true"

src_unpack() {
	cvs_src_unpack
}

src_prepare() {
	# upstream ships with their own CFLAGS\CXXFLAGS that we need to strip
	epatch "${FILESDIR}/luxrender-custom-flags.patch"
}

#src_compile() {
src_configure() {
	#opengl is used for visualizing rendered image
	use opengl && append-flags "-DLUX_USE_OPENGL"
	use sse2 && append-flags "-msse -msse2 -DLUX_USE_SSE"

	local mycmakeargs

	#mycmakeargs="${mycmakeargs} -DCMAKE_VERBOSE_MAKEFILE:BOOL=TRUE"
	mycmakeargs="${mycmakeargs} -DCMAKE_CXX_FLAGS_RELEASE:STRING="
	mycmakeargs="${mycmakeargs} -DCMAKE_C_FLAGS_RELEASE:STRING="

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}
