# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A tool for reengineering 3rd party, closed, binary Android apps"
HOMEPAGE="https://ibotpeaches.github.io/Apktool/"
SRC_URI="https://bitbucket.org/iBotPeaches/apktool/downloads/${PN}_${PV}.jar -> ${P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="tools"

DEPEND=""
RDEPEND="|| ( dev-java/icedtea-bin )
	tools? ( dev-util/android-sdk-build-tools )"

S="${WORKDIR}"

src_unpack() {
	dodir "${S}"
	cp -L "${DISTDIR}/${A}" "${S}/${PN}.jar" || die
}

src_install() {
	dobin "${FILESDIR}/apktool"

	insinto "/opt/${PN}/"
	doins apktool.jar
}
