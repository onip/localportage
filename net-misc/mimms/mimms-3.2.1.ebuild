# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="An mms:// downloader client"
HOMEPAGE="https://savannah.nongnu.org/projects/mimms/"
SRC_URI="http://savannah.nongnu.org/download/mimms/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-lang/python:2.5
	>=media-libs/libmms-0.4"

DEPEND="${RDEPEND}"
