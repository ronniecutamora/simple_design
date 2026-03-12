import 'package:flutter/material.dart';

/// A horizontal tab bar with associated content views.
///
/// Manages its own [DefaultTabController] internally — no setup needed.
///
/// ```dart
/// SDTabs(
///   tabs: ['Overview', 'Details', 'Reviews'],
///   children: [
///     Center(child: Text('Overview content')),
///     Center(child: Text('Details content')),
///     Center(child: Text('Reviews content')),
///   ],
/// )
/// ```
class SDTabs extends StatelessWidget {
  const SDTabs({
    super.key,
    required this.tabs,
    required this.children,
    this.contentHeight = 160,
  }) : assert(tabs.length == children.length);

  final List<String> tabs;
  final List<Widget> children;

  /// Height of the [TabBarView] section. Defaults to 160.
  final double contentHeight;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            tabs: tabs.map((t) => Tab(text: t)).toList(),
          ),
          SizedBox(
            height: contentHeight,
            child: TabBarView(children: children),
          ),
        ],
      ),
    );
  }
}
