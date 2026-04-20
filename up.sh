#!/bin/bash
set -eo pipefail

################################################################################
# LIMALINUX - UP SCRIPT (CALAMARES CONFIG)
################################################################################

# --- Colores ---
info=$(tput setaf 6)
success=$(tput setaf 2)
warning=$(tput setaf 3)
error=$(tput setaf 1)
reset=$(tput sgr0)

# --- Variables de Ruta (Profesionales usando $HOME) ---
source_base="$HOME/limalinuxos/limalinux_pkgbuild"

# CAMBIO AQUÍ: El nombre de la carpeta de tu binario ahora es limalinux-calamares
dir="limalinux-calamares" 

# Destino dentro de tu repo de configuración (donde Kiro guarda el respaldo)
destiny="$HOME/limalinuxos/limalinux_calamares_config/etc/calamares/pkgbuild"

echo "${info}Sincronizando archivos desde: $source_base/$dir${reset}"

# 1. Limpieza y preparación del destino
if [ -d "$destiny" ]; then
    rm -rf "$destiny"
fi
mkdir -p "$destiny"

# 2. Sincronización
if [ -d "$source_base/$dir" ]; then
    # Copiamos todo menos las carpetas de compilación pesadas (pkg/src/calamares)
    rsync -av --exclude='pkg/' --exclude='src/' --exclude='calamares/' \
        "$source_base/$dir/" "$destiny/"
    echo "${success}Sincronización completada.${reset}"
else
    echo "${error}Error: No se encontró la carpeta $dir en $source_base${reset}"
    exit 1
fi

# 3. Operaciones de Git (Sube tu configuración de LimaLinux a Codeberg/GitHub)
echo "${info}Subiendo cambios al repositorio de configuración...${reset}"
git add --all .
git commit -m "update: sync with $dir - $(date +'%Y-%m-%d %H:%M')" || echo "Nada para hacer commit"

branch=$(git rev-parse --abbrev-ref HEAD)
git push -u origin "$branch"

echo "${success}##############################################################"
echo "### Lanzamiento de configuración finalizado con éxito"
echo "##############################################################${reset}"
