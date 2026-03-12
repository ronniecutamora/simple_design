import 'package:flutter/material.dart';

enum _SDCardVariant { elevated, filled, outlined }

/// A themed card container with three variants.
///
/// ```dart
/// SDCard.elevated(child: Text('Hello'))
/// SDCard.filled(child: Text('Hello'), onTap: () {})
/// SDCard.outlined(child: Column(...))
/// ```
class SDCard extends StatelessWidget {
  const SDCard._internal({
    required Widget child,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    required _SDCardVariant variant,
    super.key,
  })  : _child = child,
        _onTap = onTap,
        _padding = padding,
        _variant = variant;

  const SDCard.elevated({
    required Widget child,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) : this._internal(
          child: child,
          onTap: onTap,
          padding: padding,
          variant: _SDCardVariant.elevated,
          key: key,
        );

  const SDCard.filled({
    required Widget child,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) : this._internal(
          child: child,
          onTap: onTap,
          padding: padding,
          variant: _SDCardVariant.filled,
          key: key,
        );

  const SDCard.outlined({
    required Widget child,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) : this._internal(
          child: child,
          onTap: onTap,
          padding: padding,
          variant: _SDCardVariant.outlined,
          key: key,
        );

  final Widget _child;
  final VoidCallback? _onTap;
  final EdgeInsetsGeometry? _padding;
  final _SDCardVariant _variant;

  static const _defaultPadding = EdgeInsets.all(16);

  Widget _buildCard(Widget content) {
    return switch (_variant) {
      _SDCardVariant.elevated => Card(child: content),
      _SDCardVariant.filled => Card.filled(child: content),
      _SDCardVariant.outlined => Card.outlined(child: content),
    };
  }

  @override
  Widget build(BuildContext context) {
    final padded = Padding(
      padding: _padding ?? _defaultPadding,
      child: _child,
    );

    final card = _buildCard(
      _onTap != null
          ? InkWell(
              onTap: _onTap,
              borderRadius: BorderRadius.circular(12),
              child: padded,
            )
          : padded,
    );

    if (_onTap != null) {
      return Semantics(button: true, child: card);
    }
    return card;
  }
}
