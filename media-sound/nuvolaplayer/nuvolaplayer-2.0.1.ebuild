# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=4

inherit waf-utils eutils vala

DESCRIPTION="Cloud music integration for your Linux desktop"
HOMEPAGE="https://launchpad.net/nuvola-player"
SRC_URI="https://launchpad.net/nuvola-player/releases-2.x/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

VALA_MIN_API_VERSION="0.14"

RDEPEND="www-plugins/adobe-flash
		"
DEPEND="${RDEPEND}
		$(vala_depend)
		>=dev-lang/python-2.5
		dev-lang/perl
		dev-util/intltool
		gnome-base/librsvg
		>=dev-libs/glib-2.32
		virtual/pkgconfig
		sys-devel/gettext
		dev-util/intltool
		>=net-libs/libsoup-2.38
		>=x11-libs/gtk+-3.4
		>=dev-libs/libgee-0.6
		>=net-libs/webkit-gtk-1.8:3"

src_prepare(){
	vala_src_prepare
}

src_configure(){
	waf-utils_src_configure --no-unity-quick-list --no-svg-optimization
}
