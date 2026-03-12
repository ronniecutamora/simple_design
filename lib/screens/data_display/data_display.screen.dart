import 'package:flutter/material.dart';
import 'package:simple_design/simple_design.dart';

class DataDisplayScreen extends StatefulWidget {
  const DataDisplayScreen({super.key});
  static const routeName = '/data';

  @override
  State<DataDisplayScreen> createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {
  // Filter chip state
  final Set<String> _selectedTech = {'flutter'};

  static const _techOptions = ['flutter', 'dart', 'firebase', 'supabase'];

  // Input chip state
  final List<String> _inputTags = ['design', 'mobile', 'ui'];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Data Display')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── List Items ──────────────────────────────────────────────────
          SDText.heading3('List Items'),
          const SizedBox(height: 8),
          SDListItem(title: 'Simple item'),
          SDListItem(
            title: 'With subtitle',
            subtitle: 'Additional detail text',
          ),
          SDListItem(
            title: 'Jane Smith',
            subtitle: 'Senior Engineer',
            leading: SDAvatar.initials(initials: 'JS'),
            onTap: () {},
          ),
          SDListItem(
            title: 'Notifications',
            leading: const Icon(Icons.notifications_outlined),
            trailing: SDBadge.count(count: 12),
            onTap: () {},
          ),
          SDListItem(
            title: 'Status',
            leading: const Icon(Icons.circle_outlined),
            trailing: const SDTag(label: 'Active'),
            onTap: () {},
          ),
          SDListItem(
            title: 'Disabled item',
            subtitle: 'Cannot be tapped',
            leading: const Icon(Icons.block),
            enabled: false,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Table ───────────────────────────────────────────────────────
          SDText.heading3('Table'),
          const SizedBox(height: 12),
          SDTable(
            columns: const [
              SDTableColumn(label: 'Name'),
              SDTableColumn(label: 'Role'),
              SDTableColumn(label: 'Score', numeric: true),
              SDTableColumn(label: 'Status'),
            ],
            rows: [
              [
                const Text('Alice'),
                const Text('Admin'),
                const Text('98'),
                const SDTag(label: 'Active'),
              ],
              [
                const Text('Bob'),
                const Text('Editor'),
                const Text('74'),
                const SDTag(label: 'Pending'),
              ],
              [
                const Text('Carol'),
                const Text('Viewer'),
                const Text('61'),
                SDTag(
                  label: 'Inactive',
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Badge ───────────────────────────────────────────────────────
          SDText.heading3('Badge'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _BadgeDemo(badge: SDBadge.count(count: 1), label: '1'),
              _BadgeDemo(badge: SDBadge.count(count: 5), label: '5'),
              _BadgeDemo(badge: SDBadge.count(count: 99), label: '99'),
              _BadgeDemo(badge: SDBadge.count(count: 120), label: '120 → 99+'),
              _BadgeDemo(badge: const SDBadge.dot(), label: 'dot'),
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Avatar ──────────────────────────────────────────────────────
          SDText.heading3('Avatar'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _AvatarDemo(
                avatar: SDAvatar.initials(initials: 'JS'),
                label: 'Initials',
              ),
              _AvatarDemo(
                avatar: SDAvatar.initials(initials: 'AB', size: 56),
                label: 'Large',
              ),
              _AvatarDemo(
                avatar: SDAvatar.icon(icon: Icons.person),
                label: 'Icon',
              ),
              _AvatarDemo(
                avatar: SDAvatar.icon(icon: Icons.star, size: 56),
                label: 'Icon lg',
              ),
              _AvatarDemo(
                avatar: SDAvatar.image(
                  image: NetworkImage(
                    'https://i.pravatar.cc/150?img=3',
                  ),
                ),
                label: 'Image',
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Chip ────────────────────────────────────────────────────────
          SDText.heading3('Chip'),
          const SizedBox(height: 8),
          SDText.label('FILTER'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _techOptions
                .map((t) => SDChip.filter(
                      label: t,
                      selected: _selectedTech.contains(t),
                      onSelected: (selected) => setState(() {
                        if (selected) {
                          _selectedTech.add(t);
                        } else {
                          _selectedTech.remove(t);
                        }
                      }),
                    ))
                .toList(),
          ),
          const SizedBox(height: 12),
          SDText.label('ACTION'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              SDChip.action(label: 'Share', onPressed: () {}, icon: Icons.share_outlined),
              SDChip.action(label: 'Download', onPressed: () {}, icon: Icons.download_outlined),
              SDChip.action(label: 'Disabled', onPressed: null),
            ],
          ),
          const SizedBox(height: 12),
          SDText.label('INPUT'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _inputTags
                .map((tag) => SDChip.input(
                      label: tag,
                      onDeleted: () => setState(() => _inputTags.remove(tag)),
                    ))
                .toList(),
          ),
          if (_inputTags.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SDText.bodySm('All tags removed'),
            ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Tag ─────────────────────────────────────────────────────────
          SDText.heading3('Tag'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const SDTag(label: 'Default'),
              const SDTag(label: 'Active'),
              SDTag(
                label: 'Error',
                color: cs.errorContainer,
              ),
              SDTag(
                label: 'Success',
                color: cs.tertiaryContainer,
              ),
              SDTag(
                label: 'Warning',
                color: cs.secondaryContainer,
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _BadgeDemo extends StatelessWidget {
  const _BadgeDemo({required this.badge, required this.label});
  final Widget badge;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        badge,
        const SizedBox(height: 4),
        SDText.caption(label),
      ],
    );
  }
}

class _AvatarDemo extends StatelessWidget {
  const _AvatarDemo({required this.avatar, required this.label});
  final Widget avatar;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        avatar,
        const SizedBox(height: 4),
        SDText.caption(label),
      ],
    );
  }
}
