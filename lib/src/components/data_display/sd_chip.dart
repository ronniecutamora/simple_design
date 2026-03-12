import 'package:flutter/material.dart';

enum _SDChipVariant { filter, action, input }

/// A themed chip with three variants.
///
/// ```dart
/// SDChip.filter(label: 'Flutter', selected: _selected, onSelected: (v) => setState(() => _selected = v))
/// SDChip.action(label: 'Share', onPressed: () {})
/// SDChip.input(label: 'dart', onDeleted: () {})
/// ```
class SDChip extends StatelessWidget {
  const SDChip._internal({
    required String label,
    required _SDChipVariant variant,
    bool selected = false,
    ValueChanged<bool>? onSelected,
    VoidCallback? onPressed,
    VoidCallback? onDeleted,
    IconData? icon,
    bool enabled = true,
    super.key,
  })  : _label = label,
        _variant = variant,
        _selected = selected,
        _onSelected = onSelected,
        _onPressed = onPressed,
        _onDeleted = onDeleted,
        _icon = icon,
        _enabled = enabled;

  const SDChip.filter({
    required String label,
    required bool selected,
    required ValueChanged<bool> onSelected,
    IconData? icon,
    bool enabled = true,
    Key? key,
  }) : this._internal(
          label: label,
          variant: _SDChipVariant.filter,
          selected: selected,
          onSelected: onSelected,
          icon: icon,
          enabled: enabled,
          key: key,
        );

  const SDChip.action({
    required String label,
    required VoidCallback? onPressed,
    IconData? icon,
    Key? key,
  }) : this._internal(
          label: label,
          variant: _SDChipVariant.action,
          onPressed: onPressed,
          icon: icon,
          key: key,
        );

  const SDChip.input({
    required String label,
    required VoidCallback onDeleted,
    IconData? icon,
    bool enabled = true,
    Key? key,
  }) : this._internal(
          label: label,
          variant: _SDChipVariant.input,
          onDeleted: onDeleted,
          icon: icon,
          enabled: enabled,
          key: key,
        );

  final String _label;
  final _SDChipVariant _variant;
  final bool _selected;
  final ValueChanged<bool>? _onSelected;
  final VoidCallback? _onPressed;
  final VoidCallback? _onDeleted;
  final IconData? _icon;
  final bool _enabled;

  @override
  Widget build(BuildContext context) {
    final avatar = _icon != null ? Icon(_icon, size: 18) : null;

    return switch (_variant) {
      _SDChipVariant.filter => Semantics(
          label: _label,
          selected: _selected,
          enabled: _enabled,
          child: FilterChip(
            label: Text(_label),
            selected: _selected,
            onSelected: _enabled ? _onSelected : null,
            avatar: avatar,
          ),
        ),
      _SDChipVariant.action => Semantics(
          label: _label,
          button: true,
          child: ActionChip(
            label: Text(_label),
            onPressed: _onPressed,
            avatar: avatar,
          ),
        ),
      _SDChipVariant.input => Semantics(
          label: _label,
          enabled: _enabled,
          child: InputChip(
            label: Text(_label),
            onDeleted: _enabled ? _onDeleted : null,
            isEnabled: _enabled,
            avatar: avatar,
          ),
        ),
    };
  }
}
