# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-utils-2

DESCRIPTION="Android Dex to Java Decompiler"
HOMEPAGE="https://github.com/skylot/jadx"
SRC_URI="https://github.com/skylot/${PN}/releases/download/v${PV}/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S=${WORKDIR}

src_install() {
	insinto /opt/jadx/lib/
	doins "${S}"/lib/*
	java-pkg_regjar "${D}"/opt/jadx/lib/*.jar
	java-pkg_dolauncher ${PN} --main jadx.cli.JadxCLI
	java-pkg_dolauncher ${PN}-gui --main jadx.gui.JadxGUI
}

