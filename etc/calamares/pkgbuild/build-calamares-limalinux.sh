#!/bin/bash
set -euo pipefail

# --- Configuración de rutas (Profesional) ---
# Usamos $HOME para que funcione en cualquier equipo
BASE_DIR="$HOME/limalinuxos"
REPO_DIR="$BASE_DIR/limalinux_repo/x86_64"
PKG_NAME="calamares-limalinux"

# --- Colores ---
cyan=$(tput setaf 6)
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)

echo "${cyan}################################################################"
echo "#########    Building: $PKG_NAME"
echo "################################################################${reset}"

# 1. Validar que estamos en la carpeta correcta
if [ ! -f "PKGBUILD" ]; then
    echo "${red}Error: No se encontró el PKGBUILD en esta carpeta.${reset}"
    exit 1
fi

# 2. Sincronizar sumas de control
echo "${cyan}>> Updating checksums...${reset}"
updpkgsums

# 3. Compilar
echo "${cyan}>> Starting makepkg...${reset}"
# -s instala dependencias, -c limpia después, -f fuerza el build
if makepkg -scf --noconfirm; then
    echo "${green}>> Build successful!${reset}"
else
    echo "${red}>> Build failed.${reset}"
    exit 1
fi

# 4. Gestión del Repositorio Local
echo "${cyan}>> Managing Repository...${reset}"
mkdir -p "$REPO_DIR"

# Mover el paquete generado
# Buscamos archivos que empiecen por calamares-limalinux
if ls ${PKG_NAME}*.pkg.tar.zst 1> /dev/null 2>&1; then
    echo "Moving package to $REPO_DIR"
    mv ${PKG_NAME}*.pkg.tar.zst "$REPO_DIR/"
    
    # 5. Actualizar la base de datos del repositorio automáticamente
    echo "${cyan}>> Updating repo database...${reset}"
    cd "$REPO_DIR"
    repo-add -n -R limalinux_repo.db.tar.gz *.pkg.tar.zst
    echo "${green}>> Database updated.${reset}"
else
    echo "${red}>> Error: Package not found after build.${reset}"
    exit 1
fi

echo "${green}################################################################"
echo "### PROCESS COMPLETE: $PKG_NAME is ready for the ISO"
echo "################################################################${reset}"
