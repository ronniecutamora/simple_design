import 'package:flutter/material.dart';
import 'package:simple_design/simple_design.dart';

class NavigationShowcaseScreen extends StatefulWidget {
  const NavigationShowcaseScreen({super.key});
  static const routeName = '/navigation';

  @override
  State<NavigationShowcaseScreen> createState() =>
      _NavigationShowcaseScreenState();
}

class _NavigationShowcaseScreenState extends State<NavigationShowcaseScreen> {
  int _bottomNavIndex = 0;
  int _currentStep = 0;
  int _drawerIndex = 0;

  static const _steps = ['Account', 'Profile', 'Confirm'];

  static const _drawerItems = [
    SDDrawerItem(label: 'Home',     icon: Icons.home_outlined,     selectedIcon: Icons.home),
    SDDrawerItem(label: 'Explore',  icon: Icons.explore_outlined,  selectedIcon: Icons.explore),
    SDDrawerItem(label: 'Saved',    icon: Icons.bookmark_outlined, selectedIcon: Icons.bookmark),
    SDDrawerItem(label: 'Settings', icon: Icons.settings_outlined, selectedIcon: Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SDAppBar used as the real app bar for this screen
      appBar: SDAppBar(
        title: 'Navigation',
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () =>
                SDSnackbar.show(context, message: 'SDAppBar in action'),
          ),
        ],
      ),
      endDrawer: SDDrawer(
        header: SDText.label('MY APP'),
        selectedIndex: _drawerIndex,
        items: _drawerItems,
        onDestinationSelected: (i) {
          setState(() => _drawerIndex = i);
          Navigator.of(context).pop();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ── SDAppBar ────────────────────────────────────────────────────
          SDText.heading3('AppBar'),
          const SizedBox(height: 8),
          SDText.bodySm('This screen\'s title bar is SDAppBar. Variants:'),
          const SizedBox(height: 12),
          _MockAppBar(child: SDAppBar(title: 'Default')),
          const SizedBox(height: 8),
          _MockAppBar(
            child: SDAppBar(
              title: 'With Actions',
              actions: [
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _MockAppBar(
            child: SDAppBar(
              title: 'Centered',
              centerTitle: true,
              leading: const BackButton(),
            ),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDTabs ──────────────────────────────────────────────────────
          SDText.heading3('Tabs'),
          const SizedBox(height: 12),
          SDCard.outlined(
            padding: EdgeInsets.zero,
            child: SDTabs(
              tabs: const ['Overview', 'Details', 'Reviews'],
              contentHeight: 140,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SDText.body('Overview content — tab 1'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SDText.body('Details content — tab 2'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SDText.body('Reviews content — tab 3'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDBottomNav ─────────────────────────────────────────────────
          SDText.heading3('Bottom Nav'),
          const SizedBox(height: 12),
          SDCard.outlined(
            padding: EdgeInsets.zero,
            child: SDBottomNav(
              selectedIndex: _bottomNavIndex,
              onDestinationSelected: (i) =>
                  setState(() => _bottomNavIndex = i),
              items: const [
                SDBottomNavItem(label: 'Home',    icon: Icons.home_outlined,     selectedIcon: Icons.home),
                SDBottomNavItem(label: 'Search',  icon: Icons.search_outlined,   selectedIcon: Icons.search),
                SDBottomNavItem(label: 'Saved',   icon: Icons.bookmark_outlined, selectedIcon: Icons.bookmark),
                SDBottomNavItem(label: 'Profile', icon: Icons.person_outlined,   selectedIcon: Icons.person),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDDrawer ────────────────────────────────────────────────────
          SDText.heading3('Drawer'),
          const SizedBox(height: 12),
          SDButton.secondary(
            label: 'Open Drawer',
            leadingIcon: Icons.menu,
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
          const SizedBox(height: 8),
          SDText.bodySm('Selected: ${_drawerItems[_drawerIndex].label}'),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDBreadcrumb ────────────────────────────────────────────────
          SDText.heading3('Breadcrumb'),
          const SizedBox(height: 12),
          SDBreadcrumb(items: [
            SDBreadcrumbItem(label: 'Home', onTap: () {}),
            SDBreadcrumbItem(label: 'Docs', onTap: () {}),
            const SDBreadcrumbItem(label: 'Components'),
          ]),
          const SizedBox(height: 8),
          SDBreadcrumb(items: [
            SDBreadcrumbItem(label: 'Dashboard', onTap: () {}),
            SDBreadcrumbItem(label: 'Settings', onTap: () {}),
            SDBreadcrumbItem(label: 'Team', onTap: () {}),
            const SDBreadcrumbItem(label: 'Members'),
          ]),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDStepIndicator ─────────────────────────────────────────────
          SDText.heading3('Step Indicator'),
          const SizedBox(height: 16),
          SDStepIndicator(steps: _steps, currentStep: _currentStep),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SDButton.secondary(
                label: 'Back',
                onPressed: _currentStep > 0
                    ? () => setState(() => _currentStep--)
                    : null,
              ),
              const SizedBox(width: 12),
              SDButton.primary(
                label: _currentStep < _steps.length - 1 ? 'Next' : 'Finish',
                onPressed: _currentStep < _steps.length - 1
                    ? () => setState(() => _currentStep++)
                    : () {
                        setState(() => _currentStep = 0);
                        SDSnackbar.show(context, message: 'All steps complete!');
                      },
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Clips an [SDAppBar] into a contained block for inline showcase display.
class _MockAppBar extends StatelessWidget {
  const _MockAppBar({required this.child});
  final SDAppBar child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: child.preferredSize.height,
        child: child,
      ),
    );
  }
}
