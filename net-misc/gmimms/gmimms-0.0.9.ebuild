# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="GUI for mimms"
HOMEPAGE="http://gmimms.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.8
	gnome-base/libglade"

RDEPEND="${DEPEND}
	net-misc/mimms"
	#=net-misc/mimms-${PV}"

src_install() {
	emake DESTDIR="${D}" install
	domenu ${FILESDIR}/${PN}.desktop
#	dodoc DOCS AUTHORS ChangeLog NEWS README THANKS
}
