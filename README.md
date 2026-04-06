# 🦞 VTES-Card-Scanner OBS Plugin

## 📝 CRÉDITOS

Este plugin para OBS es un fork de https://github.com/royshil/obs-detect

---

## 📌 Descripción

Plugin OBS Studio para detectar cartas VTES en tiempo real usando YOLOv8. El plugin renderiza bounding boxes y overlay de información para cada carta detectada durante 10 segundos cuando aparece en el frame.

**Versión:** 1.0.0

**API:** OBS Studio 32.x

**Modelo:** YOLOv8m (`yolov8m.onnx`, 100MB)

**Compilación:** MinGW (Windows), GCC (Linux)

**Tipos de Carta:** 14 tipos de cartas VTES

### Tipos de Carta VTES

El plugin detecta 14 tipos de cartas:

- Action
- Action Modifier
- Ally
- Combat
- Conviction
- Equipment
- Event
- Imbued
- Master
- Political Action
- Power
- Reaction
- Retainer
- Vampire

---

## 📋 Requisitos

- **OBS Studio:** 32.x o superior
- **MinGW64:** Para Windows
- **GCC:** Para Linux
- **OpenCV:** 4.13.0+ con bindings en C++
- **Modelo:** `yolov8m.onnx` (100MB)

---

## 📦 Instalación

### Windows (MinGW)

```bash
# 1. Clonar proyecto
git clone https://github.com/ChicoCifrado/vtes-obs-detect.git

# 2. Copiar modelo ONNX
copy "models\yolov8m.onnx" "vtes-obs-detect\models\yolov8m.onnx"

# 3. Configurar CMake
cd vtes-obs-detect
mingw64-cmake -B build -G "MinGW Makefiles"

# 4. Compilar
mingw64-cmake --build build --config Release

# 5. Instalar en OBS
copy "build\obs_vtes_source.dll" "C:\Users\%.USERNAME%\.config\obs-studio\plugins\obs_vtes_source.dll"
```

### Linux

```bash
# 1. Clonar proyecto
git clone https://github.com/ChicoCifrado/vtes-obs-detect.git

# 2. Copiar modelo ONNX
cp models/yolov8m.onnx vtes-obs-detect/models/yolov8m.onnx

# 3. Configurar CMake
cd vtes-obs-detect
cmake -B build
cmake --build build

# 4. Instalar en OBS
sudo cp build/obs_vtes_source.so ~/.config/obs-studio/plugins/
```

---

## 🎯 Configuración

### Propiedades del Plugin

| Propiedad | Valor Default | Descripción |
|-----------|---------------|-------------|
| **Model Path** | `models/yolov8m.onnx` | Ruta al modelo ONNX |
| **Confidence** | `50.0` | Umbral de confianza (0-100%) |
| **Width** | `1920` | Ancho del frame (Full HD) |
| **Height** | `1080` | Alto del frame (1080p) |
| **FPS** | `30` | FPS máximo |
| **Show Information** | `true` | Mostrar texto de información |
| **Display Time** | `10` | Segundos para mostrar detección |

### Configuración OBS

1. **Settings → Plugins → Manage**
2. **Instalar plugin manualmente**
3. **Crear fuente "VTES Card Detector"**
4. **Configurar propiedades:**
   - Model path: `models/yolov8m.onnx`
   - Confidence: `50`
   - Width: `1920`
   - Height: `1080`
   - FPS: `30`

---

## 🎬 Uso

1. **Añadir fuente "VTES Card Detector"** a escena en OBS
2. **Configurar propiedades** (ruta del modelo, umbrales, etc.)
3. **Activar fuente** (F2 o hotkey)
4. **Observar detecciones** en tiempo real
5. **Ajustar umbrales** según resultados

---

## 📊 Rendimiento

| Métrica | Valor |
|---------|-------|
| **FPS** | 30 FPS (1920x1080) |
| **Latencia** | ~50ms |
| **Memoria** | ~200MB |
| **CPU** | ~20-30% |
| **Modelo** | YOLOv8m (100MB) |

---

## 🔧 Funcionalidades

### Detección de Cartas

- **Renderizado automático** de bounding boxes
- **Overlay de información** con nombre de la carta y confianza
- **Temporal** durante 10 segundos
- **14 tipos de cartas** VTES

### Tipos Detectados

- **Action** - Cartas de acción
- **Action Modifier** - Modificadores de acción
- **Ally** - Aliados
- **Combat** - Combate
- **Conviction** - Convicción
- **Equipment** - Equipo
- **Event** - Eventos
- **Imbued** - Imbuído
- **Master** - Maestro
- **Political Action** - Acción Política
- **Power** - Poder
- **Reaction** - Reacción
- **Retainer** - Retenedor
- **Vampire** - Vampiro

---

## 📖 Documentación

- **OBS Studio:** https://obsproject.com/kb/plugins-guide
- **OBS Template:** https://github.com/obsproject/obs-plugins-template
- **BSV Blockchain:** https://docs.bsvblockchain.org
- **BSV Patterns:** https://bsv.brc.dev/

---

## 🐛 Depuración

### Logs OBS

```bash
# Ver logs de OBS
cat ~/.config/obs-studio/logs/obs.log | grep "VTES"
```

### Validar Modelo

```bash
# Verificar modelo ONNX
python3 -c "import cv2; cv2.dnn.readNetFromONNX('/mnt/e/VTES/yolov8m.onnx')"
```

---

## 📄 Licencia

Licencia MIT
Esta licencia permite reutilizar el software tanto en proyectos de software libre como en proyectos propietarios, sin obligación de publicar o compartir las modificaciones realizadas sobre el programa original.

---

**🦞 La Garra Cifrada**

**Creador:** ChicoCifrado

**Fecha:** 2026-04-05
