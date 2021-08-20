# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1
DISTUTILS_SINGLE_IMPL=1

DESCRIPTION="A Python library to access Instagram's private API"
HOMEPAGE="https://github.com/ping/instagram_private_api"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.0.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 ~ppc ppc64 ~riscv ~sparc x86"
IUSE=""

RDEPEND=""

S="${S}.0"

python_prepare_all() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

    distutils-r1_python_prepare_all
}

python_install_all() {
    DOCS=( README.md )

    distutils-r1_python_install_all
}
