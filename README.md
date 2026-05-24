


https://github.com/user-attachments/assets/5462a5b0-25db-4b50-a1e4-9c796eb92ca4


Movies App
A modern Flutter application for discovering and managing movies, built with Clean Architecture, BLoC/Cubit for state management, and Firebase for authentication and data storage.


🏗 Project Architecture
The project follows a modular Clean Architecture approach to ensure scalability, testability, and maintainability:
•
core/: Contains app-wide utilities, themes, routing, dependency injection (GetIt/Injectable), and shared constants.
•
data/: Implementation of repositories and data sources (Remote via Dio/Retrofit and Local via Firestore).
•
domain/: Business logic layer containing Entities, Use Case definitions, and Repository interfaces.
•
features/: UI layer organized by feature (Auth, Home, Search, Profile). Each feature contains its own Screens, Widgets, and Cubits/ViewModels.
•
api/: Networking configuration, including Dio interceptors for logging and error handling.
🚀 Key Features
•
Firebase Authentication: Support for Email/Password and Google Sign-In.
•
Persistent Sessions: Automatic login detection using a custom AuthScreenPicker.
•
Movie Discovery: Browse trending, popular, and upcoming movies via TMDB (or similar API).
•
Advanced Search: Real-time search with Debouncing (1s) and Infinite Scrolling pagination.
•
Profile Management: User profile updates (name, phone, avatar) and secure logout.
•
Watchlist/History: Save movies to a local history/watchlist (tracked via Firestore).
•
Localization: Multi-language support (English/Arabic) using easy_localization.
📝 Recent Changes & Detailed Updates
The following changes were recently implemented to stabilize the app and improve UX:
1. Authentication & Session Management
•
AuthScreenPicker Implementation: Introduced a stateful gatekeeper widget that manages the transition between Loading, Login, and Main screens.
◦
Added a _isInitialCheck flag to handle the "silent" authentication check on boot without flickering the Login screen.
◦
Synchronized Firebase Auth states with the internal UserModel fetched from Firestore.
•
Auto-Login: Configured main.dart to initialize the AuthCubit and fetch user data immediately if a session exists.
•
Logout Flow:
◦
Implemented logout() in AuthCubit to sign out of Firebase and reset state.
◦
Added BlocListener in the Profile Tab to handle navigation back to Login and clear the navigation stack.
2. Search Feature Optimization
•
Debouncing: Added a Timer to the Search Tab to delay API calls by 1000ms while the user types, significantly reducing unnecessary network traffic.
•
Infinite Scrolling: Integrated infinite_scroll_pagination to handle large search result sets efficiently.
•
State Persistence: Moved SearchTabViewModel and HomeTabCubit to the root MultiBlocProvider to ensure movie data isn't lost when switching tabs.
3. State Management Refactoring
•
Global Cubit Provision: Relocated core Cubits (AuthCubit, LocalCubit, HomeTabCubit) to main.dart. This ensures that authentication status and theme settings are globally accessible and persistent.
•
Navigation Fixes: Resolved a bug where successful login didn't trigger navigation; added Navigator.pushReplacementNamed in the Login screen listener.
4. UI & Bug Fixes
•
Double Loading Resolved: Eliminated the redundant full-screen spinner that appeared between the Login button click and the Home screen entry.
•
Empty States: Added visual feedback for empty search results and loading states using themed assets.




The development branch is significantly ahead of master and contains the following features that are likely missing or incomplete in the stable branch:
1.
Firebase & Firestore: Full integration of Firebase services for user authentication and remote data storage.
2.
Clean Architecture Implementation: A complete overhaul from a simple MVVM approach to a 4-layer Clean Architecture (API, Data, Domain, Feature).
3.
Advanced UI Features:
◦
Search Tab: With debouncing and infinite scroll.
◦
Browse Tab: Category-based movie discovery.
◦
Detailed Profile: With history tracking and wishlist management.
4.
Dependency Injection: Automating service registration using build_runner.
5.
Enhanced UX: Smooth auth transitions, custom loaders, and persistent tab states.
Summary: The project has evolved from a basic UI shell into a fully functional, scalable movie application with robust state management and real-time data synchronization.
