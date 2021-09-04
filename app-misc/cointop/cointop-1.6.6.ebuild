# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="A fast and lightweight interactive terminal based UI application for tracking cryptocurrencies"
HOMEPAGE="https://github.com/miguelmota/cointop"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

src_compile() {
        export -n GOCACHE XDG_CACHE_HOME
        go build -o bin/cointop main.go || die "build failed"
}

src_test() {
        go test -work ./... || die "test failed"
}

src_install() {
        einstalldocs
        dobin bin/cointop
}

