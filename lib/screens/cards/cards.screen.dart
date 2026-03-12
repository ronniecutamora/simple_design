import 'package:flutter/material.dart';
import 'package:simple_design/simple_design.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});
  static const routeName = '/cards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Elevated ────────────────────────────────────────────────────
          SDText.heading3('Elevated'),
          const SizedBox(height: 12),
          SDCard.elevated(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDText.label('DEFAULT'),
                const SizedBox(height: 4),
                SDText.body('A standard elevated card with a drop shadow.'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SDCard.elevated(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDText.label('TAPPABLE'),
                const SizedBox(height: 4),
                SDText.body('Tap this card — it has an onTap ripple.'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Filled ──────────────────────────────────────────────────────
          SDText.heading3('Filled'),
          const SizedBox(height: 12),
          SDCard.filled(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDText.label('DEFAULT'),
                const SizedBox(height: 4),
                SDText.body('Uses surfaceContainerHighest — no shadow.'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SDCard.filled(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDText.label('TAPPABLE'),
                const SizedBox(height: 4),
                SDText.body('Filled tappable card.'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Outlined ────────────────────────────────────────────────────
          SDText.heading3('Outlined'),
          const SizedBox(height: 12),
          SDCard.outlined(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDText.label('DEFAULT'),
                const SizedBox(height: 4),
                SDText.body('Outline border using colorScheme.outline.'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SDCard.outlined(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDText.label('TAPPABLE'),
                const SizedBox(height: 4),
                SDText.body('Outlined tappable card.'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Composition ──────────────────────────────────────────────────
          SDText.heading3('Composition'),
          const SizedBox(height: 12),
          SDCard.elevated(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      SDAvatar.initials(initials: 'JS', size: 48),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SDText.heading3('Jane Smith'),
                          SDText.bodySm('Senior Engineer'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SDDivider.horizontal(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SDText.body(
                    'Building great design systems takes care, consistency, and collaboration.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    children: [
                      SDButton.ghost(label: 'Dismiss', onPressed: () {}),
                      const SizedBox(width: 8),
                      SDButton.primary(label: 'Follow', onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SDCard.outlined(
            child: Row(
              children: [
                SDAvatar.icon(icon: Icons.notifications_outlined, size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SDText.body('New comment on your post'),
                      SDText.caption('2 minutes ago'),
                    ],
                  ),
                ),
                const SDBadge.dot(),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
