# CLAUDE.md

質問した時は日本語で答えてね。

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
NFL Library is a Flutter application providing NFL roster information and rules reference. The app uses a clean architecture pattern with clear separation between domain, repository, controller, and presentation layers.

## Development Commands

### Essential Flutter Commands
```bash
# Run the app in debug mode
flutter run

# Build for release
flutter build apk          # Android
flutter build ios          # iOS

# Run tests
flutter test

# Code analysis and linting
flutter analyze

# Get dependencies
flutter pub get

# Clean build artifacts
flutter clean
```

### Environment Setup
- Copy `.env.example` to `.env` and configure API_URL
- Ensure all dependencies are installed with `flutter pub get`

## Architecture

### Core Structure
- **Domain Layer** (`lib/domain/`): Entity models with JSON serialization
- **Repository Layer** (`lib/repositories/`): Interface-based data access with concrete implementations
- **Controller Layer** (`lib/controllers/`): Business logic using Riverpod providers
- **Presentation Layer**: Pages and reusable components

### State Management
The app uses a hybrid approach:
- **Riverpod** (`flutter_riverpod ^1.0.4`) for controller state management
- **Provider** (`provider ^5.0.0`) for some legacy state
- All controllers should be wrapped in ProviderScope

### Navigation Architecture
Bottom navigation with 4 main sections:
1. **Roster** (Teams/Players) - Default home
2. **Rules** (NFL Rules and Penalties)  
3. **Favorites** (Modern NFL features)
4. **Settings** (App configuration)

## Key Conventions

### File Organization
- Controllers in `lib/controllers/` follow `[Feature]Controller` naming
- Repository interfaces in `lib/repositories/` with concrete implementations
- Reusable components in `lib/components/common/`
- Feature-specific components in `lib/components/[feature]/`

### Design System
All UI constants are defined in `lib/configs/const.dart`:
- **Colors**: AppColor class with main, background, sub, and active colors
- **Spacing**: AppNum class with xs, sm, md, lg, xl spacing constants
- **Typography**: Custom fonts (Playfair Display, Dancing Script, Bebas Neue, Bree Serif)

### Data Models
- All domain models include JSON serialization (`fromJson`/`toJson`)
- Use interface-based repository pattern for data access
- API integration through HTTP repository implementations

### Component Standards
- Search components use `ISelectBox` interface for dropdown functionality
- Cards and buttons follow spacing standards from `AppNum`
- All team logos and assets are organized by team name in `images/` directory

## Environment Configuration
- API endpoints configured via `.env` file
- Asset management for 32 NFL team logos and custom fonts
- Environment-specific build configurations

## Testing
- Widget tests in `test/` directory
- Use `flutter test` to run all tests
- Test files should mirror the `lib/` structure