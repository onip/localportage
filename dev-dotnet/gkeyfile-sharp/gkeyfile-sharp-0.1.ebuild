# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit mono autotools

DESCRIPTION="CLI Bindings for gkeyfile"
HOMEPAGE="https://launchpad.net/gkeyfile-sharp"
SRC_URI="http://download.github.com/mono-gkeyfile-sharp-GKEYFILE_SHARP_0_1-0-g07a401a.tar.gz"
S="${WORKDIR}/mono-gkeyfile-sharp-662c5c1"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.6
	>=dev-lang/mono-2.0
	>=dev-dotnet/glib-sharp-2.12.9"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	mono_multilib_comply
}
