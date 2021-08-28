# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A posix script to find and watch youtube videos from the terminal. (Without API)"
HOMEPAGE="https://github.com/pystardust/ytfzf"
SRC_URI="https://github.com/pystardust/ytfzf/archive/refs/tags/v${PV}.tar.gz"

KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="+fzf thumbnail"

RDEPEND="
app-misc/jq
media-video/mpv
net-misc/youtube-dl
x11-libs/libnotify
fzf? ( app-shells/fzf )
thumbnail? ( media-gfx/ueberzug )
"

S="${WORKDIR}"

DOCS=( README.md docs/conf.sh docs/INSTALL.md docs/USAGE.md )

src_compile() {
	rm Makefile
}

src_install() {
	dobin ytfzf
	einstalldocs
}
