# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

DESCRIPTION="Suds is a lightweight SOAP python client for consuming Web Services."
HOMEPAGE="https://fedorahosted.org/suds/"
SRC_URI="https://fedorahosted.org/releases/s/u/suds/python-${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

EAPI="2"

S="${WORKDIR}/python-${P}/"

src_prepare() {
	epatch "${FILESDIR}/suds-${PV}-python-2.6.patch"
	epatch "${FILESDIR}/unicode_subclass-python-2.6.patch"
}
