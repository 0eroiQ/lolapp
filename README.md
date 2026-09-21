<p align="center">
  <img src="assets/logo.png" alt="LolPlusTV Logo" width="160"/>
</p>

<h1 align="center">LolPlusTV</h1>

<p align="center">
  <b>Películas y series en un solo lugar</b><br/>
  App multiplataforma (Mobile + Android TV) con catálogo TMDB, múltiples fuentes y reproductor integrado.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-E50914?style=flat-square" alt="version"/>
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=flat-square&logo=flutter" alt="flutter"/>
  <img src="https://img.shields.io/badge/Android-Mobile%20%7C%20TV-3DDC84?style=flat-square&logo=android" alt="android"/>
  <img src="https://img.shields.io/badge/license-Personal%20Use-lightgrey?style=flat-square" alt="license"/>
</p>

---

## Descripción

**LolPlusTV** es una aplicación Flutter orientada a descubrir y reproducir películas y series. Combina:

- Catálogo y metadatos de **TMDB** (pósteres, sinopsis, elenco, temporadas, recomendaciones).
- Varias **fuentes / scrapers** para listados y búsqueda.
- Múltiples **servidores de video** (extractores) con selección de calidad e idioma.
- Experiencia **móvil** y **Android TV** (navegación con mando / foco).
- Favoritos, historial, ver después, descargas y ajustes de reproducción.

> La app actúa como un **cliente / agregador de interfaces**. El contenido multimedia no se aloja ni se distribuye desde nuestros servidores.

---

## Capturas / Logo

Coloca tu logo en:

```text
assets/logo.png
```

Y (opcional) capturas en:

```text
docs/screenshots/
```

Ejemplo en el README:

```markdown
![Logo](assets/logo.png)
```

---

## Funciones principales

| Función | Descripción |
|--------|-------------|
| **Inicio (Home)** | Secciones de películas y series con TMDB |
| **Búsqueda** | Búsqueda por título (TMDB + fuentes) |
| **Descubrir** | Exploración por fuentes / catálogos externos |
| **Detalle de contenido** | Info, elenco, temporadas y episodios |
| **Servidores** | Lista de enlaces por idioma / calidad |
| **Reproductor** | Playback, subtítulos, calidad, siguiente episodio |
| **Favoritos** | Guardar títulos |
| **Historial** | Continuar viendo / progreso |
| **Descargas** | Gestión de descargas y reproductor local |
| **Ajustes** | Apariencia, caché, fuentes, player, actualizaciones |
| **Modo Mobile / TV** | Interfaz adaptada a teléfono y Android TV |
| **APIs personalizadas** | Soporte de APIs propias del usuario |

---

## Catálogos actuales (listado / home de fuentes)

Fuentes usadas para **listados y búsqueda** de contenido:

| ID | Nombre | Listado | Búsqueda |
|----|--------|---------|----------|
| `serieskao` | SeriesKao | Sí | Sí |
| `tioplus` | TioPlus | Sí | Sí |
| `cuevana` | Cuevana | Sí | Sí |
| `pelisplus` | PelisPlus | Sí | Sí |
| `cinehax` | CineHax | Sí | — |

Metadatos y catálogo principal de películas/series: **[TMDB](https://www.themoviedb.org/)**.

---

## Fuentes / servidores de reproducción actuales

Extractores registrados para obtener enlaces de reproducción:

| ID | Nombre | Badge |
|----|--------|-------|
| `embed69` | Embed69 | EMBED69 |
| `poseidon` | Poseidon | POSEIDON |
| `cuevana` | Cuevana | CUEVANA |
| `unlimplay` | Unlimplay | UNLIM |
| `cinesrc` | CineSRC | CINESRC |
| `cinecalidad` | Cinecalidad | CINE |
| `tioplus` | TioPlus | TIOPLUS |
| `fuegocine` | FuegoCine | FUEGO |
| `hackstore` | HackStore | HACK |
| `pelisplus` | PelisPlusHD | PELIS+ |
| `pelispedia` | Pelispedia | PEDIA |
| `seriesmetro` | SeriesMetro | METRO |
| `smartpelis` | SmartPelis | SMART |
| `customapi` | Mis APIs | API |

Las fuentes se pueden activar/desactivar desde **Ajustes → Fuentes**.

---

## Content and Source Policy

**LolPlusTV no aloja, sube ni distribuye archivos de video.**

- La aplicación solo muestra **metadatos** (títulos, imágenes, descripciones) y **enlaces** obtenidos de fuentes de terceros configuradas por el usuario o por el cliente.
- Los servidores y sitios de origen son **externos e independientes**. No controlamos su disponibilidad, legalidad ni contenido.
- El usuario es responsable de cumplir las leyes de su país respecto al acceso y uso de contenido en línea.
- Si eres titular de derechos y consideras que algún enlace o uso infringe tu propiedad intelectual, contacta al administrador del sitio de origen o abre un issue en este repositorio para revisar la integración de esa fuente.

**Uso permitido de esta app (software):**

- Uso personal / educativo.
- No se autoriza redistribuir builds modificados con marcas de terceros sin permiso.
- No se garantiza servicio continuo de ninguna fuente externa.

---

## Metadata Credits

Los datos de películas y series (títulos, sinopsis, pósteres, backdrops, elenco, etc.) se obtienen de:

<p align="center">
  <a href="https://www.themoviedb.org/">
    <img src="https://www.themoviedb.org/assets/2/v4/logos/v2/blue_short-8e7b30f73a4020692ccca9c88fe984d149ef0a8118227d1e93b0dc07f6b8b839.svg" alt="TMDB" width="200"/>
  </a>
</p>

> This product uses the TMDB API but is not endorsed or certified by TMDB.

- **API:** [The Movie Database (TMDB)](https://www.themoviedb.org/)
- **Imágenes:** rutas de póster/backdrop servidas por TMDB (`image.tmdb.org`)
- Las fuentes de listado/reproducción adicionales son sitios de terceros y mantienen sus propias marcas y políticas.

---

## Privacidad

- **No se requiere cuenta** de usuario en nuestros servidores para usar la app.
- Preferencias (modo mobile/tv, fuentes activas, favoritos, historial, etc.) se guardan **en el dispositivo** (SharedPreferences / almacenamiento local).
- La app realiza peticiones de red a:
  - API de TMDB (metadatos)
  - Fuentes/scrapers y servidores de video configurados
  - API propia de versiones/actualización (si está habilitada)
- **No vendemos datos personales.**
- No recopilamos de forma intencionada información sensible del usuario más allá de lo necesario para el funcionamiento local de la app.
- Recomendación: usa la app en redes de confianza y mantén actualizado el sistema.

Si en el futuro se añaden analíticas o servicios en la nube, se documentarán aquí.

---

## Licencia

```text
Uso personal. Todos los derechos del código de la aplicación reservados por el autor,
salvo las librerías de terceros (Flutter, plugins) que conservan sus propias licencias.

El contenido multimedia y las marcas de TMDB, fuentes y servidores pertenecen a sus
respectivos titulares. Esta aplicación no reclama propiedad sobre ese contenido.
```

Puedes cambiar este bloque por una licencia concreta (MIT, GPL, etc.) si publicas el código como open source.

---


---

## Mapa estructural de la aplicación

```text
lib/
├── main.dart                          # Entrada, splash, modo Mobile/TV, disclaimer
│
├── app/                               # Configuración global
│   ├── app.dart
│   ├── app_config.dart
│   ├── app_theme.dart
│   ├── app_constants.dart
│   ├── app_router.dart
│   └── app_lifecycle.dart
│
├── core/                              # Infraestructura compartida
│   ├── errors/                        # Excepciones de app, red, scraper, player...
│   ├── network/                       # HTTP, headers, caché de requests
│   ├── storage/                       # SharedPreferences, caché, storage
│   ├── utils/                         # Logger, URLs, HTML, fechas, platform
│   ├── constants/                     # versiones, sources, keys, player
│   └── result/                        # Success / Failure
│
├── domain/                            # Capa de negocio (modelos y contratos)
│   ├── models/
│   │   ├── content/                   # Movie, Series, Episode, Actor...
│   │   ├── source/                    # Source, capabilities, status
│   │   ├── server/                    # VideoServer, quality, subtitle
│   │   ├── player/                    # Playback state, progress, settings
│   │   ├── user/                      # Favorites, history, watch later
│   │   └── addon/                     # Addons / manifests
│   ├── repositories/                  # Interfaces (contratos)
│   └── services/                      # Contratos de servicios de dominio
│
├── data/                              # Implementaciones y datos externos
│   ├── datasources/
│   │   ├── remote/tmdb/               # API TMDB (home, search, discover...)
│   │   └── remote/sources/            # Custom API del usuario
│   ├── scrapers/
│   │   ├── base/                      # Base scrapers + registry
│   │   ├── home/                      # SeriesKao, Cuevana, TioPlus, PelisPlus...
│   │   ├── detail/                    # Detalle por fuente
│   │   └── servers/                   # Servidores por fuente
│   ├── extractors/
│   │   ├── hls/                       # HLS extractor / parser
│   │   └── providers/                 # Embed69, Poseidon, Cuevana, Cinecalidad...
│   ├── aggregators/                   # Agregación de fuentes y servidores
│   └── repositories/                  # Implementaciones de repositorios
│
├── features/                          # UI por funcionalidad
│   ├── home/                          # Inicio películas / series
│   ├── search/                        # Búsqueda
│   ├── discover/                      # Descubrir por fuentes
│   ├── content/                       # Página de detalle, elenco, temporadas
│   ├── servers/                       # Modal y precarga de servidores
│   ├── player/                        # Reproductor, calidad, subtítulos, TV
│   ├── downloads/                     # Descargas y player local
│   ├── favorites/                     # Favoritos
│   ├── history/                       # Historial
│   ├── profile/                       # Perfil (TV)
│   ├── settings/                      # Ajustes (apariencia, fuentes, player...)
│   └── addons/                        # Addons / APIs personalizadas
│
├── presentation/                      # Shells y UI compartida
│   ├── mobile/                        # mobile_shell (navegación móvil)
│   ├── tv/                            # tv_shell (navegación TV + foco)
│   └── shared/                        # Modales, widgets, loaders, errores
│
└── generated/                         # Código generado
```

### Flujo simplificado

```text
Usuario
  │
  ├─► presentation/ (Mobile o TV shell)
  │       │
  │       └─► features/ (Home, Search, Content, Player...)
  │               │
  │               ├─► domain/ (modelos y contratos)
  │               │
  │               └─► data/
  │                     ├─► TMDB (metadatos)
  │                     ├─► scrapers (catálogos)
  │                     └─► extractors (servidores de video)
  │
  └─► core/ (red, storage, utils, errores)
```


## Requisitos

- Flutter 3.x
- Android (teléfono / TV)
- Conexión a Internet

```bash
flutter pub get
flutter run
```

---

## Aviso legal (disclaimer)

Al usar LolPlusTV aceptas que:

1. Eres el único responsable del uso que hagas de la aplicación.
2. Los desarrolladores no se hacen responsables del contenido ofrecido por terceros.
3. La app puede dejar de funcionar si las fuentes externas cambian o se desactivan.

---

<p align="center">
  Hecho con Flutter · Mobile & Android TV
</p>
#   l o l a p p  
 #   l o l a p p  
 