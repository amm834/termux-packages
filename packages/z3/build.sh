TERMUX_PKG_HOMEPAGE=https://github.com/Z3Prover/z3
TERMUX_PKG_DESCRIPTION="Z3 is a theorem prover from Microsoft Research."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_VERSION=4.8.9
TERMUX_PKG_SRCURL=https://github.com/Z3Prover/z3/archive/z3-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=c9fd04b9b33be74fffaac3ec2bc2c320d1a4cc32e395203c55126b12a14ff3f4
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
	chmod +x scripts/mk_make.py
	sed '1 s/^.#*$/\#\!\/usr\/bin\/env\ python3/g' -i scripts/mk_make.py
	CXX="$CXX" CC="$CC" scripts/mk_make.py --prefix=$TERMUX_PREFIX --build=$TERMUX_PKG_BUILDDIR
	sed 's/..\/..\/..\/..\/..\///g' -i Makefile
	sed 's/\-lpthread//g' -i config.mk
}
