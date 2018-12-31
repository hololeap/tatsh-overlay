# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="A powerful tool to check TSS signing status of various devices and firmwares."
HOMEPAGE="https://github.com/tihmstar/tsschecker"
MY_HASH="4339d71fb0ebb671aeda9061979dd5e7ab87f3d3"
JSSY_HASH="ba6256448344799247d2c858cf2db879e62043f6"
SRC_URI="https://github.com/tihmstar/tsschecker/archive/${MY_HASH}.tar.gz -> ${P}.tar.gz
https://github.com/tihmstar/jssy/archive/${JSSY_HASH}.tar.gz -> ${P}-jssy.tar.gz"

# jssy is MIT
LICENSE="LGPL-3 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libfragmentzip
	app-pda/libplist
	net-misc/curl
	dev-libs/openssl:0
	app-pda/libirecovery"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${MY_HASH}"

PATCHES=( "${FILESDIR}/saveblobs.patch" )

DOCS=( LICENSE README.md )

src_prepare() {
	default
	eautoreconf

	mkdir "${S}/external/jssy/jssy/"
	cp "${WORKDIR}/jssy-${JSSY_HASH}/jssy/"* "${S}/external/jssy/jssy/"
}

src_install() {
	default
	einstalldocs
	dobin saveblobs.sh
	insinto /usr/share/${PN}
	doins devices.txt
}
