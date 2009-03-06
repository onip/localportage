# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_P="${P#gimp-}"

DESCRIPTION="Resynthesizer is a Gimp plug-in for texture synthesis."
HOMEPAGE="http://http://www.logarithmic.net/pfh/resynthesizer"
SRC_URI="http://www.logarithmic.net/pfh-files/resynthesizer/${MY_P}.tar.gz"
LICENSE="GPL"

SLOT="0"
KEYWORDS="~x86"
IUSE="gimp"

DEPEND=">=media-gfx/gimp-2.2.10"

S=${WORKDIR}/${MY_P}

src_compile() {
	epatch "${FILESDIR}/0.14-gentoo.diff" || die "epatch failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die
	dodoc README COPYING
}

