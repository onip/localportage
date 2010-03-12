# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/banshee/banshee-1.5.4.ebuild,v 1.1 2010/02/25 06:16:11 ford_prefect Exp $

EAPI=2

inherit eutils mono gnome2-utils fdo-mime versionator

GVER=0.10.7

DESCRIPTION="Import, organize, play, and share your music using a simple and powerful interface."
HOMEPAGE="http://banshee-project.org"

#BANSHEE_V2=$(get_version_component_range 2)
#[[ $((${BANSHEE_V2} % 2)) -eq 0 ]] && RELTYPE=stable || RELTYPE=unstable
#SRC_URI="http://download.banshee-project.org/${PN}/${RELTYPE}/${PV}/${PN}-1-${PV}.tar.bz2"
#SRC_URI="http://download.banshee-project.org/${PN}/stable/${PV}/${PN}-1-${PV}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="+aac boo daap doc +encode +flac ipod karma +mad mtp podcast test +vorbis wikipedia youtube"

RDEPEND=">=dev-lang/mono-2.4.3
	gnome-base/gnome-settings-daemon
	x11-themes/gnome-icon-theme
	sys-apps/dbus
	>=dev-dotnet/gtk-sharp-2.12
	>=dev-dotnet/glade-sharp-2.12
	>=dev-dotnet/gconf-sharp-2.24.0
	>=dev-dotnet/gnome-sharp-2.24.0
	>=dev-dotnet/notify-sharp-0.4.0_pre20080912-r1
	>=media-libs/gstreamer-0.10.21-r3
	>=media-libs/gst-plugins-bad-${GVER}
	>=media-libs/gst-plugins-good-${GVER}
	>=media-libs/gst-plugins-ugly-${GVER}
	>=media-plugins/gst-plugins-alsa-${GVER}
	>=media-plugins/gst-plugins-gnomevfs-${GVER}
	>=media-plugins/gst-plugins-gconf-${GVER}
	|| (
		>=media-plugins/gst-plugins-cdparanoia-${GVER}
		>=media-plugins/gst-plugins-cdio-${GVER}
	)
	media-libs/musicbrainz:1
	>=dev-dotnet/dbus-glib-sharp-0.4.1
	>=dev-dotnet/dbus-sharp-0.6.1a
	>=dev-dotnet/mono-addins-0.4[gtk]
	>=dev-dotnet/taglib-sharp-2.0.3.5
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
	)
	encode? (
		>=media-plugins/gst-plugins-lame-${GVER}
		>=media-plugins/gst-plugins-taglib-${GVER}
	)
	flac? (
		>=media-plugins/gst-plugins-flac-${GVER}
	)
	ipod? (
		>=dev-dotnet/ipod-sharp-0.8.5
	)
	mad? (
		>=media-plugins/gst-plugins-mad-${GVER}
	)
	mtp? (
		media-libs/libmtp
	)
	vorbis? (
		>=media-plugins/gst-plugins-ogg-${GVER}
		>=media-plugins/gst-plugins-vorbis-${GVER}
	)
	wikipedia? (
		>=dev-dotnet/webkit-sharp-0.2
	)
	youtube? (
		dev-dotnet/google-gdata-sharp
	)"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"
