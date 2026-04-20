# Maintainer: Daniel <limalinux>
pkgname=limalinux_calamares_config
_pkgname=limalinux_calamares_config
pkgver=26.04
pkgrel=1
pkgdesc="LimaLinux Calamares configuration, branding and native software selection"
arch=('any')
url="https://github.com/limalinuxos/${_pkgname}"
license=('GPL3')
depends=('calamares-limalinux') 
options=(!strip !emptydirs)

# We leave source empty but use the local files during packaging
source=()
sha256sums=()

package() {
    # We use $startdir which refers to the directory where the PKGBUILD is located.
    # This makes the script portable and professional for Git repositories.
    
    echo "==> Packaging files from: $startdir"

    # 1. System configuration (/etc)
    if [ -d "${startdir}/etc" ]; then
        echo "  -> Copying /etc files..."
        install -d "${pkgdir}/etc"
        cp -ra "${startdir}/etc/"* "${pkgdir}/etc/" [cite: 2]
    fi

    # 2. Binaries and system files (/usr)
    if [ -d "${startdir}/usr" ]; then
        echo "  -> Copying /usr files..."
        install -d "${pkgdir}/usr"
        cp -ra "${startdir}/usr/"* "${pkgdir}/usr/" [cite: 3]
    fi

    # 3. Set execution permissions for custom scripts
    if [ -d "${pkgdir}/usr/local/bin" ]; then
        echo "  -> Setting execution permissions in /usr/local/bin..."
        chmod +x "${pkgdir}/usr/local/bin/"* [cite: 4]
    fi
    
    # 4. Set correct permissions for Calamares python modules
    if [ -d "${pkgdir}/usr/lib/calamares/modules" ]; then
        echo "  -> Setting permissions for Calamares modules..."
        chmod -R 755 "${pkgdir}/usr/lib/calamares/modules/"* [cite: 5]
    fi

    # 5. Cleanup build files to avoid self-inclusion
    rm -rf "${pkgdir}/etc/calamares/pkgbuild" 2>/dev/null || true
    rm -f "${pkgdir}/etc/calamares/PKGBUILD" 2>/dev/null || true
}
