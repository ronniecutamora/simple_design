import 'package:flutter/material.dart';
import 'package:simple_design/simple_design.dart';

class EntryScreensScreen extends StatelessWidget {
  const EntryScreensScreen({super.key});
  static const routeName = '/entry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SDAppBar(title: 'Entry Screens'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ── SDSplashScreen ──────────────────────────────────────────────
          SDText.heading3('Splash Screen'),
          const SizedBox(height: 4),
          SDText.bodySm('Logo + animated fade-in, auto-navigates after a delay.'),
          const SizedBox(height: 12),
          SDButton.secondary(
            label: 'Preview Splash Screen',
            leadingIcon: Icons.play_arrow_outlined,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => SDSplashScreen(
                logo: const FlutterLogo(size: 80),
                title: 'My App',
                onComplete: () => Navigator.of(context).pop(),
                duration: const Duration(seconds: 2),
              ),
            )),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDLoginScreen ───────────────────────────────────────────────
          SDText.heading3('Login Screen'),
          const SizedBox(height: 4),
          SDText.bodySm('Email + password with validation, inline errors, and loading state.'),
          const SizedBox(height: 12),
          SDButton.secondary(
            label: 'Preview Login Screen',
            leadingIcon: Icons.login_outlined,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => SDLoginScreen(
                logo: const FlutterLogo(size: 64),
                onBack: () => Navigator.of(ctx).pop(),
                onLogin: (email, password) async {
                  await Future.delayed(const Duration(seconds: 1));
                  if (password.length < 6) {
                    throw Exception('Invalid credentials. Try a longer password.');
                  }
                },
                onForgotPassword: () => Navigator.of(ctx).push(MaterialPageRoute(
                  builder: (ctx2) => SDForgotPasswordScreen(
                    logo: const FlutterLogo(size: 64),
                    onSendLink: (email) async {
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    onBack: () => Navigator.of(ctx2).pop(),
                  ),
                )),
                onRegister: () => Navigator.of(ctx).push(MaterialPageRoute(
                  builder: (ctx2) => SDRegisterScreen(
                    logo: const FlutterLogo(size: 64),
                    onBack: () => Navigator.of(ctx2).pop(),
                    onRegister: (name, email, password) async {
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    onLogin: () => Navigator.of(ctx2).pop(),
                  ),
                )),
              ),
            )),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDRegisterScreen ────────────────────────────────────────────
          SDText.heading3('Register Screen'),
          const SizedBox(height: 4),
          SDText.bodySm('Name + email + password + confirm password with validation.'),
          const SizedBox(height: 12),
          SDButton.secondary(
            label: 'Preview Register Screen',
            leadingIcon: Icons.person_add_outlined,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => SDRegisterScreen(
                logo: const FlutterLogo(size: 64),
                onBack: () => Navigator.of(ctx).pop(),
                onRegister: (name, email, password) async {
                  await Future.delayed(const Duration(seconds: 1));
                },
                onLogin: () => Navigator.of(ctx).pop(),
              ),
            )),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDForgotPasswordScreen ──────────────────────────────────────
          SDText.heading3('Forgot Password Screen'),
          const SizedBox(height: 4),
          SDText.bodySm('Email field + send link + success confirmation state.'),
          const SizedBox(height: 12),
          SDButton.secondary(
            label: 'Preview Forgot Password Screen',
            leadingIcon: Icons.lock_reset_outlined,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => SDForgotPasswordScreen(
                logo: const FlutterLogo(size: 64),
                onSendLink: (email) async {
                  await Future.delayed(const Duration(seconds: 1));
                },
                onBack: () => Navigator.of(context).pop(),
              ),
            )),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── SDOnboardingScreen ──────────────────────────────────────────
          SDText.heading3('Onboarding Screen'),
          const SizedBox(height: 4),
          SDText.bodySm('Swipeable pages with animated dot indicator, skip + next / get started.'),
          const SizedBox(height: 12),
          SDButton.secondary(
            label: 'Preview Onboarding Screen',
            leadingIcon: Icons.swipe_outlined,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => SDOnboardingScreen(
                onComplete: () => Navigator.of(context).pop(),
                onSkip: () => Navigator.of(context).pop(),
                pages: [
                  SDOnboardingPage(
                    title: 'Beautiful Components',
                    description:
                        'A complete Flutter design system with Material 3 components, ready to use.',
                    illustration: Icon(
                      Icons.palette_outlined,
                      size: 80,
                      color: Theme.of(ctx).colorScheme.primary,
                    ),
                  ),
                  SDOnboardingPage(
                    title: 'One Seed Color',
                    description:
                        'Change one color and the entire system adapts. Light and dark mode included.',
                    illustration: Icon(
                      Icons.color_lens_outlined,
                      size: 80,
                      color: Theme.of(ctx).colorScheme.secondary,
                    ),
                  ),
                  SDOnboardingPage(
                    title: 'Ready to Ship',
                    description:
                        'From auth screens to data display — everything you need to build faster.',
                    illustration: Icon(
                      Icons.rocket_launch_outlined,
                      size: 80,
                      color: Theme.of(ctx).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            )),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
