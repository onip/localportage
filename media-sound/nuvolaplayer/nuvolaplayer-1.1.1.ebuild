# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=4

inherit waf-utils eutils vala

DESCRIPTION="Cloud music integration for your Linux desktop"
HOMEPAGE="https://launchpad.net/nuvola-player"
SRC_URI="https://launchpad.net/nuvola-player/releases-1.x/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND="www-plugins/adobe-flash
		"
DEPEND="${RDEPEND}
		$(vala_depend)
		dev-util/intltool
		>=net-libs/libsoup-2.34
		>=x11-libs/gtk+-2.20
		>=dev-libs/libunique-0.9:1
		>=dev-libs/libgee-0.5
		>=net-libs/webkit-gtk-1.2:2
		<net-libs/webkit-gtk-1.7:2"

src_prepare(){
	vala_src_prepare
}

src_configure(){
	waf-utils_src_configure --no-unity-quick-list --no-svg-optimization
}
