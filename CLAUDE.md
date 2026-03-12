# CLAUDE.md — Simple Design System (`simple_design`)

## Project Overview
A clean, minimal Flutter design system. Any component works in 1–2 lines. Colors and typography come from Flutter's built-in theme system — no hardcoded values ever.

**Package name:** `simple_design` | **Min SDK:** Flutter 3.16+ | **Status:** v0.1 Foundation in progress. Full plan: `docs/MASTER_PLAN.md`.

---

## Repository Structure

```
sd_flutter/
├── simple_design/    ← THE PACKAGE (what other projects import)
│   └── lib/src/
│       ├── tokens/   ← SDAnimation only
│       ├── theme/    ← SDTheme (light + dark via ColorScheme.fromSeed)
│       ├── components/
│       │   ├── buttons/
│       │   ├── inputs/
│       │   ├── cards/
│       │   ├── navigation/
│       │   ├── feedback/
│       │   ├── data_display/
│       │   ├── layout/
│       │   └── typography/
│       └── utils/
└── sd_showcase/      ← DEMO APP (11 showcase screens, uses go_router + provider)
    └── lib/
        ├── main.dart
        ├── router.dart
        └── screens/  ← home, buttons, forms, cards, navigation, feedback,
                         data_display, typography, layout, entry, theme
```

**Critical rule:** `simple_design` has ZERO dependency on `go_router` or `provider`. Pure UI only.

---

## The 5 Non-Negotiables

Every single component, no exceptions:

1. **Theme only** — no hardcoded colors, sizes, or spacing ever
   ```dart
   // Never:  Container(color: Color(0xFFF5F5F5))
   // Always: Container(color: Theme.of(context).colorScheme.surface)
   ```
2. **All 5 states** — `default → hover/focused → pressed/active → loading → disabled`
3. **48dp minimum touch target** — enforced in every interactive component (Fitts's Law)
4. **Icon + label always together** — use `SDIconLabel`, never a bare `Icon()`
5. **Semantics on every interactive widget** — `Semantics(label: '...', button: true, child: ...)`

---

## Theming

One seed color generates the full accessible palette for both light and dark modes.

```dart
// SDTheme — single seed → full ColorScheme
class SDTheme {
  static const _seed = Color(0xFF607D8B); // subtle grey-blue

  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.light),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark),
    useMaterial3: true,
  );
}
```

**In every component** use the active theme — never hardcode:
- Colors → `Theme.of(context).colorScheme.*`
- Typography → `Theme.of(context).textTheme.*`
- Font → device default (SF Pro / Roboto)

---

## Design Tokens

| Class | File | Purpose |
|---|---|---|
| `SDAnimation` | `tokens/sd_animation.dart` | fast=100ms, normal=200ms, slow=350ms, curve=easeInOut |
| `SDTheme` | `theme/sd_theme.dart` | Generates light + dark `ThemeData` from single seed color |

Everything else (colors, spacing, text styles, radius, sizes) is handled by Flutter's Material 3 theme system or set as raw constants at the component level.

---

## Naming Conventions

| Thing | Convention | Example |
|---|---|---|
| Token/component files | `sd_[name].dart` | `sd_button.dart`, `sd_animation.dart` |
| Token/component classes | `SD` prefix | `SDButton`, `SDTheme`, `SDAnimation` |
| Variants | Named constructors | `SDButton.primary()`, `SDAlert.error()` |
| Showcase screens | `[feature].screen.dart` | `buttons.screen.dart` |
| Showcase routes | `static const routeName` | `ButtonsScreen.routeName` |

---

## Component Quality Checklist (7 checks — all required)

```
□ 1. Uses only theme values — no hardcoded colors, sizes, or spacing
□ 2. All 5 states implemented — default, focused, pressed, loading, disabled
□ 3. Touch target ≥ 48dp
□ 4. WCAG AA contrast — text ≥ 4.5:1
□ 5. Semantics widget on every interactive element
□ 6. Simple API — usable in 1–2 lines
□ 7. Dartdoc comment with one usage example
```

---

## Build Milestones

| Milestone | Components | Showcase Pages |
|---|---|---|
| **v0.1 Foundation** | SDAnimation + SDTheme (light+dark) + SDButton + SDText + SDIconLabel + SDDivider + SDSpinner | Home (1), Buttons (2) |
| v0.2 Forms | SDTextField, SDDropdown, SDCheckbox, SDRadio, SDSwitch, SDSlider, SDDatePicker, SDForm | Forms (3) |
| v0.3 Data Display | SDCard, SDList, SDTable, SDBadge, SDAvatar, SDChip, SDTag | Cards (4), Data Display (7) |
| v0.4 Feedback | SDAlert, SDModal, SDSnackbar, SDToast, SDBottomSheet, SDProgressBar, SDSkeletonLoader | Feedback (6) |
| v0.5 Navigation | SDAppBar, SDTabs, SDBottomNav, SDDrawer, SDBreadcrumb, SDStepIndicator | Navigation (5) |
| v0.6 Layout | SDAccordion, SDCarousel, SDBentoBox, SDEmptyState, SDDividerLabel | Typography (8), Layout (9) |
| v0.7 Entry Screens | SDSplashScreen, SDLoginScreen, SDRegisterScreen, SDForgotPasswordScreen, SDOnboardingScreen | Entry Screens (10) |
| v1.0 Complete | All 11 pages + README + CHANGELOG | Theme Switcher (11) |

---

## Architecture (WithCenter Pattern)

The `sd_showcase` app follows the WithCenter pattern:

```dart
// main.dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => ThemeState()),
    ChangeNotifierProvider(create: (_) => ShowcaseState()),
  ],
  child: const ShowcaseApp(),
)

// router.dart — ShellRoute wrapping all 10 screens
ShellRoute(
  builder: (context, state, child) => ShowcaseShell(child: child),
  routes: [ /* all 10 GoRoutes */ ],
)
```


---

## Decisions Made

| # | Decision |
|---|---|
| Font | Device default (SF Pro on iOS, Roboto on Android) |
| Accent | Subtle grey-blue seed `Color(0xFF607D8B)` |
| Dark theme | From day one — both `SDTheme.light` and `SDTheme.dark` in v0.1 |
| Package name | `simple_design` |
| Min SDK | Flutter 3.16+ |
| Repo visibility | Owner handles |
| Claude skills | Needed later — custom skills for Claude to use this design system |

---

## Usage

```yaml
# pubspec.yaml
dependencies:
  simple_design:
    git:
      url: https://github.com/your-org/sd_flutter.git
      path: simple_design
      ref: main
```

```dart
import 'package:simple_design/simple_design.dart';

// Apply theme once — system auto-switches light/dark
MaterialApp(
  theme: SDTheme.light,
  darkTheme: SDTheme.dark,
  themeMode: ThemeMode.system,
)

// Use anywhere
SDButton.primary(label: 'Submit', onPressed: () {})
SDTextField(label: 'Email', hint: 'Enter your email')
```
## Agents 
- use your agents in parallel when needed to save your context
- use `doc-updater` agent in [doc-updater](./.claude/agents/docs-updater.md) to update the `CHANGELOG.md` and  `README.md` every after sessions
- use `release-tagger` agent in [release-tagger](./.claude/agents/release-tagger.md) to commit the changes and tag the version

## Coding Rules
- Respect existing coding pattern or design pattern and you must adhere it
