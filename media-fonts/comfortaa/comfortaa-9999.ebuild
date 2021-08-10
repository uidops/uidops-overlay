# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 font

FONTDIR_BIN=( fonts/{O,T}TF )

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Open-source font by Johan Aakerlund"
HOMEPAGE="https://github.com/googlefonts/${PN}"

EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="OFL-1.1"
SLOT="0"

S="${WORKDIR}/${PN}/fonts/TTF"

FONT_S="${S}"
FONT_SUFFIX="ttf"
