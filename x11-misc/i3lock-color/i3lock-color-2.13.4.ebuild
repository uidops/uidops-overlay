# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs autotools

MY_PV=$(ver_cut 1-2).c.$(ver_cut 3)

DESCRIPTION="A modern version of i3lock with color functionality and other features."
HOMEPAGE="https://github.com/chrjguill/i3lock-color"
LICENSE="BSD"
KEYWORDS="~amd64"
SRC_URI="${HOMEPAGE}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"

RDEPEND=">=x11-libs/libxkbcommon-0.5.0[X]
	media-libs/libjpeg-turbo
	dev-libs/libev
	sys-libs/pam
	x11-libs/cairo[X,xcb(+)]
	x11-libs/libxcb[xkb]
	x11-libs/xcb-util
	x11-libs/xcb-util-image
	x11-libs/xcb-util-xrm
	!x11-misc/i3lock"

DEPEND="${RDEPEND}"
DOCS=( CHANGELOG README.md )

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	default
	eautoreconf
}
