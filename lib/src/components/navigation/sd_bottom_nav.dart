import 'package:flutter/material.dart';

/// An item definition for [SDBottomNav].
class SDBottomNavItem {
  const SDBottomNavItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
}

/// A themed Material 3 bottom navigation bar.
///
/// Wraps [NavigationBar]. Use as [Scaffold.bottomNavigationBar].
///
/// ```dart
/// int _index = 0;
///
/// Scaffold(
///   bottomNavigationBar: SDBottomNav(
///     selectedIndex: _index,
///     onDestinationSelected: (i) => setState(() => _index = i),
///     items: [
///       SDBottomNavItem(label: 'Home',   icon: Icons.home_outlined,   selectedIcon: Icons.home),
///       SDBottomNavItem(label: 'Search', icon: Icons.search_outlined,  selectedIcon: Icons.search),
///       SDBottomNavItem(label: 'Profile', icon: Icons.person_outlined, selectedIcon: Icons.person),
///     ],
///   ),
/// )
/// ```
class SDBottomNav extends StatelessWidget {
  const SDBottomNav({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final List<SDBottomNavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: items
          .map((item) => NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon:
                    item.selectedIcon != null ? Icon(item.selectedIcon) : null,
                label: item.label,
              ))
          .toList(),
    );
  }
}
