import 'package:flutter/material.dart';
import '../tokens/sd_semantic_colors.dart';

/// Generates light and dark [ThemeData] from a single seed color.
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: SDTheme.light,
///   darkTheme: SDTheme.dark,
///   themeMode: ThemeMode.system,
/// )
/// ```
class SDTheme {
  SDTheme._();

  /// Subtle grey-blue — the default seed color for the Simple Design system.
  static const Color _defaultSeed = Color(0xFF607D8B);

  /// Light theme generated from the default seed color.
  static final ThemeData light = _build(_defaultSeed, Brightness.light);

  /// Dark theme generated from the default seed color.
  static final ThemeData dark = _build(_defaultSeed, Brightness.dark);

  /// Generate a custom theme from any seed color.
  ///
  /// Use this when a consuming project needs to match their brand color
  /// while keeping the SD system's component structure.
  ///
  /// ```dart
  /// MaterialApp(
  ///   theme: SDTheme.withSeed(Color(0xFF4A90D9)),
  ///   darkTheme: SDTheme.withSeed(Color(0xFF4A90D9), brightness: Brightness.dark),
  /// )
  /// ```
  static ThemeData withSeed(
    Color seed, {
    Brightness brightness = Brightness.light,
  }) =>
      _build(seed, brightness);

  static ThemeData _build(Color seed, Brightness brightness) => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: brightness,
        ),
        useMaterial3: true,
        extensions: [
          brightness == Brightness.light
              ? SDSemanticColors.light
              : SDSemanticColors.dark,
        ],
      );
}
