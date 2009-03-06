# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/gimp-texturize/gimp-texturize-2.0.ebuild,v 1.2 2006/01/12 23:40:28 compnerd Exp $

inherit flag-o-matic libtool eutils fdo-mime alternatives

DESCRIPTION="Texturizer plugin for GNU Image Manipulation Program"
HOMEPAGE="http://www.gimp.org/"

SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"
S=${WORKDIR}/${PN}
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-gfx/gimp"
DEPEND="${RDEPEND}"

src_unpack() {

        unpack ${A}

        cd ${S}
}

src_compile() {
        econf || die "configure failed"
        emake || die "emake failed"
}

src_install() {
        make DESTDIR=${D} install || die "install failed"
}


