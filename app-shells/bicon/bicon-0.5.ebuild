# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="BiCon - The Bidirectional Console"
HOMEPAGE="https://github.com/behdad/bicon"
SRC_URI="${HOMEPAGE}/releases/download/${PV}/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${COMMON}"
BUILD_PARAMS=""

pkg_setup() {
	export DISTCC_DISABLE=1
	export CCACHE_DISABLE=1

	BUILD_TARGETS="all"
}

src_prepare() {
	./autogen.sh
	./configure
	default
}

src_compile() {
	emake
}

src_install() {
	default
}
