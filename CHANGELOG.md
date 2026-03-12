# Changelog

All notable changes to `simple_design` are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versions follow [Semantic Versioning](https://semver.org/).

---

## [v0.5.0] — 2026-03-12

### Added — Components

- **`SDAppBar`** — implements `PreferredSizeWidget`, wraps `AppBar`
  - Parameters: `title`, `actions?`, `leading?`, `centerTitle`, `bottom?` (for `TabBar`)

- **`SDTabs`** — self-contained tab bar + content
  - Parameters: `tabs` (List<String>), `children` (List<Widget>), `contentHeight` (default 160)
  - Uses `DefaultTabController` internally

- **`SDBottomNav`** — wraps `NavigationBar`
  - `SDBottomNavItem(label, icon, selectedIcon?)` for destination definitions
  - Parameters: `items`, `selectedIndex`, `onDestinationSelected`

- **`SDDrawer`** — wraps `NavigationDrawer`
  - `SDDrawerItem(label, icon, selectedIcon?, onTap?)` for item definitions
  - Parameters: `items`, `selectedIndex?`, `header?`, `onDestinationSelected?`

- **`SDBreadcrumb`** — horizontal breadcrumb trail
  - `SDBreadcrumbItem(label, onTap?)` — `null` onTap = current page
  - Horizontally scrollable with chevron separators

- **`SDStepIndicator`** — horizontal step progress
  - Parameters: `steps` (List<String>), `currentStep` (int, 0-based)
  - Completed steps show checkmark, active step highlighted, upcoming steps muted

### Added — Showcase App

- **Navigation screen** (`/navigation`) — fully implemented (was placeholder); uses `SDAppBar` as its own app bar

---

## [v0.4.0] — 2026-03-12

### Added — Components

- **`SDAlert`** — inline alert banner, 4 variants
  - `.info(message, {title, onDismiss})` — `colorScheme.secondaryContainer`
  - `.success(message, {title, onDismiss})` — `colorScheme.tertiaryContainer`
  - `.warning(message, {title, onDismiss})` — `colorScheme.errorContainer` tint
  - `.error(message, {title, onDismiss})` — `colorScheme.errorContainer`
  - `Semantics(liveRegion: true)` on all variants; dismiss uses `IconButton` (48dp)

- **`SDModal`** — static dialog helper
  - `.show(context, {title, body, confirmLabel, cancelLabel, onConfirm, onCancel})` — standard two-button `AlertDialog`
  - `.showDestructive(context, {title, body, confirmLabel, cancelLabel, onConfirm, onCancel})` — confirm uses `cs.error` / `cs.onError`

- **`SDSnackbar`** — static snackbar helper
  - `.show(context, {message, actionLabel?, onAction?, duration})` — `SnackBarBehavior.floating`
  - `.showError(context, {message, actionLabel?, onAction?})` — `cs.error` background, `cs.onError` text

- **`SDToast`** — static overlay toast
  - `.show(context, {message, icon?, duration})` — overlay-based, auto-dismisses with fade
  - Appears near top of screen; uses `cs.inverseSurface` / `cs.onInverseSurface`

- **`SDBottomSheet`** — static modal bottom sheet helper
  - `.show<T>(context, {child, title?, isDismissible})` — drag handle, `cs.onSurfaceVariant`

- **`SDProgressBar`** — linear progress widget
  - `SDProgressBar({value?, label?})` — determinate (`0.0–1.0`) when `value` provided, indeterminate otherwise
  - Shows percentage label when both `value` and `label` are provided
  - `LinearProgressIndicator` clipped with `BorderRadius.circular(4)`

- **`SDSkeletonLoader`** — animated shimmer placeholder
  - `SDSkeletonLoader({width, height, circular?})` — opacity animation `0.4→1.0` at 1200ms repeat
  - `SDSkeletonLoader.card()` — preset card-shaped skeleton

### Added — Showcase App

- **Feedback screen** (`/feedback`) — all 7 feedback components with live demos
- Shell switched from `NavigationBar` to `NavigationDrawer` (M3) to accommodate growing destination count

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
| v0.4.0 ✅ | Feedback — `SDAlert`, `SDModal`, `SDSnackbar`, `SDToast`, `SDBottomSheet`, `SDProgressBar`, `SDSkeletonLoader` |
| v0.5.0 ✅ | Navigation — `SDAppBar`, `SDTabs`, `SDBottomNav`, `SDDrawer`, `SDBreadcrumb`, `SDStepIndicator` |
| v0.6.0 | Layout — `SDAccordion`, `SDCarousel`, `SDBentoBox`, `SDEmptyState` |
| v0.7.0 | Entry Screens — `SDSplashScreen`, `SDLoginScreen`, `SDRegisterScreen`, `SDOnboardingScreen` |
| v1.0.0 | Dark theme showcase, full README, release |
