# Changelog

All notable changes to `simple_design` are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versions follow [Semantic Versioning](https://semver.org/).

---

## [v0.3.0] — 2026-03-12

### Added — Components

- **`SDCard`** — 3 variants matching Material 3 card types
  - `.elevated()` — default shadow card
  - `.filled()` — `colorScheme.surfaceContainerHighest`, no shadow
  - `.outlined()` — `colorScheme.outline` border
  - Parameters: `child`, `onTap` (adds ripple + Semantics), `padding` (default 16dp)

- **`SDListItem`** — single themed list row
  - Parameters: `title`, `subtitle`, `leading`, `trailing`, `onTap`, `enabled`
  - Wraps `ListTile` (56dp height, semantics built-in)

- **`SDTable`** — data table with horizontal scroll
  - `SDTableColumn(label, {numeric})` for column definitions
  - `rows` accepts `List<List<Widget>>`
  - Wraps `DataTable` in `SingleChildScrollView(Axis.horizontal)`

- **`SDBadge`** — small indicator badge
  - `.count({required int count})` — numbered circle; shows `99+` above 99
  - `.dot()` — 8dp dot
  - Colors: `colorScheme.error` / `colorScheme.onError`

- **`SDAvatar`** — circular avatar
  - `.initials({required String initials, double size = 40})`
  - `.icon({required IconData icon, double size = 40})`
  - `.image({required ImageProvider image, double size = 40})`
  - Colors: `colorScheme.primaryContainer` / `colorScheme.onPrimaryContainer`

- **`SDChip`** — 3 variants matching Material 3 chip types
  - `.filter({label, selected, onSelected, icon, enabled})` → `FilterChip`
  - `.action({label, onPressed, icon})` → `ActionChip`
  - `.input({label, onDeleted, icon, enabled})` → `InputChip`
  - `Semantics` wrapper on all variants

- **`SDTag`** — non-interactive status label
  - Parameters: `label`, `color` (default `colorScheme.secondaryContainer`)
  - `labelSmall` typography, `BorderRadius.circular(4)`

### Added — Showcase App

- **Cards screen** (`/cards`) — all 3 card variants + composition examples
- **Data Display screen** (`/data`) — list items, table, badges, avatars, chips, tags

---

## [v0.2.0] — 2026-03-12

### Added — Components

- **`SDTextField`** — text input with label, hint, error, disabled states
  - Parameters: `controller`, `label`, `hint`, `errorText`, `onChanged`, `enabled`, `obscureText`, `keyboardType`, `validator`, `textInputAction`, `onFieldSubmitted`
  - Wraps `TextFormField` with `InputDecoration(border: OutlineInputBorder())`

- **`SDDropdown<T>`** — single-select dropdown
  - `SDDropdownItem<T>(value, label)` for item definitions
  - Parameters: `items`, `value`, `label`, `hint`, `onChanged`, `enabled`

- **`SDMultiSelect<T>`** — multi-select via dialog
  - Opens `AlertDialog` with `CheckboxListTile` list
  - Displays selected labels comma-separated in trigger field

- **`SDCheckbox`** — labeled checkbox
  - Parameters: `label`, `value`, `onChanged`, `enabled`
  - Wraps `CheckboxListTile` (48dp touch target built-in)

- **`SDRadioGroup<T>`** + **`SDRadioOption<T>`** — radio group
  - Parameters: `value`, `options`, `onChanged`, `label`, `enabled`
  - Uses Material 3 `RadioGroup` + `RadioListTile`

- **`SDSwitch`** — labeled toggle
  - Parameters: `label`, `value`, `onChanged`, `enabled`
  - Wraps `SwitchListTile`

- **`SDSlider`** — range input
  - Parameters: `value`, `onChanged`, `min`, `max`, `divisions`, `label`, `enabled`
  - 48dp height enforced via `SizedBox`

- **`SDDatePicker`** — tappable date field
  - Calls `showDatePicker()` on tap; formats as `YYYY-MM-DD`
  - Parameters: `value`, `onChanged`, `label`, `enabled`, `firstDate`, `lastDate`

- **`SDForm`** — thin `Form` wrapper
  - Parameters: `formKey`, `child`

### Added — Showcase App

- **Forms screen** (`/forms`) — all 9 input components + full validated form example

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
