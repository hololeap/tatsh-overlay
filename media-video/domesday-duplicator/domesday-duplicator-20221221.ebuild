# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake desktop

DESCRIPTION="Software for the 40Mhz USB-3.0 RF sampler (harrypm fork)."
HOMEPAGE="https://github.com/simoninns/DomesdayDuplicator"
SHA="023a29a4f19b180f7ddfcf1be2f364cc6915d8a4"
MY_PN="DomesdayDuplicator"
SRC_URI="https://github.com/simoninns/${MY_PN}/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/qcustomplot
	dev-qt/qtmultimedia:5
	dev-qt/qtserialport:5
	dev-qt/qtwidgets:5
	dev-qt/qtgui:5
	dev-qt/qtcore:5
	virtual/libusb:1"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${MY_PN}-${SHA}/Linux-Application"
