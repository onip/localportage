# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_P="${P#gimp-}"

DESCRIPTION="Resynthesizer is a Gimp plug-in for texture synthesis."
HOMEPAGE="http://www.logarithmic.net/pfh/resynthesizer"
SRC_URI="http://www.logarithmic.net/pfh-files/resynthesizer/${MY_P}.tar.gz"
LICENSE="GPL"

SLOT="0"
KEYWORDS="~x86"
IUSE="gimp"

DEPEND=">=media-gfx/gimp-2.2.17"

S=${WORKDIR}/${MY_P}

src_compile() {
	epatch "${FILESDIR}/gentoo-${PV}.patch" || die "epatch failed"
	emake || die "emake failed"
}

src_install() {
	exeinto `gimptool-2.0 --gimpplugindir`/plug-ins
	doexe resynth || die "Resynth installation failed"

	insinto `gimptool-2.0 --gimpdatadir`/scripts
	doins smart-enlarge.scm || die "Installation of smart-enlarge.scm failed"
	doins smart-remove.scm || die "Installation of smart-remove.scm failed"
	dodoc README
}

pkg_postinst() {
	elog
	einfo "After restarting the Gimp you should find the"
	einfo "following items in the pop-up image menu:"
	elog 
	einfo "Filters -> Map -> Resynthesize"
	einfo "Filters -> Enhance -> Smart enlarge"
	einfo "Filters -> Enhance -> Smart sharpen"
	einfo "Filters -> Enhance -> Smart remove selection"
	elog
}
