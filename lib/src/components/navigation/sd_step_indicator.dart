import 'package:flutter/material.dart';

/// A horizontal multi-step progress indicator.
///
/// ```dart
/// SDStepIndicator(
///   steps: ['Account', 'Details', 'Confirm'],
///   currentStep: 1,   // 0-based; 0 = first step
/// )
/// ```
class SDStepIndicator extends StatelessWidget {
  const SDStepIndicator({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<String> steps;

  /// 0-based index of the current step.
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Row(
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          if (i > 0)
            Expanded(
              child: Container(
                height: 2,
                color: i <= currentStep
                    ? cs.primary
                    : cs.surfaceContainerHighest,
              ),
            ),
          _SDStepCircle(
            index: i,
            label: steps[i],
            state: i < currentStep
                ? _SDStepState.completed
                : i == currentStep
                    ? _SDStepState.active
                    : _SDStepState.upcoming,
            cs: cs,
            tt: tt,
          ),
        ],
      ],
    );
  }
}

enum _SDStepState { completed, active, upcoming }

class _SDStepCircle extends StatelessWidget {
  const _SDStepCircle({
    required this.index,
    required this.label,
    required this.state,
    required this.cs,
    required this.tt,
  });

  final int index;
  final String label;
  final _SDStepState state;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final bg = state == _SDStepState.upcoming
        ? cs.surfaceContainerHighest
        : cs.primary;
    final fg = state == _SDStepState.upcoming ? cs.onSurfaceVariant : cs.onPrimary;
    final labelColor = state == _SDStepState.upcoming
        ? cs.onSurfaceVariant
        : cs.onSurface;

    return Semantics(
      label: '$label, step ${index + 1}${state == _SDStepState.completed ? ', completed' : state == _SDStepState.active ? ', current' : ''}',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: state == _SDStepState.completed
                ? Icon(Icons.check, size: 16, color: fg)
                : Text(
                    '${index + 1}',
                    style: tt.labelMedium
                        ?.copyWith(color: fg, fontWeight: FontWeight.bold),
                  ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: tt.labelSmall?.copyWith(color: labelColor),
          ),
        ],
      ),
    );
  }
}
