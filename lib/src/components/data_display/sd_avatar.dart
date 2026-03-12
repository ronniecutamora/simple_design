import 'package:flutter/material.dart';

enum _SDAvatarVariant { initials, icon, image }

/// A circular avatar.
///
/// ```dart
/// SDAvatar.initials(initials: 'JS')
/// SDAvatar.icon(icon: Icons.person)
/// SDAvatar.image(image: NetworkImage('https://...'))
/// SDAvatar.initials(initials: 'AB', size: 56)
/// ```
class SDAvatar extends StatelessWidget {
  const SDAvatar.initials({
    required String initials,
    this.size = 40,
    super.key,
  })  : _variant = _SDAvatarVariant.initials,
        _initials = initials,
        _icon = null,
        _image = null;

  const SDAvatar.icon({
    required IconData icon,
    this.size = 40,
    super.key,
  })  : _variant = _SDAvatarVariant.icon,
        _icon = icon,
        _initials = null,
        _image = null;

  const SDAvatar.image({
    required ImageProvider image,
    this.size = 40,
    super.key,
  })  : _variant = _SDAvatarVariant.image,
        _image = image,
        _initials = null,
        _icon = null;

  final _SDAvatarVariant _variant;
  final double size;
  final String? _initials;
  final IconData? _icon;
  final ImageProvider? _image;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = size / 2;

    return switch (_variant) {
      _SDAvatarVariant.initials => CircleAvatar(
          radius: radius,
          backgroundColor: cs.primaryContainer,
          child: Text(
            (_initials ?? '').length > 2 ? (_initials ?? '').substring(0, 2) : (_initials ?? ''),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: cs.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      _SDAvatarVariant.icon => CircleAvatar(
          radius: radius,
          backgroundColor: cs.primaryContainer,
          child: Icon(_icon, size: size * 0.5, color: cs.onPrimaryContainer),
        ),
      _SDAvatarVariant.image => CircleAvatar(
          radius: radius,
          backgroundImage: _image,
        ),
    };
  }
}
