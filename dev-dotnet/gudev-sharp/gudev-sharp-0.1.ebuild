# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit mono

DESCRIPTION="generated .NET/mono bindings for gudev"
HOMEPAGE="https://launchpad.net/gudev-sharp"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${PN}-1.0-${PV}.tar.gz"
S="${WORKDIR}/${PN}-1.0-${PV}/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/mono-2.0
	>=x11-libs/gtk+-2.0
	>=sys-fs/udev-146
	>=dev-dotnet/gtk-sharp-1.9.0
	>=dev-dotnet/gtk-sharp-gapi-1.9.0"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	mono_multilib_comply
}

