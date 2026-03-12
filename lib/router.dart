import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_design/screens/home/home.screen.dart';
import 'package:simple_design/screens/buttons/buttons.screen.dart';
import 'package:simple_design/screens/forms/forms.screen.dart';
import 'package:simple_design/screens/cards/cards.screen.dart';
import 'package:simple_design/screens/data_display/data_display.screen.dart';
import 'package:simple_design/screens/typography/typography.screen.dart';
import 'package:simple_design/screens/navigation_showcase/navigation_showcase.screen.dart';
import 'package:simple_design/screens/feedback/feedback.screen.dart';
import 'package:simple_design/widgets/showcase_shell.dart';

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: globalNavigatorKey,
  initialLocation: HomeScreen.routeName,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ShowcaseShell(navigationShell: navigationShell),
      branches: [
        // index 0 — Home
        StatefulShellBranch(routes: [
          GoRoute(path: HomeScreen.routeName, builder: (ctx, state) => const HomeScreen()),
        ]),
        // index 1 — Buttons
        StatefulShellBranch(routes: [
          GoRoute(path: ButtonsScreen.routeName, builder: (ctx, state) => const ButtonsScreen()),
        ]),
        // index 2 — Forms
        StatefulShellBranch(routes: [
          GoRoute(path: FormsScreen.routeName, builder: (ctx, state) => const FormsScreen()),
        ]),
        // index 3 — Cards
        StatefulShellBranch(routes: [
          GoRoute(path: CardsScreen.routeName, builder: (ctx, state) => const CardsScreen()),
        ]),
        // index 4 — Data Display
        StatefulShellBranch(routes: [
          GoRoute(path: DataDisplayScreen.routeName, builder: (ctx, state) => const DataDisplayScreen()),
        ]),
        // index 5 — Typography (placeholder, v0.5)
        StatefulShellBranch(routes: [
          GoRoute(path: TypographyScreen.routeName, builder: (ctx, state) => const TypographyScreen()),
        ]),
        // index 6 — Navigation (placeholder, v0.5)
        StatefulShellBranch(routes: [
          GoRoute(path: NavigationShowcaseScreen.routeName, builder: (ctx, state) => const NavigationShowcaseScreen()),
        ]),
        // index 7 — Feedback (v0.4)
        StatefulShellBranch(routes: [
          GoRoute(path: FeedbackScreen.routeName, builder: (ctx, state) => const FeedbackScreen()),
        ]),
      ],
    ),
  ],
);