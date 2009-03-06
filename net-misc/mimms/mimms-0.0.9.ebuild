# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="An mms:// downloader client"
HOMEPAGE="https://savannah.nongnu.org/projects/mimms/"
SRC_URI="http://savannah.nongnu.org/download/mimms/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="sys-fs/e2fsprogs
	dev-libs/popt"

DEPEND="${RDEPEND}
	app-text/txt2man"

src_install() {
	make DESTDIR="${D}" install
	dodoc DOCS AUTHORS ChangeLog NEWS README THANKS
}

