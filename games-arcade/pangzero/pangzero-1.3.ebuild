# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Pang Zero is a clone and enhancement of Super Pang, a fast-paced action game."
HOMEPAGE="http://apocalypse.rulez.org/pangzero/Pang_Zero"
SRC_URI="mirror://sourceforge/pangzero/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-perl/sdl-perl"
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${P}"

src_compile() {
	egamesconf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog README TODO
	prepgamesdirs
}
