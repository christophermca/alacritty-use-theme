# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname='alacritty-use-theme'
pkgver=VERSION
pkgrel=1
pkgdesc="Small utility to switch the selected theme used by alacritty terminal."
arch=('x86_64')
url="https://github.com/christophermca/alacritty-use-theme"
license=('GPL')
depends=('alacritty')
makedepends=('git')
source=("$pkgname::git://github.com/christophermca/alacritty-use-theme.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
	install -Dm755 ./.local/alacritty "$pkgdir/usr/local/alacritty/"
  install -Dm755 ./.local/share/alacritty "$pkgdir/usr/local/share/alacritty"

}
