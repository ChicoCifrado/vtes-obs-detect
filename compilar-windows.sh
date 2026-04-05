#!/bin/bash
# 🦞 VTES-Card-Scanner OBS Plugin - Compilar para Windows
# OBS Studio 32.x API
# Compilación con MinGW/GCC

set -e

echo "🦞 VTES-Card-Scanner OBS Plugin - Compilar para Windows"
echo "=========================================================="

# Verificar CMake
echo ""
echo "📋 Verificar CMakeLists.txt:"
ls -la CMakeLists.txt

# Verificar observables
echo ""
echo "📋 Archivos observables:"
ls -la obs_vtes_source.c obs_vtes_source.json CMakeLists.txt

# Verificar que no haya C++
echo ""
echo "📋 Verificar que es C puro:"
file obs_vtes_source.c

# Compilar con CMake
echo ""
echo "🚀 Compilar con MinGW:"
cd "$(dirname "$0")"
mingw64-cmake -B build -G "MinGW Makefiles"
mingw64-cmake --build build --config Release

# Instalar en OBS
echo ""
echo "📦 Instalar en OBS:"
copy "build\obs_vtes_source.dll" "C:\Users\%.USERNAME%\.config\obs-studio\plugins\obs_vtes_source.dll"

echo ""
echo "✅ ¡Compilación completada!"
