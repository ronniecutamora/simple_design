import 'package:flutter/material.dart';

/// An item definition for [SDDrawer].
class SDDrawerItem {
  const SDDrawerItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final VoidCallback? onTap;
}

/// A themed Material 3 navigation drawer.
///
/// Wraps [NavigationDrawer]. Use as [Scaffold.drawer] or [Scaffold.endDrawer].
///
/// ```dart
/// Scaffold(
///   drawer: SDDrawer(
///     header: Text('My App'),
///     selectedIndex: _drawerIndex,
///     items: [
///       SDDrawerItem(label: 'Home',     icon: Icons.home_outlined,     selectedIcon: Icons.home,     onTap: () {}),
///       SDDrawerItem(label: 'Settings', icon: Icons.settings_outlined, selectedIcon: Icons.settings, onTap: () {}),
///     ],
///     onDestinationSelected: (i) => setState(() => _drawerIndex = i),
///   ),
/// )
/// ```
class SDDrawer extends StatelessWidget {
  const SDDrawer({
    super.key,
    required this.items,
    this.selectedIndex,
    this.header,
    this.onDestinationSelected,
  });

  final List<SDDrawerItem> items;
  final int? selectedIndex;
  final Widget? header;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        onDestinationSelected?.call(index);
        items[index].onTap?.call();
      },
      children: [
        if (header != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: header,
          ),
        ...items
            .map((item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  selectedIcon: item.selectedIcon != null
                      ? Icon(item.selectedIcon)
                      : null,
                  label: Text(item.label),
                ))
            ,
      ],
    );
  }
}
