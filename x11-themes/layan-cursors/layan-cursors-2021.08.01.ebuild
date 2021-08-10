# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Layan-cursors"
HOMEPAGE="https://github.com/vinceliuice/Layan-cursors"

MY_P=${PN}-$(ver_rs 0 -)-$(ver_rs 1 -)-$(ver_rs 2 -)

SRC_URI="${HOMEPAGE}/archive/refs/tags/2021-08-01.tar.gz"

KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_install() {
        insinto /usr/share/icons/Layan-cursors
        doins "dist/"

		insinto /usr/share/icons/Layan-border-cursors
		ddoins "dist-border/"

		insinto /usr/share/icons/Layan-white-cursors
		ddoins "dist-white/"
}

