<div align="center">
<img src="assets/logo.png" alt="LolPlusTV Logo" width="180"/>

LolPlusTV

Movies and TV Shows in One Place

A cross-platform application developed with Flutter for mobile devices and Android TV, featuring a TMDB-based catalog, multiple sources, addons, and an integrated media player.

<br/>
</div>

⸻

📑 Contents

* Description
* Features
* Platforms
* Architecture
* Catalogs
* Servers
* Addon System
* Interface
* TMDB
* Privacy
* Content Policy
* Installation
* Project Structure
* License
* Legal Notice

⸻

🎬 Description

LolPlusTV is a Flutter application designed for discovering and playing movies and TV shows.

The application combines different services to provide a centralized experience:

┌─────────────────────────────────────────────┐
│                  LolPlusTV                  │
├─────────────────────────────────────────────┤
│                                             │
│  TMDB                                       │
│  └── Metadata                               │
│      ├── Movies                             │
│      ├── TV Shows                           │
│      ├── Actors                             │
│      ├── Seasons                            │
│      └── Recommendations                    │
│                                             │
│  Sources                                    │
│  └── Catalogs                               │
│      ├── Search                             │
│      ├── Listings                           │
│      └── Details                            │
│                                             │
│  Servers                                    │
│  └── Playback Links                         │
│      ├── Languages                          │
│      ├── Quality                            │
│      └── Subtitles                          │
│                                             │
│  Player                                     │
│  └── Playback                               │
│                                             │
└─────────────────────────────────────────────┘

The application functions as a client/aggregator for external interfaces and services.

Media content is not hosted or distributed directly from LolPlusTV servers.

⸻

✨ Features

Feature	Description
🏠 Home	Movies and TV shows organized into different sections
🔎 Search	Search using TMDB and external sources
🧭 Discover	Browse available catalogs
🎬 Details	Information, cast, seasons, and episodes
🌐 Servers	Multiple playback servers
▶️ Player	Integrated media playback
💬 Subtitles	Subtitle support when available
❤️ Favorites	Local content favorites
🕐 History	Playback history and progress tracking
📺 Android TV	Interface optimized for remote and focus navigation
📱 Mobile	Interface adapted for mobile devices
⬇️ Downloads	Management of downloaded/local content
⚙️ Settings	General application configuration
🧩 Addons	Extensible source and catalog system
🎨 Themes	Ability to select different interface styles
🔌 Custom APIs	Integration with external APIs configured by the user

⸻

📱 Platforms

The project is currently designed for:

Android Mobile

Interface adapted for:

* phones
* different screen sizes
* touch navigation
* portrait/landscape orientation

Android TV

Interface adapted for:

* televisions
* Android TV
* Google TV
* remote controls
* focus-based navigation
* D-Pad navigation

The application maintains a shared architecture while using different presentation shells:

                    LolPlusTV
                       │
             ┌─────────┴─────────┐
             │                   │
          Mobile                TV
             │                   │
      Mobile Shell          TV Shell
             │                   │
             └─────────┬─────────┘
                       │
                    Features
                       │
              ┌────────┴────────┐
              │                 │
           Domain             Data

⸻

🧩 Addon System

LolPlusTV is designed to work with an extensible addon system.

There are two main types:

1. Sources

Sources provide access to:

* catalogs
* searches
* details
* episodes
* servers
* additional information

2. Catalogs

Catalogs allow new content lists or sections to be added.

The conceptual relationship is:

                    ADDONS
                       │
             ┌─────────┴─────────┐
             │                   │
          SOURCES              CATALOGS
             │                   │
             │                   │
             └───────┬───────────┘
                     │
                   Content
                     │
              Movies / TV Shows

When the user wants to add a catalog, they must first:

Select an existing source
              │
              ▼
       Select catalog

or:

Create / add a new source
              │
              ▼
       Select catalog

This allows the system to maintain a clear relationship between source → catalog → content.

⸻

🎨 Interface and Themes

LolPlusTV is designed to allow users to select the visual style of the application.

Conceptually:

Settings
   │
   └── Appearance
          │
          ├── Theme
          ├── Interface Style
          ├── Colors
          ├── Card Size
          └── Navigation

Styles can modify elements such as:

* cards
* navigation
* colors
* borders
* corner radii
* sizes
* layout
* information density
* interface behavior

The goal is to separate:

Business Logic
        ≠
Visual Design

so that the application’s appearance can be changed without rewriting its core functionality.

⸻

🌐 Current Catalogs

Sources currently used for listings and searches:

ID	Name	Listings	Search
serieskao	SeriesKao	✅	✅
tioplus	TioPlus	✅	✅
cuevana	Cuevana	✅	✅
pelisplus	PelisPlus	✅	✅
cinehax	CineHax	✅	—

Primary Metadata

Primary movie and TV show metadata is obtained through TMDB.

This allows descriptive content information to remain separate from external sources.

⸻

▶️ Playback Servers

Extractors/providers currently registered:

ID	Name	Identifier
embed69	Embed69	EMBED69
poseidon	Poseidon	POSEIDON
cuevana	Cuevana	CUEVANA
unlimplay	Unlimplay	UNLIM
cinesrc	CineSRC	CINESRC
cinecalidad	Cinecalidad	CINE
tioplus	TioPlus	TIOPLUS
fuegocine	FuegoCine	FUEGO
hackstore	HackStore	HACK
pelisplus	PelisPlusHD	PELIS+
pelispedia	Pelispedia	PEDIA
seriesmetro	SeriesMetro	METRO
smartpelis	SmartPelis	SMART
customapi	My APIs	API

Providers can be enabled or disabled from:

Settings
   └── Sources
        └── Servers

⸻

🏗️ Architecture

The application uses a layered architecture.

┌──────────────────────────────────────┐
│             PRESENTATION             │
│        Mobile / TV / Shared          │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│              FEATURES                │
│ Home · Search · Content · Player     │
│ Settings · Addons · Favorites        │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│               DOMAIN                 │
│ Models · Repositories · Services     │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│                DATA                  │
│ TMDB · Sources · Scrapers · APIs     │
│ Extractors · Aggregators             │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│                CORE                  │
│ Network · Storage · Errors · Utils   │
└──────────────────────────────────────┘

Main Flow

User
   │
   ▼
Presentation
   │
   ▼
Feature
   │
   ▼
Domain
   │
   ▼
Repository
   │
   ▼
Data
   │
   ├── TMDB
   ├── Sources
   ├── Scrapers
   ├── APIs
   └── Extractors

⸻

📁 Project Structure

The main lib/ structure is organized as follows:

lib/
│
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── app_config.dart
│   ├── app_theme.dart
│   ├── app_constants.dart
│   ├── app_router.dart
│   └── app_lifecycle.dart
│
├── core/
│   ├── errors/
│   ├── network/
│   ├── storage/
│   ├── utils/
│   ├── constants/
│   └── result/
│
├── domain/
│   ├── models/
│   │   ├── content/
│   │   ├── source/
│   │   ├── server/
│   │   ├── player/
│   │   ├── user/
│   │   └── addon/
│   │
│   ├── repositories/
│   └── services/
│
├── data/
│   ├── datasources/
│   │   └── remote/
│   │       ├── tmdb/
│   │       └── sources/
│   │
│   ├── scrapers/
│   │   ├── base/
│   │   ├── home/
│   │   ├── detail/
│   │   └── servers/
│   │
│   ├── extractors/
│   │   ├── hls/
│   │   └── providers/
│   │
│   ├── aggregators/
│   └── repositories/
│
├── features/
│   ├── home/
│   ├── search/
│   ├── discover/
│   ├── content/
│   ├── servers/
│   ├── player/
│   ├── downloads/
│   ├── favorites/
│   ├── history/
│   ├── profile/
│   ├── settings/
│   └── addons/
│
├── presentation/
│   ├── mobile/
│   ├── tv/
│   └── shared/
│
└── generated/

Detailed documentation for each folder and file can be maintained in docs/ARCHITECTURE.md.

⸻

🔄 Playback Flow

The general playback flow is:

Content
   │
   ▼
TMDB
   │
   ▼
Details
   │
   ▼
Source
   │
   ▼
Server / Extractor
   │
   ▼
Playback Link
   │
   ▼
Player
   │
   ├── Quality
   ├── Language
   ├── Subtitles
   └── Progress

⸻

🎞️ TMDB

LolPlusTV uses The Movie Database (TMDB) to retrieve movie and TV show information.

It is used for data such as:

* titles
* original titles
* posters
* backdrops
* synopses
* genres
* cast
* seasons
* episodes
* recommendations
* TMDB identifiers

<p align="center">
  <a href="https://www.themoviedb.org/">
    <img src="assets/images/tmdb.png" alt="TMDB" width="180"/>
  </a>
</p>

This product uses the TMDB API but is not endorsed or certified by TMDB.

API: https://www.themoviedb.org/

Images are served through TMDB’s image infrastructure.

⸻

🔐 Privacy

LolPlusTV does not require its own account to use the application’s main features.

Preferences may be stored locally on the device.

Locally stored data may include:

* enabled sources
* favorites
* history
* progress
* playback preferences
* appearance
* application settings

The application may make requests to:

TMDB
  │
  ├── Metadata
  └── Images
External Sources
  │
  ├── Catalogs
  ├── Searches
  └── Information
Playback Services
  │
  └── Links / Servers
Update API
  │
  └── Versions

Personal data is not sold.

If analytics services, accounts, or cloud infrastructure are added in the future, they should be documented in this section.

⸻

⚖️ Content Policy

LolPlusTV does not directly host, upload, or distribute media files.

The application functions as a client for external services and may display:

* metadata
* images
* content information
* links provided by external sources

External sources are independent of the project.

LolPlusTV does not control:

* availability
* content
* policies
* operation
* legality of external services

Users must use the application in accordance with the laws applicable in their jurisdiction.

If you are a rights holder and believe an integration infringes your rights, you may contact the administrator of the relevant service or request a review of the integration.

⸻

🚀 Installation

Requirements

* Flutter 3.x
* Dart version compatible with Flutter
* Android SDK
* Android Mobile or Android TV
* Internet connection

Clone the Project

git clone <REPOSITORY_URL>
cd lolplustv

Install Dependencies

flutter pub get

Run

flutter run

Check the Environment

flutter doctor

⸻

🧪 Development

To analyze the project:

flutter analyze

To run tests:

flutter test

To check available devices:

flutter devices

⸻

📦 Build

APK

flutter build apk --release

App Bundle

flutter build appbundle --release

Android TV

The project can generate builds intended for Android TV devices using the corresponding Android project configuration.

⸻

📄 License

The project currently uses a personal-use license.

Personal use. All rights to the application source code
are reserved by the author, except for third-party libraries,
which retain their respective licenses.
Media content, trademarks, services, and data provided by
third parties belong to their respective owners.
The application does not claim ownership of such content.

If the project is later released as open source, this section may be replaced with a specific license such as MIT, GPL, or another license compatible with the dependencies used.

⸻

⚠️ Legal Notice

By using LolPlusTV:

1. The user is responsible for how they use the application.
2. External services are independent of the project.
3. External sources may change or stop working.
4. The project does not guarantee the availability of external services.
5. The user must comply with the laws applicable in their jurisdiction.

⸻

<div align="center">

🎬 LolPlusTV

Flutter · Mobile · Android TV

Made with Flutter ❤️

</div>
