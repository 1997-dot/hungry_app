# Hungry App - Project Development Plan

## Overview
A food ordering Flutter application built with **Clean Architecture** principles.

---

## Tech Stack
- **Framework:** Flutter
- **State Management:** flutter_bloc
- **Dependency Injection:** get_it, injectable
- **Networking:** Dio
- **Local Storage:** SharedPreferences

---

## Features
| Feature | Description |
|---------|-------------|
| `splash` | App launch screen with branding |
| `auth` | Login, register, logout, session management |
| `home` | Product listing, categories, search bar |
| `product_details` | Product customization (toppings, sides, spicy level) |
| `cart` | Cart management, quantity controls |
| `checkout` | Order summary, payment method selection |
| `payment` | Payment processing, success screen |
| `profile` | User info, edit profile, saved cards |
| `favorites` | Saved favorite products |
| `search` | Product search functionality |

---

## API Endpoints Reference
See: `lib/core/api/postman_collection.json`
Endpoints defined in: `lib/core/network/api_endpoints.dart`

---

## Development Phases

### PHASE 1 – PROJECT BOOTSTRAP ✅
**Status: COMPLETED**

1. Create Flutter project with Clean Architecture structure
2. Generate folder structure:
```
lib/
├── core/
│   ├── configs/
│   ├── error/
│   ├── network/
│   ├── services/
│   ├── utils/
│   ├── di/
│   └── widgets/
├── features/
│   └── {feature_name}/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── blocs/
│           ├── pages/
│           └── widgets/
├── app.dart
├── main.dart
└── injection_container.dart
```

---

### PHASE 2 – BUILD THE CORE LAYER ⏳
**Status: IN PROGRESS**

#### 2.1 Generate Core Configs
- [ ] `app_colors.dart` - Color palette and extensions
- [ ] `app_fonts.dart` - Typography styles
- [ ] `app_theme.dart` - ThemeData using colors and fonts
- [ ] `app_constants.dart` - App-wide constants
- [ ] `app_routes.dart` - AppRoutes class + route names

#### 2.2 Generate Core Error Handling
- [ ] `exceptions.dart`
  - ServerException
  - CacheException
  - AuthException
- [ ] `failures.dart`
  - Failure base class
  - ServerFailure
  - CacheFailure
  - AuthFailure

#### 2.3 Generate Network Layer
- [ ] `api_client.dart` - Dio client with interceptors
- [x] `api_endpoints.dart` - Static endpoint constants ✅
- [ ] `network_info.dart` - Connectivity checker

#### 2.4 Generate Core Services
- [ ] `local_storage_service.dart` - SharedPreferences wrapper
- [ ] `navigation_service.dart` - GlobalKey<NavigatorState>
- [ ] `analytics_service.dart` - Dummy interface + console implementation
- [ ] `notification_service.dart` - Local notifications skeleton

#### 2.5 Generate Utils
- [ ] `validators.dart` - Email, password validation
- [ ] `helpers.dart` - Snackbar helpers, misc utilities
- [ ] `formatters.dart` - Date formatters, currency formatters

#### 2.6 Core Dependency Injection
- [ ] `core/di/injector.dart`
  - Register all core services
  - Register network layer
  - Provide shared instances

#### 2.7 Core Shared Widgets
- [ ] `AppButton` - Reusable button component
- [ ] `AppTextField` - Reusable text field
- [ ] `AppLoader` - Loading indicator
- [ ] `AppSnackbar` - Snackbar utility

---

### PHASE 3 – FEATURE CREATION
**Status: NOT STARTED**

For each feature, create complete folder structure:
```
features/{feature_name}/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── blocs/
    ├── pages/
    └── widgets/
```

---

### PHASE 4 – FEATURE DOMAIN LAYER
**Status: NOT STARTED**

For each feature, generate in order:
1. **Entities** - Clean domain models
2. **Repository Interface** - Abstract repository contract
3. **UseCases** - Business logic operations

---

### PHASE 5 – FEATURE DATA LAYER
**Status: NOT STARTED**

For each feature, create in order:
1. **Models (DTOs)** - Data transfer objects with fromJson/toJson
2. **Remote Data Source** - API calls implementation
3. **Local Data Source** - Cache implementation
4. **Repository Implementation** - Concrete repository

---

### PHASE 6 – FEATURE PRESENTATION LAYER
**Status: NOT STARTED**

For each feature, create:
1. **Bloc** - Events, States, Business Logic
2. **Pages** - UI screens
3. **Widgets** - Feature-specific components

---

### PHASE 7 – INTEGRATION
**Status: NOT STARTED**

Update `injection_container.dart`:
- Register UseCases
- Register Repository
- Register Data Sources
- Register Bloc

---

### PHASE 8 – ROUTING
**Status: NOT STARTED**

- Add route entries in `app_routes.dart`
- Connect with feature pages
- Ensure NavigationService integration

---

### PHASE 9 – FINAL BUILD
**Status: NOT STARTED**

- Integrate features into app widget tree
- Verify DI, Routing, Theming, Navigation
- Ensure Clean Architecture layering rules
- Testing and QA

---

## Progress Tracker

| Phase | Description | Status |
|-------|-------------|--------|
| 1 | Project Bootstrap | ✅ Completed |
| 2 | Core Layer | ⏳ In Progress |
| 3 | Feature Creation | ⬜ Not Started |
| 4 | Domain Layer | ⬜ Not Started |
| 5 | Data Layer | ⬜ Not Started |
| 6 | Presentation Layer | ⬜ Not Started |
| 7 | Integration | ⬜ Not Started |
| 8 | Routing | ⬜ Not Started |
| 9 | Final Build | ⬜ Not Started |

---

## Notes
- Always follow Clean Architecture dependency rules
- Domain layer should have NO external dependencies
- Data layer implements domain interfaces
- Presentation layer depends on domain (not data)
- Use dependency injection for all dependencies
