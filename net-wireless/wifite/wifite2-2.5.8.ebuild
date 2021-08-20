# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Rewrite of the popular wireless network auditor, 'wifite'"
HOMEPAGE="https://github.com/kimocoder/wifite2"

SRC_URI="https://github.com/kimocoder/wifite2/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"
S="${WORKDIR}/${P}"

LICENSE="GPL-2"
SLOT="2"
IUSE="dict opencl extra"

DEPEND=""
RDEPEND=""
PDEPEND="net-wireless/aircrack-ng[${PYTHON_USEDEP}]
		net-wireless/hcxdumptool
		net-wireless/hcxtools
		amd64? ( opencl? ( app-crypt/hashcat ) )
		dict? ( sys-apps/cracklib-words )
		extra? ( net-analyzer/wireshark
                net-wireless/reaver-wps-fork-t6x
                !net-wireless/reaver
                net-wireless/bully
                net-wireless/cowpatty
                net-analyzer/macchanger
        )"


