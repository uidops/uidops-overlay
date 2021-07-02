# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

DESCRIPTION="ReatlTek 8821ce wifi driver"
HOMEPAGE="https://github.com/tomaspinho/rtl8821ce/"
EGIT_REPO_URI="https://github.com/tomaspinho/rtl8821ce.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kernel_linux"
RESTRICT="bindist"

COMMON="kernel_linux? ( >=sys-libs/glibc-2.6.1 )"

DEPEND="
	${COMMON}
	dev-util/pahole
	kernel_linux? (	virtual/linux-sources virtual/pkgconfig	)
	"

RDEPEND="${COMMON}"

REQUIRED_USE="kernel_linux"

PATCHES=( "${FILESDIR}"/use-correct-kernel.patch )
BUILD_PARAMS=""

pkg_setup() {
	export DISTCC_DISABLE=1
	export CCACHE_DISABLE=1

	linux-mod_pkg_setup
	export KVER="${KV_FULL}"

	MODULE_NAMES="8821ce(net/wireless)"
	BUILD_TARGETS="clean modules"
}

src_prepare() {
	if kernel_is lt 4 14 0 ; then
		eerror "You must build this against 4.14.0 or higher kernels."
	fi

	if linux_chkconfig_present CC_IS_CLANG; then
		ewarn "Warning: building ${PN} with a clang-built kernel is experimental."

		BUILD_PARAMS+=" CC=${CHOST}-clang"
		if linux_chkconfig_present LD_IS_LLD; then
			BUILD_PARAMS+=" LD=ld.lld"
			if linux_chkconfig_present LTO_CLANG_THIN; then
				BUILD_PARAMS+=" ldflags-y=--thinlto-cache-dir= LDFLAGS_MODULE=--thinlto-cache-dir="
			fi
		fi
	fi
	default
}

src_compile() {
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install

	# Make it load
	insinto /etc/modules-load.d/
	doins -r "${FILESDIR}/rtl8821ce.conf"
}

pkg_preinst() {
	linux-mod_pkg_preinst
}

pkg_postinst() {
	linux-mod_pkg_postinst
}

pkg_postrm() {
	linux-mod_pkg_postrm
}
