import 'package:flutter/material.dart';

/// Semantic state colors for the Simple Design system.
///
/// Provides green / blue / amber / red palettes for success, info, warning,
/// and error states — independent of the brand seed color.
///
/// Registered automatically on [SDTheme.light] and [SDTheme.dark].
/// In custom seeds use [SDTheme.withSeed], which also includes these extensions.
///
/// Access anywhere:
/// ```dart
/// final sc = Theme.of(context).extension<SDSemanticColors>()!;
/// Container(color: sc.successContainer, ...)
/// ```
class SDSemanticColors extends ThemeExtension<SDSemanticColors> {
  const SDSemanticColors({
    // Soft variants — used by SDAlert and similar inline components
    required this.successContainer,
    required this.onSuccessContainer,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.warningContainer,
    required this.onWarningContainer,
    // Solid variants — used by SDSnackbar and floating notifications
    required this.success,
    required this.onSuccess,
    required this.info,
    required this.onInfo,
    required this.warning,
    required this.onWarning,
  });

  // ── Soft (container) ──────────────────────────────────────────────────────
  final Color successContainer;
  final Color onSuccessContainer;
  final Color infoContainer;
  final Color onInfoContainer;
  final Color warningContainer;
  final Color onWarningContainer;

  // ── Solid ─────────────────────────────────────────────────────────────────
  final Color success;
  final Color onSuccess;
  final Color info;
  final Color onInfo;
  final Color warning;
  final Color onWarning;

  // ── Light ─────────────────────────────────────────────────────────────────
  static const light = SDSemanticColors(
    successContainer:   Color(0xFFDCFCE7), // green-100
    onSuccessContainer: Color(0xFF14532D), // green-900
    infoContainer:      Color(0xFFDBEAFE), // blue-100
    onInfoContainer:    Color(0xFF1E3A8A), // blue-900
    warningContainer:   Color(0xFFFEF9C3), // yellow-100
    onWarningContainer: Color(0xFF713F12), // yellow-900
    success:   Color(0xFF16A34A), // green-600
    onSuccess: Color(0xFFFFFFFF),
    info:      Color(0xFF2563EB), // blue-600
    onInfo:    Color(0xFFFFFFFF),
    warning:   Color(0xFFD97706), // amber-600
    onWarning: Color(0xFFFFFFFF),
  );

  // ── Dark ──────────────────────────────────────────────────────────────────
  static const dark = SDSemanticColors(
    successContainer:   Color(0xFF14532D), // green-900
    onSuccessContainer: Color(0xFFDCFCE7), // green-100
    infoContainer:      Color(0xFF1E3A8A), // blue-900
    onInfoContainer:    Color(0xFFDBEAFE), // blue-100
    warningContainer:   Color(0xFF78350F), // amber-900
    onWarningContainer: Color(0xFFFEF9C3), // yellow-100
    success:   Color(0xFF4ADE80), // green-400
    onSuccess: Color(0xFF052E16), // green-950
    info:      Color(0xFF60A5FA), // blue-400
    onInfo:    Color(0xFF172554), // blue-950
    warning:   Color(0xFFFCD34D), // amber-300
    onWarning: Color(0xFF451A03), // amber-950
  );

  @override
  SDSemanticColors copyWith({
    Color? successContainer,
    Color? onSuccessContainer,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? success,
    Color? onSuccess,
    Color? info,
    Color? onInfo,
    Color? warning,
    Color? onWarning,
  }) {
    return SDSemanticColors(
      successContainer:   successContainer   ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      infoContainer:      infoContainer      ?? this.infoContainer,
      onInfoContainer:    onInfoContainer    ?? this.onInfoContainer,
      warningContainer:   warningContainer   ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      success:   success   ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      info:      info      ?? this.info,
      onInfo:    onInfo    ?? this.onInfo,
      warning:   warning   ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
    );
  }

  @override
  SDSemanticColors lerp(covariant SDSemanticColors? other, double t) {
    if (other == null) return this;
    return SDSemanticColors(
      successContainer:   Color.lerp(successContainer,   other.successContainer,   t)!,
      onSuccessContainer: Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      infoContainer:      Color.lerp(infoContainer,      other.infoContainer,      t)!,
      onInfoContainer:    Color.lerp(onInfoContainer,    other.onInfoContainer,    t)!,
      warningContainer:   Color.lerp(warningContainer,   other.warningContainer,   t)!,
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      success:   Color.lerp(success,   other.success,   t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      info:      Color.lerp(info,      other.info,      t)!,
      onInfo:    Color.lerp(onInfo,    other.onInfo,    t)!,
      warning:   Color.lerp(warning,   other.warning,   t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
    );
  }
}
