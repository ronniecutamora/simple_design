import 'package:flutter/material.dart';

enum _SDBadgeVariant { count, dot }

/// A small indicator badge.
///
/// ```dart
/// SDBadge.count(count: 5)    // circle with number
/// SDBadge.count(count: 120)  // shows "99+"
/// SDBadge.dot()              // 8dp dot
/// ```
class SDBadge extends StatelessWidget {
  const SDBadge.count({required this.count, super.key})
      : _variant = _SDBadgeVariant.count;

  const SDBadge.dot({super.key})
      : _variant = _SDBadgeVariant.dot,
        count = null;

  final _SDBadgeVariant _variant;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    if (_variant == _SDBadgeVariant.dot) {
      return Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: cs.error,
          shape: BoxShape.circle,
        ),
      );
    }

    final label = (count ?? 0) > 99 ? '99+' : '${count ?? 0}';

    return IntrinsicWidth(
      child: Container(
        constraints: const BoxConstraints(minWidth: 20),
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: cs.error,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: cs.onError,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
