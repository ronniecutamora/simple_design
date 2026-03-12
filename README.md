# simple_design

A clean, minimal Flutter design system. Any component works in 1–2 lines. Colors and typography come from Flutter's built-in theme system — no hardcoded values ever.

**Current version:** v0.7.0 — Entry Screens

---

## Install

```yaml
# pubspec.yaml
dependencies:
  simple_design:
    git:
      url: https://github.com/your-org/sd_flutter.git
      ref: v0.7.0
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

## Components — v0.5

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

### v0.4 — Feedback

#### SDAlert

```dart
SDAlert.info(message: 'Session expires soon.')
SDAlert.success(message: 'Profile updated!', title: 'Done')
SDAlert.warning(message: 'Storage almost full.', onDismiss: () {})
SDAlert.error(message: 'Connection failed.', title: 'Error', onDismiss: () {})
```

#### SDModal

```dart
SDModal.show(context, title: 'Save?', body: 'Unsaved changes will be lost.', onConfirm: () {})
SDModal.showDestructive(context, title: 'Delete?', body: 'This cannot be undone.', onConfirm: () {})
```

#### SDSnackbar

```dart
SDSnackbar.show(context, message: 'Changes saved')
SDSnackbar.show(context, message: 'Item deleted', actionLabel: 'Undo', onAction: () {})
SDSnackbar.showError(context, message: 'Failed to save')  // cs.error bg, cs.onError text
```

#### SDToast

```dart
SDToast.show(context, message: 'Copied to clipboard')
SDToast.show(context, message: 'Upload complete', icon: Icons.cloud_done_outlined)
```

#### SDBottomSheet

```dart
SDBottomSheet.show(context, title: 'Options', child: Column(children: [...]))
```

#### SDProgressBar

```dart
SDProgressBar()                                // indeterminate
SDProgressBar(value: 0.6)                      // 60%
SDProgressBar(value: 0.4, label: 'Uploading…') // with label + %
```

#### SDSkeletonLoader

```dart
SDSkeletonLoader(width: double.infinity, height: 16)    // text line
SDSkeletonLoader(width: 48, height: 48, circular: true) // avatar
SDSkeletonLoader.card()                                  // card preset
```

---

### v0.5 — Navigation

#### SDAppBar

```dart
Scaffold(appBar: SDAppBar(title: 'Home'))
Scaffold(appBar: SDAppBar(title: 'Search', actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})]))
Scaffold(appBar: SDAppBar(title: 'Details', leading: BackButton(), centerTitle: true))
```

#### SDTabs

```dart
SDTabs(
  tabs: ['Overview', 'Details', 'Reviews'],
  children: [Text('Tab 1'), Text('Tab 2'), Text('Tab 3')],
)
SDTabs(tabs: ['A', 'B'], children: [...], contentHeight: 200)
```

#### SDBottomNav

```dart
Scaffold(
  bottomNavigationBar: SDBottomNav(
    selectedIndex: _index,
    onDestinationSelected: (i) => setState(() => _index = i),
    items: [
      SDBottomNavItem(label: 'Home',   icon: Icons.home_outlined,   selectedIcon: Icons.home),
      SDBottomNavItem(label: 'Search', icon: Icons.search_outlined, selectedIcon: Icons.search),
    ],
  ),
)
```

#### SDDrawer

```dart
Scaffold(
  drawer: SDDrawer(
    header: Text('My App'),
    selectedIndex: _drawerIndex,
    items: [
      SDDrawerItem(label: 'Home',     icon: Icons.home_outlined,     selectedIcon: Icons.home,     onTap: () {}),
      SDDrawerItem(label: 'Settings', icon: Icons.settings_outlined, selectedIcon: Icons.settings, onTap: () {}),
    ],
    onDestinationSelected: (i) => setState(() => _drawerIndex = i),
  ),
)
```

#### SDBreadcrumb

```dart
SDBreadcrumb(items: [
  SDBreadcrumbItem(label: 'Home',     onTap: () {}),
  SDBreadcrumbItem(label: 'Settings', onTap: () {}),
  SDBreadcrumbItem(label: 'Profile'),  // current — no onTap
])
```

#### SDStepIndicator

```dart
SDStepIndicator(
  steps: ['Account', 'Profile', 'Confirm'],
  currentStep: 1,  // 0-based
)
```

---

### v0.6 — Layout

#### SDDividerLabel

```dart
SDDividerLabel(label: 'OR')
SDDividerLabel(label: 'TODAY')
SDDividerLabel(label: 'Section Title', style: Theme.of(context).textTheme.labelSmall)
```

#### SDAccordion

```dart
SDAccordion(
  items: [
    SDAccordionItem(title: 'What is Flutter?',   child: Text('A UI toolkit by Google.')),
    SDAccordionItem(title: 'Why use this package?', child: Text('1–2 line components.')),
  ],
)

// Allow multiple panels open at once
SDAccordion(allowMultiple: true, items: [...])
```

#### SDCarousel

```dart
// Full-width slides
SDCarousel(
  height: 200,
  children: [Image.network('...'), Image.network('...'), Image.network('...')],
)

// Peeking effect — partially show adjacent slides
SDCarousel(height: 180, viewportFraction: 0.85, children: [...])
```

#### SDBentoBox

```dart
SDBentoBox(
  columns: 2,
  gap: 12,
  items: [
    SDBentoItem(flex: 2, rowHeight: 160, child: Text('Wide cell')),
    SDBentoItem(flex: 1, rowHeight: 160, child: Text('Narrow cell')),
    SDBentoItem(flex: 1, rowHeight: 120, child: Text('Cell C')),
    SDBentoItem(flex: 1, rowHeight: 120, child: Text('Cell D')),
  ],
)
```

#### SDEmptyState

```dart
SDEmptyState(
  icon: Icons.inbox_outlined,
  title: 'Nothing here yet',
  message: 'Your saved items will appear here.',
)

// With action
SDEmptyState(
  icon: Icons.search_off_outlined,
  title: 'No results',
  message: 'Try a different search term.',
  action: SDButton.primary(label: 'Clear search', onPressed: () {}),
)
```

---

### v0.7 — Entry Screens

All entry screens accept a `Widget? logo` parameter that takes any widget — `Image.asset`, `SvgPicture.asset`, `FlutterLogo`, `Icon`, etc.

#### SDSplashScreen

```dart
// Minimal — no logo, auto-navigates after 2 seconds
SDSplashScreen(onComplete: () => context.go('/home'))

// With logo and title
SDSplashScreen(
  logo: Image.asset('assets/logo.png', width: 120),
  title: 'My App',
  duration: const Duration(seconds: 3),
  onComplete: () => context.go('/home'),
)
```

#### SDLoginScreen

```dart
// Minimal
SDLoginScreen(
  onLogin: (email, password) async { /* authenticate */ },
)

// Full
SDLoginScreen(
  logo: FlutterLogo(size: 64),
  title: 'Welcome back',
  subtitle: 'Sign in to continue',
  onLogin: (email, password) async { /* authenticate */ },
  onForgotPassword: () => context.go('/forgot-password'),
  onRegister: () => context.go('/register'),
)
```

#### SDRegisterScreen

```dart
SDRegisterScreen(
  logo: Image.asset('assets/logo.png', width: 80),
  title: 'Create account',
  subtitle: 'Join us today',
  onRegister: (name, email, password) async { /* create account */ },
  onLogin: () => context.go('/login'),
)
```

#### SDForgotPasswordScreen

```dart
SDForgotPasswordScreen(
  logo: FlutterLogo(size: 64),
  onSendLink: (email) async { /* send reset email */ },
  onBack: () => context.go('/login'),
)
```

#### SDOnboardingScreen

```dart
SDOnboardingScreen(
  pages: [
    SDOnboardingPage(
      title: 'Welcome',
      body: 'Discover what the app can do.',
      image: Image.asset('assets/onboarding_1.png'),
    ),
    SDOnboardingPage(
      title: 'Stay organised',
      body: 'Everything in one place.',
      image: Image.asset('assets/onboarding_2.png'),
    ),
    SDOnboardingPage(
      title: "You're ready",
      body: "Let's get started.",
    ),
  ],
  onComplete: () => context.go('/home'),
  onSkip: () => context.go('/home'),
)
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
| **v0.4** ✅ | SDAlert, SDModal, SDSnackbar, SDToast, SDBottomSheet, SDProgressBar, SDSkeletonLoader |
| **v0.5** ✅ | SDAppBar, SDTabs, SDBottomNav, SDDrawer, SDBreadcrumb, SDStepIndicator |
| **v0.6** ✅ | SDDividerLabel, SDAccordion, SDCarousel, SDBentoBox, SDEmptyState |
| **v0.7** ✅ | SDSplashScreen, SDLoginScreen, SDRegisterScreen, SDForgotPasswordScreen, SDOnboardingScreen |
| v1.0 | Full release |

---

## Requirements

- Flutter 3.10+
- Dart 3.0+
