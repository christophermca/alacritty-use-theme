# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname='alacritty-use-theme'
pkgver=r11.9a590c7
pkgrel=1
pkgdesc="Small utility to switch the selected theme used by alacritty terminal."
arch=('x86_64')
url="https://github.com/christophermca/alacritty-use-theme"
license=('GPL')
depends=('alacritty>=0.13.0')
makedepends=('git')
source=("git+https://github.com/christophermca/alacritty-use-theme.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 $srcdir/$pkgname/.local/share/alacritty/use-theme.sh "$pkgdir/usr/local/bin/alacritty/use-theme.sh"
  install -Dm755 $srcdir/$pkgname/.local/share/alacritty/selected.toml.DEFAULT "$pkgdir/usr/share/alacritty/selected.toml.DEFAULT"
}
