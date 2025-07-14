# Yummy Recipes
[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white)](https://flutter.dev)
[![BLoC Pattern](https://img.shields.io/badge/State%20Management-BLoC%20Pattern-blue)](https://bloclibrary.dev)

Yummy Recipes is a sophisticated Flutter-based mobile application designed to unite culinary enthusiasts through a seamless and engaging cooking experience. Anchored by the tagline *"Cook Together, Stay Together"*, the app offers an extensive collection of recipes across diverse categories, delivering a polished interface and exceptional user experience.

## Table of Contents
- [Key Features](#key-features)
- [Technology Stack](#technology-stack)
- [API Integration](#api-integration)
- [Development Setup](#development-setup)
- [Roadmap](#roadmap)
- [Team](#team)
- [UI Showcase](#ui-showcase)
## Key Features

### Core Functionality
- **Diverse Recipe Categories**: Explore recipes for Breakfast, Lunch, Dinner, and more.
- **Real-Time Search**: Instant search functionality with smooth loading animations.
- **Timer Functionality**: Integrated timers with audible alerts for precise cooking.

### User Experience
- **Theme Customization**: Persistent Dark and Light themes for user preference.
- **Responsive Design**: Optimized for all screen sizes, ensuring accessibility.
- **Image Caching**: Fast-loading images with efficient caching mechanisms.

### Advanced Features
- **Cooking Mode**: Voice-guided cooking with Text-to-Speech (TTS) integration.
- **Smooth Transitions**: Hero animations for fluid screen navigation.
- **Skeleton Loading**: Placeholder states for enhanced loading visuals.
- **Typography**: Custom Cairo font family for a refined aesthetic.
- **Custom Transitions**: Tailored page transitions for a cohesive experience.

## Technology Stack

| Category           | Technologies                          |
|--------------------|---------------------------------------|
| Framework          | Flutter                              |
| State Management   | BLoC Pattern (flutter_bloc)          |
| Networking         | Dio                                  |
| Image Handling     | Cached Network Image                 |
| Animations         | Lottie                               |
| Text-to-Speech     | Flutter TTS                          |
| Loading States     | Skeletonizer                         |
| Testing            | Device Preview                       |
| Code Quality       | Flutter Lints                        |

## API Integration

The application leverages the Dummy JSON API to retrieve recipe data:

**Base URL**: [https://dummyjson.com/test](https://dummyjson.com/test)

### Endpoints
- `GET /recipes/meal-type/$mealType`: Fetch recipes by meal category.
- `GET /recipes?sortBy=rating&order=desc&limit=25`: Retrieve top-rated recipes.
- `GET /recipes/search?q=$query`: Search recipes by query.

## Development Setup

### Prerequisites
- Flutter SDK 3.7.2 or higher
- Dart 3.x

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/YousefDewidar/SWD4_S1_T1.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Launch the application:
   ```bash
   flutter run
   ```

## Roadmap
- **Synced Cooking Experience**: Enable real-time collaborative cooking sessions.
- **Recipe Sharing**: Share recipes seamlessly with friends and family.
- **Nutritional Insights**: Provide detailed nutritional information for recipes.

## Team
- Omar Gamal Saleh
- Yousef Mahmoud Dewidar
- Menna Ebrahim Abd Elhalim
- Shahd Muhammed Ali
- Doha Mohamed Ali
- Tarek Mohamed Ahmed

## UI Showcase

### Splash Screen
![Splash Screen](assets/screenshots/splash.jpg)

### Light Theme
| Home Screen | Category View | Recipe Details |
|-------------|---------------|----------------|
| ![Home](assets/screenshots/home-light.jpg) | ![Breakfast](assets/screenshots/breakfast-light.jpg) | ![Ingredients](assets/screenshots/ingredients.jpg) |

| Search | Cooking Mode | Timer |
|--------|--------------|-------|
| ![Search](assets/screenshots/serach.jpg) | ![Cooking](assets/screenshots/steps-light.jpg) | ![Timer](assets/screenshots/timer-light.jpg) |

### Dark Theme
| Home Screen | Search Results | Recipe Steps |
|-------------|----------------|--------------|
| ![Home Dark](assets/screenshots/home-darkjpg.jpg) | ![Search Dark](assets/screenshots/search-res-dark.jpg) | ![Steps Dark](assets/screenshots/instructions-dark.jpg) |
