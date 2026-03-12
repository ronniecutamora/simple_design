import 'package:flutter/material.dart';

/// A single themed list row.
///
/// ```dart
/// SDListItem(title: 'Jane Smith', subtitle: 'Admin', leading: SDAvatar.initials(initials: 'JS'))
/// SDListItem(title: 'Notifications', trailing: SDBadge.count(count: 3), onTap: () {})
/// ```
class SDListItem extends StatelessWidget {
  const SDListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.enabled = true,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: leading,
      trailing: trailing,
      onTap: enabled ? onTap : null,
      enabled: enabled,
    );
  }
}
