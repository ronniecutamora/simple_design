# simple_design

A clean, minimal Flutter design system. Any component works in 1–2 lines. Colors and typography come from Flutter's built-in theme system — no hardcoded values ever.

**Current version:** v0.3.0 — Data Display

---

## Install

```yaml
# pubspec.yaml
dependencies:
  simple_design:
    git:
      url: https://github.com/your-org/sd_flutter.git
      ref: v0.3.0
```

## Quick Start

```dart
import 'package:simple_design/simple_design.dart';

// 1. Apply theme once in main.dart
MaterialApp(
  theme: SDTheme.light,
  darkTheme: SDTheme.dark,
  themeMode: ThemeMode.system, // auto light/dark
)

// 2. Use components anywhere
SDButton.primary(label: 'Submit', onPressed: () {})
SDButton.secondary(label: 'Cancel', onPressed: null)  // disabled
SDButton.danger(label: 'Delete', onPressed: () {}, loading: true)

SDText.heading1('Hello')
SDText.body('Some paragraph text')

SDIconLabel(icon: Icons.home, label: 'Home')
SDDivider.horizontal()
SDSpinner()
```

---

## Theming

One seed color generates the full accessible `ColorScheme` for both light and dark.

```dart
// Default — subtle grey-blue
theme: SDTheme.light
darkTheme: SDTheme.dark

// Custom brand color — change one value, everything updates
theme: SDTheme.withSeed(Color(0xFF4A90D9))
darkTheme: SDTheme.withSeed(Color(0xFF4A90D9), brightness: Brightness.dark)
```

In every component, colors are read from the active theme — never hardcoded:

```dart
// Always — never hardcode
Theme.of(context).colorScheme.surface
Theme.of(context).colorScheme.primary
Theme.of(context).textTheme.bodyMedium
```

---

## Components — v0.3

### SDButton

```dart
// 4 variants
SDButton.primary(label: 'Save', onPressed: () {})
SDButton.secondary(label: 'Cancel', onPressed: () {})
SDButton.ghost(label: 'Skip', onPressed: () {})
SDButton.danger(label: 'Delete', onPressed: () {})

// States
SDButton.primary(label: 'Saving…', onPressed: null, loading: true)  // loading
SDButton.primary(label: 'Disabled', onPressed: null)                // disabled

// With icon
SDButton.primary(label: 'Add', onPressed: () {}, leadingIcon: Icons.add)

// Full width
SDButton.primary(label: 'Continue', onPressed: () {}, fullWidth: true)
```

All variants enforce a 48dp minimum touch target and include `Semantics` automatically.

### SDText

```dart
SDText.displayLg('Big Title')
SDText.heading1('Page Title')
SDText.heading2('Section')
SDText.heading3('Subsection')
SDText.bodyLg('Intro paragraph')
SDText.body('Standard body text')
SDText.bodySm('Fine print')
SDText.label('FIELD LABEL')
SDText.caption('Last updated today')

// With overrides
SDText.body('Muted text', color: Theme.of(context).colorScheme.onSurfaceVariant)
SDText.body('Centered', textAlign: TextAlign.center)
SDText.body('Truncated', maxLines: 2, overflow: TextOverflow.ellipsis)
```

### SDIconLabel

```dart
// Icon and label — always together, never a bare Icon()
SDIconLabel(icon: Icons.home, label: 'Home')
SDIconLabel(icon: Icons.settings, label: 'Settings', iconSize: 16)
```

### SDDivider

```dart
SDDivider.horizontal()
SDDivider.vertical(height: 24)
```

### SDSpinner

```dart
SDSpinner()                           // 24dp, theme primary color
SDSpinner(size: 20, color: Colors.white)  // inside buttons
```

### SDTextField

```dart
SDTextField(label: 'Email', hint: 'you@example.com', onChanged: (v) {})
SDTextField(label: 'Name', errorText: 'Required')         // error state
SDTextField(label: 'Locked', enabled: false)              // disabled
SDTextField(label: 'Password', obscureText: true, validator: (v) => v!.isEmpty ? 'Required' : null)
```

### SDDropdown

```dart
SDDropdown<String>(
  label: 'Country',
  items: [SDDropdownItem(value: 'us', label: 'United States')],
  value: _country,
  onChanged: (v) => setState(() => _country = v),
)
```

### SDMultiSelect

```dart
SDMultiSelect<String>(
  label: 'Tags',
  items: [SDDropdownItem(value: 'dart', label: 'Dart')],
  selected: _selected,
  onChanged: (v) => setState(() => _selected = v),
)
```

### SDCheckbox / SDRadioGroup / SDSwitch

```dart
SDCheckbox(label: 'Accept terms', value: _checked, onChanged: (v) {})

SDRadioGroup<String>(
  label: 'Plan',
  value: _plan,
  options: [SDRadioOption(value: 'free', label: 'Free')],
  onChanged: (v) {},
)

SDSwitch(label: 'Notifications', value: _on, onChanged: (v) {})
```

### SDSlider / SDDatePicker / SDForm

```dart
SDSlider(value: _volume, onChanged: (v) {}, min: 0, max: 1, divisions: 10)

SDDatePicker(label: 'Birth date', value: _date, onChanged: (d) {})

final _key = GlobalKey<FormState>();
SDForm(
  formKey: _key,
  child: Column(children: [
    SDTextField(label: 'Name', validator: (v) => v!.isEmpty ? 'Required' : null),
    SDButton.primary(label: 'Submit', onPressed: () => _key.currentState!.validate()),
  ]),
)
```

---

### SDCard

```dart
SDCard.elevated(child: Text('Elevated card'))
SDCard.filled(child: Text('Filled card'))
SDCard.outlined(child: Text('Outlined card'))
SDCard.elevated(child: Text('Tappable'), onTap: () {})   // adds ripple
```

### SDListItem

```dart
SDListItem(title: 'Simple row')
SDListItem(title: 'Jane Smith', subtitle: 'Admin', leading: SDAvatar.initials(initials: 'JS'))
SDListItem(title: 'Alerts', trailing: SDBadge.count(count: 3), onTap: () {})
```

### SDTable

```dart
SDTable(
  columns: [SDTableColumn(label: 'Name'), SDTableColumn(label: 'Score', numeric: true)],
  rows: [[Text('Alice'), Text('95')], [Text('Bob'), Text('87')]],
)
```

### SDBadge / SDAvatar / SDChip / SDTag

```dart
SDBadge.count(count: 5)    // numbered circle
SDBadge.count(count: 120)  // shows "99+"
SDBadge.dot()              // 8dp dot

SDAvatar.initials(initials: 'JS')
SDAvatar.icon(icon: Icons.person)
SDAvatar.image(image: NetworkImage('https://...'))

SDChip.filter(label: 'Flutter', selected: _sel, onSelected: (v) {})
SDChip.action(label: 'Share', onPressed: () {})
SDChip.input(label: 'dart', onDeleted: () {})

SDTag(label: 'Active')
SDTag(label: 'Error', color: Theme.of(context).colorScheme.errorContainer)
```

---

## Animation Tokens

```dart
SDAnimation.fast    // 100ms — hover, press feedback
SDAnimation.normal  // 200ms — expand, collapse
SDAnimation.slow    // 350ms — modals, page transitions
SDAnimation.curve   // Curves.easeInOut

// Usage
AnimatedContainer(duration: SDAnimation.normal, curve: SDAnimation.curve, ...)
```

---

## Design Rules

Every component follows these rules — no exceptions:

1. **Theme only** — no hardcoded colors, sizes, or spacing
2. **All 5 states** — default → focused → pressed → loading → disabled
3. **48dp minimum touch target** — enforced on all interactive components
4. **Icon + label always together** — use `SDIconLabel`, never a bare `Icon()`
5. **Semantics on every interactive widget**

---

## Roadmap

See [CHANGELOG.md](CHANGELOG.md) for the full version history and upcoming milestones.

| Version | Components |
|---|---|
| **v0.1** ✅ | Tokens, SDTheme, SDButton, SDText, SDIconLabel, SDDivider, SDSpinner |
| **v0.2** ✅ | SDTextField, SDDropdown, SDMultiSelect, SDCheckbox, SDRadioGroup, SDSwitch, SDSlider, SDDatePicker, SDForm |
| **v0.3** ✅ | SDCard, SDListItem, SDTable, SDBadge, SDAvatar, SDChip, SDTag |
| v0.4 | SDAlert, SDModal, SDSnackbar, SDToast, SDBottomSheet, SDProgressBar |
| v0.5 | SDAppBar, SDTabs, SDBottomNav, SDDrawer, SDBreadcrumb |
| v0.6 | SDAccordion, SDCarousel, SDBentoBox, SDEmptyState |
| v0.7 | SDSplashScreen, SDLoginScreen, SDRegisterScreen, SDOnboardingScreen |
| v1.0 | Full release |

---

## Requirements

- Flutter 3.10+
- Dart 3.0+
