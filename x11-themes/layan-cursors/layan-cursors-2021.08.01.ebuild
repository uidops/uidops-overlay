# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Layan-cursors"
HOMEPAGE="https://github.com/vinceliuice/Layan-cursors"

MY_P="2021-08-01"

SRC_URI="${HOMEPAGE}/archive/refs/tags/${MY_P}.tar.gz -> layan.tar.gz"

KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/Layan-cursors-${MY_P}

src_install() {
        insinto /usr/share/icons/Layan-cursors
        dodir "${S}/dist/"

		insinto /usr/share/icons/Layan-border-cursors
		dodir "${S}/dist-border/"

		insinto /usr/share/icons/Layan-white-cursors
		dodir "${S}/dist-white/"
}

