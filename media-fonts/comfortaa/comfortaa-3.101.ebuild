# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

FONTDIR_BIN=( fonts/{O,T}TF )

inherit font

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Open-source font by Johan Aakerlund"
HOMEPAGE="https://github.com/googlefonts/${PN}"

SRC_URI="${HOMEPAGE}/archive/refs/tags/${PV}.zip -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"

S="${WORKDIR}/${P}/fonts/TTF"

FONT_S="${S}"
FONT_SUFFIX="ttf"
