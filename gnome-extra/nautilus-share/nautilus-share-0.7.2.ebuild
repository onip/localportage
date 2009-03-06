# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 eutils

DESCRIPTION="A nautilus plugin to easily share folders over the SMB protocol"
HOMEPAGE="http://gentoo.ovibes.net/nautilus-share"
SRC_URI="http://gentoo.ovibes.net/${PN}/${P}.tar.gz"

IUSE=""
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"

DEPEND=">=gnome-base/nautilus-2.10.0
	>=gnome-base/eel-2.10.0
	>=dev-libs/glib-2.4.0
	>=gnome-base/libglade-2.4.0"
RDEPEND="${DEPEND}
	>=net-fs/samba-3.0.23"

DOCS="AUTHORS ChangeLog NEWS README TODO"

USERSHARES_DIR="/var/lib/samba/usershare"
USERSHARES_GROUP="samba"

src_install() {
	gnome2_src_install
	keepdir ${USERSHARES_DIR}
}

pkg_preinst() {
	has_version "<gnome-extra/${PN}-0.7.0" \
		&& UPGRADING_FROM_06="yes" || UPGRADING_FROM_06=""
}

pkg_postinst() {
	if [[ "$UPGRADING_FROM_06" ]] || [[ -e /etc/init.d/smbshared ]]; then
		ebeep
		ewarn "UPGRADING FROM 0.6.x:"
		ewarn
		ewarn "1. Remove the line \"include = /etc/samba/smbshared.conf\" from "
		ewarn "   /etc/samba/smb.conf"
		ewarn "2. Delete /etc/samba/smbshared.conf"
		ewarn "3. Remove /etc/init.d/smbshared from runlevel:"
		ewarn "        # /etc/init.d/smbshared stop"
		ewarn "        # rc-update del smbshared default"
		ewarn "        # rm /etc/init.d/smbshared"
		ewarn
	fi

	enewgroup ${USERSHARES_GROUP}
	einfo "Fixing ownership and permissions on ${ROOT}/${USERSHARES_DIR}..."
	chown root:${USERSHARES_GROUP} ${ROOT}/${USERSHARES_DIR}
	chmod 01770 ${ROOT}/${USERSHARES_DIR}

	einfo
	einfo "To get nautilus-share working, add the lines"
	einfo
	einfo "    # Allow users in group \"${USERSHARES_GROUP}\" to share"
	einfo "    # directories with the \"net usershare\" commands"
	einfo "    usershare path = ${USERSHARES_DIR}"
	einfo "    # Set a maximum of 100 user-defined shares in total"
	einfo "    usershare max shares = 100"
	einfo "    # Allow users to permit guest access"
	einfo "    usershare allow guests = yes"
	einfo "    # Only allow users to share directories they own"
	einfo "    usershare owner only = yes"
	einfo
	einfo "to the end of the [global] section in /etc/samba/smb.conf."
	einfo
	einfo "Users who are to be allowed to use nautilus-share should be added"
	einfo "to the \"${USERSHARES_GROUP}\" group:"
	einfo
	einfo "# usermod -a -G ${USERSHARES_GROUP} USER"
	einfo
	einfo "Users may need to log out and in again for the group assignment to"
	einfo "take effect and to restart Nautilus."
	einfo
	einfo "For more information, see USERSHARE in net(8)."
	einfo
}
