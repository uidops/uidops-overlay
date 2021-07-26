# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="An integrated platform for performing security testing of web applications (free edition)"
HOMEPAGE="https://portswigger.net/burp/"

MY_P="burpsuite_community_v${PV}.jar"
SRC_URI="https://portswigger.net/burp/releases/download?product=community&version=${PV}&type=Jar -> ${MY_P}"

KEYWORDS="~amd64 ~x86"

LICENSE="BURP"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-11"

S=${WORKDIR}

src_unpack() {
	cp "${DISTDIR}/${A}" "${S}"
}

src_install() {
	dosbin "${FILESDIR}"/burpsuite "/usr/bin/burpsuite"

	dodir "/opt/burpsuite"
	doins "${MY_P}" "/opt/burpsuite/"
	dosym /opt/burpsuite/"${MY_P}" /opt/burpsuite/burpsuite.jar

	domenu "${FILESDIR}"/burpsuite.desktop
	doicon "${FILESDIR}"/burpsuite.png
}
