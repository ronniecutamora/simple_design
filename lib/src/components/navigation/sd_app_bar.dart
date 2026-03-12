import 'package:flutter/material.dart';

/// A themed app bar implementing [PreferredSizeWidget].
///
/// ```dart
/// Scaffold(
///   appBar: SDAppBar(title: 'Home'),
/// )
/// Scaffold(
///   appBar: SDAppBar(
///     title: 'Search',
///     actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
///   ),
/// )
/// ```
class SDAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SDAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = false,
    this.bottom,
  });

  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;

  /// Optional widget placed below the toolbar (e.g. a [TabBar]).
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      leading: leading,
      centerTitle: centerTitle,
      bottom: bottom,
    );
  }
}
