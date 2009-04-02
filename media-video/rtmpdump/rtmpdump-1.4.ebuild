# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="RTMP stream dumper"
HOMEPAGE="http://rtmpdump.sf.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
EAPI="2"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	epatch "${FILESDIR}/nodebug.patch"
}

src_install() {
	dobin rtmpdump
	#dobin get_iplayer get_hulu
	dobin get_iplayer
	dodoc README
}
