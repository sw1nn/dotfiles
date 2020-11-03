#!/bin/sh

set -euo pipefail

GNUPG_VERSION=${1:-2.2.23}
LIBGPG_ERROR_VERSION=1.39
LIBGCRYPT_VERSION=1.8.7
PINENTRY_VERSION=1.1.0

build_dir=$(mktemp -d)
prefix=${HOME}/.local

trap "rm -rf ${build_dir}" QUIT EXIT TERM

cd $build_dir

set -x

curl -fsSL https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${LIBGPG_ERROR_VERSION}.tar.bz2 | bunzip2 -c | tar x
curl -fsSL https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${LIBGCRYPT_VERSION}.tar.bz2 | bunzip2 -c | tar x
curl -fsSL https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${GNUPG_VERSION}.tar.bz2 | bunzip2 -c | tar x
curl -fsSL https://gnupg.org/ftp/gcrypt/pinentry/pinentry-${PINENTRY_VERSION}.tar.bz2 | bunzip2 -c | tar x
for d in  libgpg-error-${LIBGPG_ERROR_VERSION} libgcrypt-${LIBGCRYPT_VERSION} ; do
( 
cd $d

./configure --prefix=${prefix}
make
make install
)
done

cd gnupg-${GNUPG_VERSION} 
for e in "" "--enable-gpg-is-gpg2"; do
./configure $e --prefix=${prefix}
make
make install
done

cd pinentry-${PINENTRY_VERSION}
./configure --prefix=${prefix} --enable-inside-emacs --enable-pinentry-emacs
make
make install

