import 'package:flutter/material.dart';
import '../../tokens/sd_semantic_colors.dart';

/// Shows a themed snackbar via [ScaffoldMessenger].
///
/// ```dart
/// SDSnackbar.show(context, message: 'Changes saved');
/// SDSnackbar.showSuccess(context, message: 'Profile updated!');
/// SDSnackbar.showInfo(context, message: 'Sync in progress…');
/// SDSnackbar.showWarning(context, message: 'Storage almost full');
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

  static void showSuccess(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final sc = Theme.of(context).extension<SDSemanticColors>()!;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: sc.onSuccess)),
          backgroundColor: sc.success,
          behavior: SnackBarBehavior.floating,
          action: actionLabel != null
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: sc.onSuccess,
                  disabledTextColor: sc.onSuccess.withValues(alpha: 0.5),
                  onPressed: onAction ?? () {},
                )
              : null,
        ),
      );
  }

  static void showInfo(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final sc = Theme.of(context).extension<SDSemanticColors>()!;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: sc.onInfo)),
          backgroundColor: sc.info,
          behavior: SnackBarBehavior.floating,
          action: actionLabel != null
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: sc.onInfo,
                  disabledTextColor: sc.onInfo.withValues(alpha: 0.5),
                  onPressed: onAction ?? () {},
                )
              : null,
        ),
      );
  }

  static void showWarning(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final sc = Theme.of(context).extension<SDSemanticColors>()!;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: sc.onWarning)),
          backgroundColor: sc.warning,
          behavior: SnackBarBehavior.floating,
          action: actionLabel != null
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: sc.onWarning,
                  disabledTextColor: sc.onWarning.withValues(alpha: 0.5),
                  onPressed: onAction ?? () {},
                )
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
