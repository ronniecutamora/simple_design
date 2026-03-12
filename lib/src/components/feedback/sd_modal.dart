import 'package:flutter/material.dart';

/// Shows a Material 3 dialog.
///
/// ```dart
/// SDModal.show(
///   context,
///   title: 'Confirm',
///   body: 'Are you sure you want to continue?',
///   confirmLabel: 'Confirm',
///   onConfirm: () {},
/// );
///
/// SDModal.showDestructive(
///   context,
///   title: 'Delete item',
///   body: 'This cannot be undone.',
///   onConfirm: () {},
/// );
/// ```
class SDModal {
  SDModal._();

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String body,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: context,
      builder: (ctx) => _SDModalWidget(
        title: title,
        body: body,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        onConfirm: onConfirm,
        onCancel: onCancel,
        destructive: false,
      ),
    );
  }

  static Future<void> showDestructive(
    BuildContext context, {
    required String title,
    required String body,
    String confirmLabel = 'Delete',
    String cancelLabel = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: context,
      builder: (ctx) => _SDModalWidget(
        title: title,
        body: body,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        onConfirm: onConfirm,
        onCancel: onCancel,
        destructive: true,
      ),
    );
  }
}

class _SDModalWidget extends StatelessWidget {
  const _SDModalWidget({
    required this.title,
    required this.body,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.destructive,
    this.onConfirm,
    this.onCancel,
  });

  final String title;
  final String body;
  final String confirmLabel;
  final String cancelLabel;
  final bool destructive;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onCancel?.call();
          },
          child: Text(cancelLabel),
        ),
        FilledButton(
          style: destructive
              ? FilledButton.styleFrom(
                  backgroundColor: cs.error,
                  foregroundColor: cs.onError,
                )
              : null,
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm?.call();
          },
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}