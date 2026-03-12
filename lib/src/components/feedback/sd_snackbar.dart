import 'package:flutter/material.dart';

/// Shows a themed snackbar via [ScaffoldMessenger].
///
/// ```dart
/// SDSnackbar.show(context, message: 'Changes saved');
/// SDSnackbar.show(context, message: 'Item deleted', actionLabel: 'Undo', onAction: () {});
/// SDSnackbar.showError(context, message: 'Failed to save');
/// ```
class SDSnackbar {
  SDSnackbar._();

  static void show(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration,
          behavior: SnackBarBehavior.floating,
          action: actionLabel != null
              ? SnackBarAction(label: actionLabel, onPressed: onAction ?? () {})
              : null,
        ),
      );
  }

  static void showError(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final cs = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: cs.onError)),
          backgroundColor: cs.error,
          behavior: SnackBarBehavior.floating,
          action: actionLabel != null
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: cs.onError,
                  disabledTextColor: cs.onError.withValues(alpha: 0.5),
                  onPressed: onAction ?? () {},
                )
              : null,
        ),
      );
  }
}