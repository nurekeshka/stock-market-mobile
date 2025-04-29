# Stock Market Mobile

Cross-Platform application for stocks management.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Architecture Overview

- **lib**: Source Code
  - **core**: Application Logic
    - **constants**: Static Values
    - **services**: Business Logic
    - **theme**: Styles & Colors
    - **utils**: Helpers & Utilities
  - **data**: Data Management
    - **datasources**: Data Retriving
    - **models**: Data Models
    - **repositories**: Data Interactors
  - **domain**: Models & Entities
    - **entities**: Entities
    - **repositories**: Entities Repositories
    - **usecases**: Entities Interactors
  - **presentation**: UI & Widgets
    - **blocs**: Events & State Management
    - **pages**: Routes
    - **widgets**: Components & UI
  - index.dart: Core Widget
  - main.dart: Application Entry Point

## Project Features:

### Step One:
- [x] Create Project
- [x] Planing Workflows
- [ ] API Integration
- [ ] Home Screen Page UI
- [ ] Stocks Search

### Step Two:
- [ ] Theme Integration
- [ ] Auth & Profile
- [ ] Graphics on Home Page
