# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby26 ruby27"

inherit ruby-fakegem

DESCRIPTION="OptionParser lib in ruby"
HOMEPAGE="https://rubygems.org/gems/opt_parse_validator"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RESTRICT="test"

ruby_add_rdepend "dev-ruby/activesupport:*
	>=dev-ruby/addressable-2.5.2"

