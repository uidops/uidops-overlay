# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="BiCon - The Bidirectional Console"
HOMEPAGE="https://github.com/behdad/bicon"

EGIT_REPO_URI="${HOMEPAGE}.git"

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
