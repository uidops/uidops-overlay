EAPI=7

inherit linux-mod toolchain-funcs

case ${PV} in
9999)
	inherit git-r3
	EGIT_REPO_URI="https://github.com/umlaeute/v4l2loopback.git"
	;;
*)
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/umlaeute/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	;;
esac

DESCRIPTION="v4l2 loopback device whose output is its own input"
HOMEPAGE="https://github.com/umlaeute/v4l2loopback"

LICENSE="GPL-2"
SLOT="0"
IUSE="examples"

CONFIG_CHECK="VIDEO_DEV"
MODULE_NAMES="v4l2loopback(video:)"
BUILD_TARGETS="all"

pkg_setup() {
	linux-mod_pkg_setup
	export KERNELRELEASE=${KV_FULL}
}

src_prepare() {
	default
	sed -i -e 's/gcc /$(CC) /' examples/Makefile || die
	BUILD_PARAMS=""
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

}

src_compile() {
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
	dosbin utils/v4l2loopback-ctl
	dodoc doc/kernel_debugging.txt
	dodoc doc/docs.txt
}
