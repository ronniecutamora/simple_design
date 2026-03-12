import 'package:flutter/material.dart';

/// A full-screen splash screen with optional logo, title, and auto-navigation.
///
/// The logo and title fade in with a subtle scale animation. After [duration],
/// [onComplete] is called so the app can navigate to the next screen.
///
/// ```dart
/// SDSplashScreen(
///   logo: Image.asset('assets/logo.png'),
///   title: 'My App',
///   onComplete: () => context.go('/home'),
/// )
/// ```
class SDSplashScreen extends StatefulWidget {
  const SDSplashScreen({
    super.key,
    this.logo,
    this.title,
    required this.onComplete,
    this.duration = const Duration(seconds: 2),
  });

  /// Widget displayed as the app logo.
  /// Accepts any widget: `Image.asset(...)`, `SvgPicture.asset(...)`,
  /// `FlutterLogo(...)`, `Icon(...)`, etc.
  final Widget? logo;

  /// Optional app name displayed below the logo.
  final String? title;

  /// Called after [duration] elapses. Navigate to the next screen here.
  final VoidCallback onComplete;

  /// How long to show the splash before calling [onComplete].
  /// Defaults to 2 seconds.
  final Duration duration;

  @override
  State<SDSplashScreen> createState() => _SDSplashScreenState();
}

class _SDSplashScreenState extends State<SDSplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _scale = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
    _ctrl.forward();
    Future.delayed(widget.duration, () {
      if (mounted) widget.onComplete();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: _fade,
            child: ScaleTransition(
              scale: _scale,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.logo != null) widget.logo!,
                  if (widget.title != null) ...[
                    const SizedBox(height: 24),
                    Text(widget.title!, style: tt.headlineMedium),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
