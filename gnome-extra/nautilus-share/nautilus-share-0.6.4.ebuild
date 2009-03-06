# Copyright 1999-2005 Gentoo Foundation
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
	>=gnome-base/libglade-2.4.0
	>=dev-libs/libdaemon-0.7
	>=sys-apps/dbus-0.23
	dev-libs/dbus-glib"
RDEPEND="${DEPEND}
	>=x11-themes/gnome-icon-theme-2.10.1
	net-fs/samba"

DOCS="AUTHORS BUGS INTERNAL README TODO"

G2CONF="--with-dbus-sys=/etc/dbus-1/system.d"

#pkg_setup() {
#	if ! built_with_use sys-apps/dbus gtk; then
#		eerror "Need GLib support in DBUS."
#		eerror "Please re-emerge sys-apps/dbus with gtk USE flag enabled."
#		die "unmet dependencies"
#	fi
#}

src_install() {
	gnome2_src_install "$@"

	# debian only
	rm -r ${D}/etc/dbus-1/event.d
	doinitd ${FILESDIR}/smbshared
}

pkg_preinst() {	
	if ! [[ -e ${ROOT}/etc/samba/smb.conf ]]; then
		dodir /etc/samba
		cat > ${IMAGE}/etc/samba/smb.conf <<END

[global]
workgroup =  WORKGROUP
security = share
# directive to enable gnome-extra/nautilus-share
include = /etc/samba/smbshared.conf

END
		fperms 644 /etc/samba/smb.conf
	fi
	if ! [[ -e ${ROOT}/etc/samba/smbshared.conf ]]; then
		dodir /etc/samba
		touch ${IMAGE}/etc/samba/smbshared.conf
		fperms 644 /etc/samba/smbshared.conf
	fi
}

pkg_postinst() {
	einfo "To get nautilus-share working:"
	echo
	if ! grep 'include[[:space:]]*=[[:space:]]*/etc/samba/smbshared.conf' \
		-q ${ROOT}/etc/samba/smb.conf; then
		einfo "Add the lines"
		echo
		einfo "    # directive to enable gnome-extra/nautilus-share"
		einfo "    include = /etc/samba/smbshared.conf"
		echo
		einfo "to the end of the [global] section in /etc/samba/smb.conf"
		echo
	fi
	einfo "Issue the following commands as root:"
	echo
	einfo "  # rc-update add smbshared default"
	einfo "  # /etc/init.d/dbus restart"
	einfo "  # /etc/init.d/smbshared start"
	echo
	einfo "As your current user, restart nautilus:"
	echo
	einfo "  $ nautilus -q"
	echo
}

pkg_postrm() {
	if ! has_version ${CATEGORY}/${PN}; then
		if [[ -e ${ROOT}/etc/samba/smb.conf ]] && \
			grep 'include[[:space:]]*=[[:space:]]*/etc/samba/smbshared.conf' \
			-q ${ROOT}/etc/samba/smb.conf
		then
			ebeep
			ewarn "SECURITY ADVISORY:"
			ewarn "You probably should remove the line"
			echo
			ewarn "    include = /etc/samba/smbshared.conf"
			echo
			ewarn "from /etc/samba/smb.conf"
			echo
		fi
		if [[ -e ${ROOT}/etc/samba/smbshared.conf ]]; then
			ebeep
			ewarn "SECURITY ADVISORY:"
			ewarn "You probably should delete /etc/samba/smbshared.conf"
			echo
		fi
	fi
}

