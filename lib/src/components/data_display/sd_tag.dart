import 'package:flutter/material.dart';

/// A non-interactive status label.
///
/// ```dart
/// SDTag(label: 'Active')
/// SDTag(label: 'Beta', color: Theme.of(context).colorScheme.tertiaryContainer)
/// ```
class SDTag extends StatelessWidget {
  const SDTag({super.key, required this.label, this.color});

  final String label;

  /// Background color. Defaults to [ColorScheme.secondaryContainer].
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = color ?? cs.secondaryContainer;
    final fg = color != null ? cs.onSurface : cs.onSecondaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: fg),
      ),
    );
  }
}
