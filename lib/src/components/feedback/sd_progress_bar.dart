import 'package:flutter/material.dart';

/// A linear progress indicator.
///
/// Pass [value] for determinate (0.0–1.0), or omit for indeterminate.
///
/// ```dart
/// SDProgressBar()                    // indeterminate
/// SDProgressBar(value: 0.6)          // 60% complete
/// SDProgressBar(value: 0.4, label: 'Uploading...')
/// ```
class SDProgressBar extends StatelessWidget {
  const SDProgressBar({
    super.key,
    this.value,
    this.label,
  });

  final double? value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label!, style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant)),
              if (value != null)
                Text(
                  '${(value! * 100).round()}%',
                  style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                ),
            ],
          ),
          const SizedBox(height: 6),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}