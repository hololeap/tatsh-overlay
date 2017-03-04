# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="A pure git implementation of a sliding window memory map manager"
HOMEPAGE="
	https://pypi.python.org/pypi/smmap
	https://github.com/Byron/smmap"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}2/${PN}2-${PV}.tar.gz"
S="${WORKDIR}/${PN}2-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/nosexcover[${PYTHON_USEDEP}]
	)"
RDEPEND=""

python_test() {
	nosetests || die "tests failed under ${EPYTHON}"
}
