pkgname=limalinux_calamares_config
pkgver=$(date +%Y.%m.%d)
pkgrel=1
pkgdesc="LimaLinux Calamares configuration and autostart"
arch=('any')
depends=('calamares-limalinux')

package() {
    # Crear el directorio raíz en el entorno del paquete
    install -d "$pkgdir/etc"

    # Copiar TODOS los archivos incluyendo ocultos usando la sintaxis del punto
    cp -ra "$startdir/etc/." "$pkgdir/etc/"

    # Establecer permisos correctos para settings y módulos
    find "$pkgdir/etc/calamares" -type f -exec chmod 644 {} +
    find "$pkgdir/etc/calamares" -type d -exec chmod 755 {} +

    # Evitar conflicto con el paquete oficial gdm:
    # /etc/gdm/custom.conf ya pertenece a 'gdm'.
    rm -f "$pkgdir/etc/gdm/custom.conf"

    # Asegurar que el autostart sea ejecutable
    if [ -f "$pkgdir/etc/skel/.config/autostart/calamares.desktop" ]; then
        chmod +x "$pkgdir/etc/skel/.config/autostart/calamares.desktop"
    fi

    # Copiar directorio usr/ si existe (assets, scripts, etc.)
    if [ -d "$startdir/usr" ]; then
        install -d "$pkgdir/usr"
        cp -ra "$startdir/usr/." "$pkgdir/usr/"
    fi
}
