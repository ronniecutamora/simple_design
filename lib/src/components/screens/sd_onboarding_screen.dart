import 'package:flutter/material.dart';
import '../buttons/sd_button.dart';

/// A single page definition for [SDOnboardingScreen].
class SDOnboardingPage {
  const SDOnboardingPage({
    required this.title,
    required this.description,
    this.illustration,
  });

  final String title;
  final String description;

  /// Optional widget shown above the title.
  /// Accepts any widget: `Image.asset(...)`, `Icon(...)`, `Lottie.asset(...)`, etc.
  final Widget? illustration;
}

/// A swipeable multi-page onboarding screen.
///
/// Includes a dot page indicator, a Skip button (optional), and a Next / Get started button.
///
/// ```dart
/// SDOnboardingScreen(
///   onComplete: () => context.go('/home'),
///   onSkip: () => context.go('/home'),
///   pages: [
///     SDOnboardingPage(
///       title: 'Welcome',
///       description: 'Everything you need, ready to go.',
///       illustration: Image.asset('assets/onboarding1.png'),
///     ),
///   ],
/// )
/// ```
class SDOnboardingScreen extends StatefulWidget {
  const SDOnboardingScreen({
    super.key,
    required this.pages,
    required this.onComplete,
    this.onSkip,
  });

  final List<SDOnboardingPage> pages;

  /// Called when the user taps 'Get started' on the last page.
  final VoidCallback onComplete;

  /// Called when the user taps 'Skip'. Pass null to hide the skip button.
  final VoidCallback? onSkip;

  @override
  State<SDOnboardingScreen> createState() => _SDOnboardingScreenState();
}

class _SDOnboardingScreenState extends State<SDOnboardingScreen> {
  final _pageCtrl = PageController();
  int _current = 0;

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  void _next() {
    if (_current < widget.pages.length - 1) {
      _pageCtrl.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final isLast = _current == widget.pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            SizedBox(
              height: 48,
              child: (widget.onSkip != null && !isLast)
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: widget.onSkip,
                        child: const Text('Skip'),
                      ),
                    )
                  : null,
            ),

            // Pages
            Expanded(
              child: PageView.builder(
                controller: _pageCtrl,
                onPageChanged: (i) => setState(() => _current = i),
                itemCount: widget.pages.length,
                itemBuilder: (context, i) {
                  final page = widget.pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (page.illustration != null) ...[
                          page.illustration!,
                          const SizedBox(height: 40),
                        ],
                        Text(
                          page.title,
                          style: tt.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          page.description,
                          style: tt.bodyMedium
                              ?.copyWith(color: cs.onSurfaceVariant),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Dot indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.pages.length, (i) {
                final active = i == _current;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                  width: active ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active ? cs.primary : cs.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            // Next / Get started
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SDButton.primary(
                label: isLast ? 'Get started' : 'Next',
                onPressed: _next,
                fullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
