# SpeakTree AAC

A custom Augmentative and Alternative Communication (AAC) application built by a dad for his kid.

## Overview

SpeechTree AAC is a Flutter-based AAC application designed to help individuals with speech and language difficulties communicate effectively.

## Project Structure

```
lib/
├── main.dart                    # App entry point with Hive initialization and ProviderScope
├── core/
│   ├── models/                  # Data models
│   │   ├── card_model.dart      # Communication card model
│   │   └── folder_model.dart    # Folder model for organization
│   └── services/                # Core services
│       ├── hive_service.dart    # Hive database operations
│       ├── tts_service.dart     # Text-to-speech service
│       └── audio_service.dart   # Audio playback service
└── features/                    # Feature modules
    ├── grid/                    # Grid view for displaying cards
    │   └── grid_screen.dart
    ├── sentence_strip/          # Sentence building interface
    │   └── sentence_strip_widget.dart
    └── creator/                 # Card creation and editing
        └── creator_screen.dart
```

## Dependencies

- **flutter_riverpod**: State management
- **hive_flutter**: Local database for storing cards and folders
- **flutter_tts**: Text-to-speech functionality
- **audioplayers**: Audio playback for custom sounds

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

## Development

This project follows clean architecture principles with separation of concerns:
- **Core**: Contains shared models and services
- **Features**: Contains feature-specific UI and logic

## License

Private project - All rights reserved 
