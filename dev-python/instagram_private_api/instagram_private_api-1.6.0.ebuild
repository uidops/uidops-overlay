# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="threads(+)"
inherit distutils-r1

DESCRIPTION="A Python library to access Instagram's private API"
HOMEPAGE="https://github.com/ipython/ipykernel"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.0.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 ~ppc ppc64 ~riscv ~sparc x86"
IUSE=""

RDEPEND=""

src_prepare() {
        sed \
                -e 's:--cov=wheel::g' \
                -i setup.cfg || die
        distutils-r1_src_prepare
}

