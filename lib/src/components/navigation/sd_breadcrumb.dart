import 'package:flutter/material.dart';

/// A single breadcrumb item. Set [onTap] to null for the current (last) item.
class SDBreadcrumbItem {
  const SDBreadcrumbItem({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;
}

/// A horizontal breadcrumb trail with chevron separators.
///
/// The last item (current page) is displayed as plain text.
/// All preceding items are tappable links.
///
/// ```dart
/// SDBreadcrumb(items: [
///   SDBreadcrumbItem(label: 'Home',     onTap: () => context.go('/')),
///   SDBreadcrumbItem(label: 'Settings', onTap: () => context.go('/settings')),
///   SDBreadcrumbItem(label: 'Profile'),  // current — no onTap
/// ])
/// ```
class SDBreadcrumb extends StatelessWidget {
  const SDBreadcrumb({super.key, required this.items});

  final List<SDBreadcrumbItem> items;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(Icons.chevron_right, size: 16, color: cs.onSurfaceVariant),
              ),
            if (items[i].onTap != null)
              Semantics(
                button: true,
                label: items[i].label,
                child: InkWell(
                  onTap: items[i].onTap,
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Text(
                      items[i].label,
                      style: tt.labelMedium?.copyWith(color: cs.primary),
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Text(
                  items[i].label,
                  style: tt.labelMedium?.copyWith(color: cs.onSurface),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
