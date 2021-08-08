# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 python3_9 python3_10 )

inherit distutils-r1 git-r3

DESCRIPTION="A command line utility which display images in X11 terminals"
HOMEPAGE="https://github.com/seebye/${PN}"

EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-3+"
SLOT="0"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/python-xlib[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	x11-libs/libXext
"
