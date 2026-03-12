import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Persistent navigation shell for the showcase app.
///
/// Uses [NavigationDrawer] (M3) to support all 10 showcase pages
/// without crowding. Replaces the previous [NavigationBar] which
/// is capped at 5 destinations.
class ShowcaseShell extends StatelessWidget {
  const ShowcaseShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _destinations = [
    // ── Foundation ───────────────────────────────────────────
    NavigationDrawerDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: Text('Home'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.smart_button_outlined),
      selectedIcon: Icon(Icons.smart_button),
      label: Text('Buttons'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.edit_note_outlined),
      selectedIcon: Icon(Icons.edit_note),
      label: Text('Forms'),
    ),
    // ── Data Display ─────────────────────────────────────────
    NavigationDrawerDestination(
      icon: Icon(Icons.style_outlined),
      selectedIcon: Icon(Icons.style),
      label: Text('Cards'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.table_chart_outlined),
      selectedIcon: Icon(Icons.table_chart),
      label: Text('Data Display'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.text_fields_outlined),
      selectedIcon: Icon(Icons.text_fields),
      label: Text('Typography'),
    ),
    // ── Interaction ──────────────────────────────────────────
    NavigationDrawerDestination(
      icon: Icon(Icons.navigation_outlined),
      selectedIcon: Icon(Icons.navigation),
      label: Text('Navigation'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.notifications_outlined),
      selectedIcon: Icon(Icons.notifications),
      label: Text('Feedback'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.dashboard_outlined),
      selectedIcon: Icon(Icons.dashboard),
      label: Text('Layout'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.login_outlined),
      selectedIcon: Icon(Icons.login),
      label: Text('Entry Screens'),
    ),
  ];

  // Maps drawer index → section label index offset.
  // Dividers and headers inserted via _buildChildren() shift
  // the raw list index — this keeps goBranch in sync.
  void _onDestinationSelected(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    Navigator.of(context).pop(); // close drawer after selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Design')),
      drawer: NavigationDrawer(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) =>
            _onDestinationSelected(context, index),
        children: [
          // ── Drawer header ───────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 0),
            child: Text(
              'Simple Design',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          const SizedBox(height: 12),

          // ── Foundation ─────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 8, 16, 4),
            child: Text(
              'Foundation',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                    letterSpacing: 1.2,
                  ),
            ),
          ),
          _destinations[0], // Home
          _destinations[1], // Buttons
          _destinations[2], // Forms

          const Divider(indent: 28, endIndent: 28),

          // ── Data Display ───────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 8, 16, 4),
            child: Text(
              'Display',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                    letterSpacing: 1.2,
                  ),
            ),
          ),
          _destinations[3], // Cards
          _destinations[4], // Data Display
          _destinations[5], // Typography

          const Divider(indent: 28, endIndent: 28),

          // ── Interaction ────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 8, 16, 4),
            child: Text(
              'Interaction',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                    letterSpacing: 1.2,
                  ),
            ),
          ),
          _destinations[6], // Navigation
          _destinations[7], // Feedback
          _destinations[8], // Layout
          _destinations[9], // Entry Screens

          const SizedBox(height: 12),
        ],
      ),
      body: navigationShell,
    );
  }
}