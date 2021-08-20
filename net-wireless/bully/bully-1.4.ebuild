# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="${PV}-00"

DESCRIPTION="Bully WPS Attack Tool "
HOMEPAGE="https://github.com/kimocoder/bully"
SRC_URI="https://github.com/kimocoder/bully/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3+ GPL-2 BSD"
KEYWORDS="amd64 ~arm64 x86"

DEPEND="net-libs/libpcap"

S="${WORKDIR}/${PN}-${MY_PV}/src"

src_install() {
	emake DESTDIR="${D}" prefix=/usr install
	dodoc "${S}/../README.md"
}
