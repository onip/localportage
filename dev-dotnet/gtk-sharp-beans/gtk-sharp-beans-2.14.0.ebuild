# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit autotools

DESCRIPTION="gtk-sharp-beans binds some API from Gtk+ that isn't in Gtk# 2.12.x
but is needed for full GIO and other misc support."
HOMEPAGE="http://github.com/mono/gtk-sharp-beans"
SRC_URI="http://download.github.com/mono-gtk-sharp-beans-2.14.0-0-ga2ff3c5.tar.gz"
S="${WORKDIR}/mono-gtk-sharp-beans-19023b6"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-dotnet/gtk-sharp-2.12
	>=dev-dotnet/glib-sharp-2.12
	>=dev-dotnet/gio-sharp-0.2
	>=dev-dotnet/gtk-sharp-gapi-2.12"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_compile() {
	emake -j1
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
