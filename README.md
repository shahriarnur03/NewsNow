<div align="center">

# 📰 NewsNow

<strong>Stay Updated, Stay Informed.</strong><br/>
A modern, multi-platform Flutter news application that consumes the public <a href="https://newsapi.org/">NewsAPI</a> to deliver real‑time headlines, category browsing, powerful search, and in‑app reading via WebView.

![Platform](https://img.shields.io/badge/platform-Android%20|%20iOS%20|%20Web%20|%20Desktop-blue?logo=flutter)
![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

</div>

---

## ✨ Highlights

-   🚀 Fast UX with cached asset config + async fetching
-   🗂️ Category exploration (Business, Entertainment, Science, Sports, Technology)
-   🔍 Instant keyword search across global news
-   🔥 Trending & Top Headlines feed (BBC + US top headlines)
-   📰 Rich article cards (hero + horizontal list + tall variant)
-   🌐 In‑app WebView reader (no context switching)
-   🎬 Animated splash experience (fade + pulse)
-   ♻️ Simple, extensible architecture for rapid iteration

---

## 📱 Screens / Flows

| Splash           | Home (Top + Trending) | Search           |
| ---------------- | --------------------- | ---------------- |
| (Add screenshot) | (Add screenshot)      | (Add screenshot) |

| Explore (Categories) | Category Articles | Article WebView  |
| -------------------- | ----------------- | ---------------- |
| (Add screenshot)     | (Add screenshot)  | (Add screenshot) |

> Tip: Place PNG/JPG screenshots under `assets/screenshots/` and replace the table cells with actual `![](assets/screenshots/home.png)` references.

---

## 🧩 Architecture Overview

The project intentionally keeps a clean, beginner‑friendly structure while leaving room to scale into layered patterns (e.g. Repository, BLoC, Riverpod) if needed.

```
lib/
	main.dart                # App root (MaterialApp + Splash)
	models/                  # Plain data objects (ArticleModel, CategoryModel, ShowCategoryModel)
	services/                # Remote data fetch logic (News, ShowCategoryNews, category data seed)
	views/
		splash_screen.dart     # Animated splash + navigation
		bottom_nav_screen.dart # Root navigation (IndexedStack + BottomNavigationBar)
		home_screen.dart       # Top headlines + trending lists
		explore_screen.dart    # Category grid
		category_news_screen.dart # Articles filtered by category
		search_news.dart       # Keyword search UX
		article_screen.dart    # WebView detail (embedded website)
		widgets/               # Reusable UI components (cards, list items, etc.)
assets/
	images/                  # Category & branding images
	config.json              # Local (git‑ignored recommended) API key holder
```

### Data Flow (High Level)

1. UI triggers fetch (e.g. `HomeScreen` calls `News().getNews()`).
2. Service reads `assets/config.json` for `api_key` (prevents hard‑coding secrets in code).
3. Service performs HTTP request to NewsAPI endpoints.
4. JSON decoded → mapped into `ArticleModel` / `ShowCategoryModel`.
5. Widgets render lists (horizontal & vertical) with graceful loading spinners.

### Key Endpoints

-   Top Headlines (source: BBC): `https://newsapi.org/v2/top-headlines?sources=bbc-news`
-   Category Headlines: `https://newsapi.org/v2/top-headlines?country=us&category={category}`
-   Keyword Search: `https://newsapi.org/v2/everything?q={query}`

> To rotate or expand sources, adjust URLs or generalize via a repository wrapper.

---

## 🛠️ Tech Stack

| Layer             | Tools / Packages                        | Notes                                         |
| ----------------- | --------------------------------------- | --------------------------------------------- |
| UI                | Flutter (Material)                      | Responsive, adaptive components               |
| Animation         | `AnimationController`, `FadeTransition` | Splash micro‑interaction                      |
| Networking        | `http`                                  | Direct REST calls                             |
| Web Rendering     | `webview_flutter`                       | In-app article reading                        |
| Date / Formatting | `intl`                                  | For future timestamp formatting (placeholder) |
| Asset Config      | `rootBundle`                            | Local JSON for API key                        |

---

## 🔐 API Key Setup

1. Get a free API key from: https://newsapi.org/
2. Create a file at `assets/config.json` (DO NOT COMMIT your real key):
    ```json
    { "api_key": "YOUR_NEWS_API_KEY" }
    ```
3. Ensure the path is declared in `pubspec.yaml` under `assets:` (already done).
4. (Optional) Commit a safe example (`config.json.example`) and add `config.json` to `.gitignore`:
    ```gitignore
    assets/config.json
    ```

---

## 🚀 Getting Started (Run Locally)

Prerequisites:

-   Flutter SDK installed (3.x recommended)
-   Dart SDK (bundled with Flutter)

Clone & Run:

```bash
git clone https://github.com/your-username/NewsNow.git
cd NewsNow
flutter pub get
cp assets/config.json.example assets/config.json   # then edit with your API key
flutter run
```

Run for specific platforms:

```bash
flutter run -d chrome       # Web
flutter run -d ios          # iOS simulator (macOS only)
flutter run -d android      # Android device/emulator
```

Run tests:

```bash
flutter test
```

---

## 🧪 Testing Strategy

Current: Basic widget test scaffold (default).
Suggested Enhancements:

-   Add mock HTTP layer (e.g. `http_mock_adapter` or custom `Client`).
-   Golden tests for cards (`NewsCard`, `NewsHorizontalCard`).
-   Integration test: load home → navigate category → open article.

---

## 💡 Possible Improvements (Roadmap)

-   State management: Riverpod / BLoC for separation & caching.
-   Offline caching (Hive / SQflite) for last-read articles.
-   Theme switching (light/dark system sync).
-   Pagination & infinite scroll for search results.
-   Error & empty states with illustrations.
-   Pull-to-refresh on lists.
-   In-app bookmarking + sharing.
-   Analytics & crash reporting (Firebase).
-   CI pipeline (GitHub Actions: format, analyze, test, build).

---

## 🧭 Design Choices / Rationale

| Choice                             | Reason                                                                  |
| ---------------------------------- | ----------------------------------------------------------------------- |
| Simplicity over heavy architecture | Keeps learning curve low; easy for recruiters to scan                   |
| Local `config.json` for API key    | Avoids committing secrets; trivial to swap environments                 |
| Separate service classes           | Encapsulates endpoint logic; ready to extend with Repository or caching |
| IndexedStack for tabs              | Preserves state across tab switches                                     |
| WebView for article detail         | Faster MVP vs building custom reader                                    |

---

## 🧑‍💻 For Recruiters

This project demonstrates:

-   Practical Flutter app architecture (clean separation of models/services/views)
-   External API integration & JSON mapping
-   Asynchronous programming & stateful widgets lifecycle
-   UI composition & responsive list rendering patterns
-   Attention to UX polish (animations, loading states, navigation flow)

Focus Areas to Discuss in Interview:

-   How to refactor into layered architecture (Repository + StateNotifier)
-   Offline-first strategy (caching & stale-while-revalidate)
-   Test approach evolution (unit, golden, integration)
-   Performance considerations (image caching, list virtualization)

---

## 📂 Project Structure (Expanded)

```
NewsNow/
	lib/
		models/
		services/
		views/
			widgets/
	assets/
	test/
	android/ ios/ web/ macos/ linux/ windows/   # Multi-platform targets
	pubspec.yaml
	analysis_options.yaml
```

---

## 🧹 Code Quality

-   Static analysis via `flutter_lints` (see `analysis_options.yaml`).
-   Null-safe Dart (SDK constraint ^3.8.1).
-   Defensive JSON parsing: filters out articles missing core fields.

---

## 🤝 Contributing

PRs and suggestions welcome. Please open an issue for feature ideas or bugs. Consider adding tests with any functional change.

---

## 📄 License

Distributed under the MIT License. (Add a `LICENSE` file if publishing.)

---

## 🙌 Acknowledgements

-   [NewsAPI.org](https://newsapi.org/) for the data source.
-   Flutter & Dart teams for great tooling.

---

## ✅ Quick Checklist

-   [x] Multi-screen navigation
-   [x] Category filtering
-   [x] Search functionality
-   [x] WebView integration
-   [x] Animated splash
-   [ ] Dark mode
-   [ ] Bookmarks
-   [ ] Offline cache

---

### Happy Coding! ✨

Feel free to ⭐ the repo if you find it useful.
