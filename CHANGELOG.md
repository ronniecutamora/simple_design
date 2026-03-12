# Changelog

All notable changes to `simple_design` are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versions follow [Semantic Versioning](https://semver.org/).

---

## [v0.1.0] — 2026-03-12

### Added — Tokens

- **`SDAnimation`** — timing constants: `fast` (100ms), `normal` (200ms), `slow` (350ms), `curve` (easeInOut)

### Added — Theme

- **`SDTheme`** — generates full `ColorScheme` from a single seed color via `ColorScheme.fromSeed`
  - `SDTheme.light` — default light theme (grey-blue seed `#607D8B`)
  - `SDTheme.dark` — default dark theme (same seed, dark brightness)
  - `SDTheme.withSeed(color, {brightness})` — custom seed for brand override

### Added — Components

- **`SDButton`** — 4 variants, all 5 states
  - `.primary()` — filled, uses `colorScheme.primary`
  - `.secondary()` — outlined, uses `colorScheme.outline`
  - `.ghost()` — text-only, no decoration
  - `.danger()` — filled, uses `colorScheme.error`
  - Parameters: `label`, `onPressed`, `loading`, `leadingIcon`, `fullWidth`
  - States: default → focused → pressed → loading (spinner replaces label) → disabled (`onPressed: null`)
  - Minimum touch target: 48dp enforced on all variants
  - `Semantics` wrapper on every button

- **`SDText`** — 10 named constructors mapped to Material 3 `textTheme`
  - `.displayLg()` → `displayLarge`
  - `.displaySm()` → `displaySmall`
  - `.heading1()` → `headlineLarge`
  - `.heading2()` → `headlineMedium`
  - `.heading3()` → `headlineSmall`
  - `.bodyLg()` → `bodyLarge`
  - `.body()` → `bodyMedium`
  - `.bodySm()` → `bodySmall`
  - `.label()` → `labelLarge`
  - `.caption()` → `labelSmall`

- **`SDIconLabel`** — icon + text label always displayed together
  - Enforces the rule: icons never appear without a label

- **`SDDivider`** — themed separator using `colorScheme.outlineVariant`
  - `.horizontal()` — full-width rule
  - `.vertical({required double height})` — vertical rule

- **`SDSpinner`** — sized `CircularProgressIndicator`
  - Parameters: `size` (default 24dp), `color`

### Added — Showcase App

- `ShowcaseShell` — `StatefulShellRoute` with Material 3 `NavigationBar`
- **Home screen** — color palette grid, type scale, animation token reference
- **Buttons screen** — all 4 variants × all states, with-icon, full-width demos

### Added — Package Export

- `lib/simple_design.dart` — single barrel export for all tokens, theme, and components

---

## Roadmap

| Version | Focus |
|---|---|
| v0.2.0 | Forms & Inputs — `SDTextField`, `SDDropdown`, `SDCheckbox`, `SDRadio`, `SDSwitch`, `SDSlider`, `SDForm` |
| v0.3.0 | Data Display — `SDCard`, `SDList`, `SDTable`, `SDBadge`, `SDAvatar`, `SDChip`, `SDTag` |
| v0.4.0 | Feedback — `SDAlert`, `SDModal`, `SDSnackbar`, `SDToast`, `SDBottomSheet`, `SDProgressBar` |
| v0.5.0 | Navigation — `SDAppBar`, `SDTabs`, `SDBottomNav`, `SDDrawer`, `SDBreadcrumb` |
| v0.6.0 | Layout — `SDAccordion`, `SDCarousel`, `SDBentoBox`, `SDEmptyState` |
| v0.7.0 | Entry Screens — `SDSplashScreen`, `SDLoginScreen`, `SDRegisterScreen`, `SDOnboardingScreen` |
| v1.0.0 | Dark theme showcase, full README, release |
