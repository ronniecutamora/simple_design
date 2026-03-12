import 'package:flutter/material.dart';
import 'package:simple_design/simple_design.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});
  static const routeName = '/layout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout'),),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ── SDDividerLabel ──────────────────────────────────────────────
          SDText.heading3('Divider Label'),
          const SizedBox(height: 12),
          const SDDividerLabel(label: 'OR'),
          const SizedBox(height: 8),
          const SDDividerLabel(label: 'TODAY'),
          const SizedBox(height: 8),
          const SDDividerLabel(label: 'Section Title'),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDAccordion ─────────────────────────────────────────────────
          SDText.heading3('Accordion'),
          const SizedBox(height: 8),
          SDText.label('SINGLE OPEN'),
          const SizedBox(height: 8),
          SDAccordion(
            items: [
              SDAccordionItem(
                title: 'What is Flutter?',
                child: SDText.body(
                    'Flutter is Google\'s UI toolkit for building natively compiled applications from a single codebase.'),
              ),
              SDAccordionItem(
                title: 'What is a design system?',
                child: SDText.body(
                    'A design system is a collection of reusable components guided by clear standards that can be assembled to build any number of applications.'),
              ),
              SDAccordionItem(
                leading: const Icon(Icons.attach_money_outlined),
                title: 'Is it free?',
                child: SDText.body('Yes — completely open source and free to use.'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SDText.label('MULTIPLE OPEN'),
          const SizedBox(height: 8),
          SDAccordion(
            allowMultiple: true,
            items: [
              SDAccordionItem(title: 'Option A', child: SDText.body('Content for option A.')),
              SDAccordionItem(title: 'Option B', child: SDText.body('Content for option B.')),
              SDAccordionItem(title: 'Option C', child: SDText.body('Content for option C.')),
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDCarousel ──────────────────────────────────────────────────
          SDText.heading3('Carousel'),
          const SizedBox(height: 8),
          SDText.label('FULL WIDTH'),
          const SizedBox(height: 8),
          SDCarousel(
            height: 140,
            items: [
              SDCard.filled(
                child: Center(child: SDText.heading2('Slide 1')),
              ),
              SDCard.filled(
                child: Center(child: SDText.heading2('Slide 2')),
              ),
              SDCard.filled(
                child: Center(child: SDText.heading2('Slide 3')),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SDText.label('PEEKING (85%)'),
          const SizedBox(height: 8),
          SDCarousel(
            height: 120,
            viewportFraction: 0.85,
            items: [
              SDCard.elevated(child: Center(child: SDText.body('Card A'))),
              SDCard.elevated(child: Center(child: SDText.body('Card B'))),
              SDCard.elevated(child: Center(child: SDText.body('Card C'))),
              SDCard.elevated(child: Center(child: SDText.body('Card D'))),
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDBentoBox ──────────────────────────────────────────────────
          SDText.heading3('Bento Box'),
          const SizedBox(height: 12),
          SDBentoBox(
            gap: 8,
            rowHeight: 100,
            rows: [
              [
                SDBentoItem(child: SDCard.filled(child: Center(child: SDText.body('1:1')))),
                SDBentoItem(child: SDCard.filled(child: Center(child: SDText.body('1:1')))),
              ],
              [
                SDBentoItem(flex: 2, child: SDCard.elevated(child: Center(child: SDText.body('2×')))),
                SDBentoItem(flex: 1, child: SDCard.outlined(child: Center(child: SDText.body('1×')))),
              ],
              [
                SDBentoItem(flex: 1, child: SDCard.outlined(child: Center(child: SDText.body('1×')))),
                SDBentoItem(flex: 1, child: SDCard.outlined(child: Center(child: SDText.body('1×')))),
                SDBentoItem(flex: 1, child: SDCard.outlined(child: Center(child: SDText.body('1×')))),
              ],
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDEmptyState ────────────────────────────────────────────────
          SDText.heading3('Empty State'),
          const SizedBox(height: 12),
          SDCard.outlined(
            child: SDEmptyState(
              message: 'No items yet.',
            ),
          ),
          const SizedBox(height: 12),
          SDCard.outlined(
            child: SDEmptyState(
              icon: Icons.search_off_outlined,
              title: 'Nothing found',
              message: 'Try adjusting your search or filters.',
              action: SDButton.primary(label: 'Clear filters', onPressed: () {}),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
