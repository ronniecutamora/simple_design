import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_design/screens/home/home.screen.dart';
import 'package:simple_design/screens/buttons/buttons.screen.dart';
import 'package:simple_design/screens/forms/forms.screen.dart';
import 'package:simple_design/screens/cards/cards.screen.dart';
import 'package:simple_design/screens/data_display/data_display.screen.dart';
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
        StatefulShellBranch(routes: [
          GoRoute(
            path: HomeScreen.routeName,
            builder: (context, state) => const HomeScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: ButtonsScreen.routeName,
            builder: (context, state) => const ButtonsScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: FormsScreen.routeName,
            builder: (context, state) => const FormsScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: CardsScreen.routeName,
            builder: (context, state) => const CardsScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: DataDisplayScreen.routeName,
            builder: (context, state) => const DataDisplayScreen(),
          ),
        ]),
      ],
    ),
  ],
);
