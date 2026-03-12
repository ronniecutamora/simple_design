import 'package:flutter/material.dart';
import '../../tokens/sd_semantic_colors.dart';

enum SDAlertVariant { info, success, warning, error }

/// An inline alert banner with icon, message, and optional dismiss.
///
/// ```dart
/// SDAlert.info(message: 'Your changes have been saved.')
/// SDAlert.error(message: 'Something went wrong.', onDismiss: () {})
/// SDAlert.success(message: 'Profile updated!', title: 'Done')
/// ```
class SDAlert extends StatelessWidget {
  const SDAlert._internal({
    required this.variant,
    required this.message,
    this.title,
    this.onDismiss,
    super.key,
  });

  const SDAlert.info({
    required String message,
    String? title,
    VoidCallback? onDismiss,
    Key? key,
  }) : this._internal(
          variant: SDAlertVariant.info,
          message: message,
          title: title,
          onDismiss: onDismiss,
          key: key,
        );

  const SDAlert.success({
    required String message,
    String? title,
    VoidCallback? onDismiss,
    Key? key,
  }) : this._internal(
          variant: SDAlertVariant.success,
          message: message,
          title: title,
          onDismiss: onDismiss,
          key: key,
        );

  const SDAlert.warning({
    required String message,
    String? title,
    VoidCallback? onDismiss,
    Key? key,
  }) : this._internal(
          variant: SDAlertVariant.warning,
          message: message,
          title: title,
          onDismiss: onDismiss,
          key: key,
        );

  const SDAlert.error({
    required String message,
    String? title,
    VoidCallback? onDismiss,
    Key? key,
  }) : this._internal(
          variant: SDAlertVariant.error,
          message: message,
          title: title,
          onDismiss: onDismiss,
          key: key,
        );

  final SDAlertVariant variant;
  final String message;
  final String? title;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final sc = Theme.of(context).extension<SDSemanticColors>()!;

    final (bg, fg, icon) = switch (variant) {
      SDAlertVariant.info    => (sc.infoContainer,    sc.onInfoContainer,    Icons.info_outline),
      SDAlertVariant.success => (sc.successContainer, sc.onSuccessContainer, Icons.check_circle_outline),
      SDAlertVariant.warning => (sc.warningContainer, sc.onWarningContainer, Icons.warning_amber_outlined),
      SDAlertVariant.error   => (cs.errorContainer,   cs.onErrorContainer,   Icons.error_outline),
    };

    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: fg),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    Text(title!, style: tt.labelLarge?.copyWith(color: fg)),
                    const SizedBox(height: 2),
                  ],
                  Text(message, style: tt.bodySmall?.copyWith(color: fg)),
                ],
              ),
            ),
            if (onDismiss != null)
              IconButton(
                onPressed: onDismiss,
                icon: Icon(Icons.close, size: 18, color: fg),
                style: IconButton.styleFrom(
                  minimumSize: const Size(48, 48),
                  padding: EdgeInsets.zero,
                ),
              ),
          ],
        ),
      ),
    );
  }
}