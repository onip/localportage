# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/banshee/banshee-1.8.0.ebuild,v 1.2 2010/10/23 14:36:16 pacho Exp $

EAPI=2

inherit eutils autotools mono gnome2-utils fdo-mime versionator

GVER=0.10.7

DESCRIPTION="Import, organize, play, and share your music using a simple and powerful interface."
HOMEPAGE="http://banshee-project.org"

BANSHEE_V2=$(get_version_component_range 2)
[[ $((${BANSHEE_V2} % 2)) -eq 0 ]] && RELTYPE=stable || RELTYPE=unstable
#SRC_URI="http://download.banshee-project.org/${PN}/${RELTYPE}/${PV}/${PN}-1-${PV}.tar.bz2"
#SRC_URI="http://download.banshee-project.org/${PN}/stable/${PV}/${PN}-1-${PV}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+aac +cdda boo daap doc +encode gnome hal ipod karma mtp podcast test +udev +web youtube"

RDEPEND=">=dev-lang/mono-2.4.3
	gnome-base/gnome-settings-daemon
	x11-themes/gnome-icon-theme
	udev? (
		>=dev-dotnet/gtk-sharp-beans-2.8.0
		>=dev-dotnet/gio-sharp-0.2
		>=dev-libs/glib-2.22
		>=dev-dotnet/gudev-sharp-0.1
		>=dev-dotnet/gkeyfile-sharp-0.1
	)
	!udev? (
		hal? (
			sys-apps/dbus
			sys-apps/hal ) )
	gnome? (
		>=dev-dotnet/gtk-sharp-beans-2.8.0
		>=dev-dotnet/gio-sharp-0.2
		>=dev-libs/glib-2.22
	)
	>=dev-dotnet/gtk-sharp-2.12
	>=dev-dotnet/gconf-sharp-2.24.0
	>=dev-dotnet/notify-sharp-0.4.0_pre20080912-r1
	>=media-libs/gstreamer-0.10.23
	>=media-libs/gst-plugins-base-0.10.26
	>=media-libs/gst-plugins-bad-${GVER}
	>=media-libs/gst-plugins-good-${GVER}
	>=media-libs/gst-plugins-ugly-${GVER}
	>=media-plugins/gst-plugins-meta-0.10-r2:0.10
	>=media-plugins/gst-plugins-gnomevfs-${GVER}
	>=media-plugins/gst-plugins-gconf-${GVER}
	cdda? (
		|| (
			>=media-plugins/gst-plugins-cdparanoia-${GVER}
			>=media-plugins/gst-plugins-cdio-${GVER}
		)
	)
	media-libs/musicbrainz:1
	>=dev-dotnet/ndesk-dbus-glib-0.4.1
	>=dev-dotnet/ndesk-dbus-0.6.1a
	>=dev-dotnet/mono-addins-0.4[gtk]
	>=dev-dotnet/taglib-sharp-2.0.3.7
	>=dev-db/sqlite-3.4
	karma? ( >=media-libs/libkarma-0.1.0-r1 )
	aac? ( >=media-plugins/gst-plugins-faad-${GVER} )
	boo? (
		>=dev-lang/boo-0.8.1
	)
	daap? (
		>=dev-dotnet/mono-zeroconf-0.8.0-r1
	)
	doc? (
		virtual/monodoc
		>=app-text/gnome-doc-utils-0.17.3
	)
	encode? (
		>=media-plugins/gst-plugins-lame-${GVER}
		>=media-plugins/gst-plugins-taglib-${GVER}
	)
	ipod? (
		>=media-libs/libgpod-0.7.95[mono]
	)
	mtp? (
		>=media-libs/libmtp-0.3.0
	)
	web? (
		>=net-libs/webkit-gtk-1.2.2
		>=net-libs/libsoup-2.26:2.4
		>=net-libs/libsoup-gnome-2.26:2.4
	)
	youtube? (
		>=dev-dotnet/google-gdata-sharp-1.4
	)"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

