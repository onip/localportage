# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod

DESCRIPTION="Driver for Syntek webcams"
HOMEPAGE="http://syntekdriver.sourceforge.net/"
SRC_URI="mirror://sourceforge/syntekdriver/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

MODULE_NAMES="stk11xx(usb/video:)"
BUILD_TARGETS=" "
CONFIG_CHECK="VIDEO_DEV VIDEO_V4L1_COMPAT"

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="-C ${KV_DIR} SUBDIRS=${S}"
}

src_install() {
	linux-mod_src_install
	dodoc README || die "dodoc failed"
}
