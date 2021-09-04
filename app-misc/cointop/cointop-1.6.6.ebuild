# Copyright 1999-2021 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/BurntSushi/toml v0.3.1/go.mod"

	"github.com/Knetic/govaluate v3.0.0+incompatible"
	"github.com/Knetic/govaluate v3.0.0+incompatible/go.mod"

	"github.com/acarl005/stripansi v0.0.0-20180116102854-5a71ef0e047d"
	"github.com/acarl005/stripansi v0.0.0-20180116102854-5a71ef0e047d/go.mod"

	"github.com/anaskhan96/soup v1.1.1"
	"github.com/anaskhan96/soup v1.1.1/go.mod"

	"github.com/anmitsu/go-shlex v0.0.0-20200514113438-38f4b401e2be"
	"github.com/anmitsu/go-shlex v0.0.0-20200514113438-38f4b401e2be/go.mod"

	"github.com/creack/pty v1.1.11"
	"github.com/creack/pty v1.1.11/go.mod"

	"github.com/fatih/color v1.9.0"
    "github.com/fatih/color v1.9.0/go.mod"

    "github.com/gen2brain/beeep v0.0.0-20200526185328-e9c15c258e28"
    "github.com/gen2brain/beeep v0.0.0-20200526185328-e9c15c258e28/go.mod"

	"github.com/gliderlabs/ssh v0.3.0"
    "github.com/gliderlabs/ssh v0.3.0/go.mod"

	"github.com/maruel/panicparse v1.5.0"
    "github.com/maruel/panicparse v1.5.0/go.mod"

	"github.com/mattn/go-colorable v0.1.7"
    "github.com/mattn/go-isatty v0.0.12"
    "github.com/mattn/go-isatty v0.0.12/go.mod"

	"github.com/mattn/go-runewidth v0.0.9"
    "github.com/mattn/go-runewidth v0.0.9/go.mod"

	"github.com/miguelmota/go-coinmarketcap v0.1.7"
    "github.com/miguelmota/go-coinmarketcap v0.1.7/go.mod"

	"github.com/miguelmota/gocui v0.4.2"
    "github.com/miguelmota/gocui v0.4.2/go.mod"

	"github.com/miguelmota/termbox-go v0.0.0-20191229070316-58d4fcbce2a7"
    "github.com/miguelmota/termbox-go v0.0.0-20191229070316-58d4fcbce2a7/go.mod"

	"github.com/mitchellh/go-wordwrap v1.0.0"
    "github.com/mitchellh/go-wordwrap v1.0.0/go.mod"

	"github.com/olekukonko/tablewriter v0.0.4"
    "github.com/olekukonko/tablewriter v0.0.4/go.mod"

	"github.com/patrickmn/go-cache v2.1.0+incompatible"
    "github.com/patrickmn/go-cache v2.1.0+incompatible/go.mod"

	"github.com/spf13/cobra v1.0.0"
    "github.com/spf13/cobra v1.0.0/go.mod"

	"github.com/spf13/pflag v1.0.5"
    "github.com/spf13/pflag v1.0.5/go.mod"

	"github.com/tomnomnom/xtermcolor v0.0.0-20160428124646-b78803f00a7e"
    "github.com/tomnomnom/xtermcolor v0.0.0-20160428124646-b78803f00a7e/go.mod"

	"golang.org/x/crypto v0.0.0-20200728195943-123391ffb6de"
    "golang.org/x/crypto v0.0.0-20200728195943-123391ffb6de/go.mod"

	"golang.org/x/net v0.0.0-20200707034311-ab3426394381"
    "golang.org/x/net v0.0.0-20200707034311-ab3426394381/go.mod"

	"golang.org/x/sys v0.0.0-20200810151505-1b9f1253b3ed"
    "golang.org/x/sys v0.0.0-20200810151505-1b9f1253b3ed/go.mod"

	"golang.org/x/text v0.3.3"
    "golang.org/x/text v0.3.3/go.mod"
)

go-module_set_globals

DESCRIPTION="A fast and lightweight interactive terminal based UI application for tracking cryptocurrencies"
HOMEPAGE="https://cointop.sh"
SRC_URI="https://github.com/miguelmota/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

S="${WORKDIR}/${PN}-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

src_compile() {
	go build -o ${PN} . || die
}

src_install() {
	dobin ${PN}
}

