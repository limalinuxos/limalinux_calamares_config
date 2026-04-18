#!/bin/bash
set -eo pipefail

################################################################################
# LIMALINUX - UP SCRIPT (CALAMARES CONFIG)
################################################################################
# Este script sincroniza el PKGBUILD de Calamares y sube los cambios a GitHub.
################################################################################

# --- Colores para la terminal ---
# tput setaf 6 = cyan, 2 = green, 3 = yellow, 1 = red
info=$(tput setaf 6)
success=$(tput setaf 2)
warning=$(tput setaf 3)
error=$(tput setaf 1)
reset=$(tput sgr0)

echo "${warning}Recuerda actualizar el PKGBUILD de Calamares si has hecho cambios en el código fuente.${reset}"
sleep 2

# --- Variables de Ruta (Adaptadas a tu estructura) ---
workdir=$(pwd)

# Carpeta donde tienes tus PKGBUILDs
source_base="$HOME/limalinuxos/limalinux_pkgbuild"

# Nombre de la carpeta específica del paquete de Calamares 
# (Asegúrate de que este nombre coincida con la carpeta real en limalinux_pkgbuild)
dir="calamares-3.3.14.r132.g841b478-3" 

# Destino dentro de este repositorio de configuración
destiny="$HOME/limalinuxos/limalinux_calamares_config/etc/calamares/pkgbuild"

################################################################################
# Sincronización de PKGBUILD
################################################################################

echo "${info}Sincronizando archivos desde limalinux_pkgbuild...${reset}"

# Limpieza y creación del destino
if [ -d "$destiny" ]; then
    rm -rf "$destiny"
fi
mkdir -p "$destiny"

# Verificamos si el origen existe antes de copiar
if [ -d "$source_base/$dir" ]; then
    cp -rv "$source_base/$dir/"* "$destiny"
    echo "${success}Sincronización completada.${reset}"
else
    echo "${error}Error: No se encontró el origen en $source_base/$dir${reset}"
    echo "Saltando copia de PKGBUILD..."
fi

################################################################################
# Operaciones de Git
################################################################################

echo "${info}Subiendo cambios a GitHub...${reset}"

# Añadir todos los cambios
git add --all .

# Commit con mensaje genérico (o puedes cambiarlo por algo más específico)
git commit -m "update calamares config and pkgbuild: $(date +'%Y-%m-%d %H:%M')" || echo "Nada para hacer commit"

# Detectar rama actual y hacer push
branch=$(git rev-parse --abbrev-ref HEAD)
git push -u origin "$branch"

echo
echo "${success}##############################################################"
echo "### $(basename "$0") finalizado con éxito"
echo "##############################################################${reset}"
echo
