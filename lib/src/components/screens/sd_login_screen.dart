import 'package:flutter/material.dart';
import '../buttons/sd_button.dart';
import '../feedback/sd_alert.dart';
import '../inputs/sd_text_field.dart';

/// A pre-built login screen with email + password fields.
///
/// Form validation and loading state are managed internally.
/// Errors thrown by [onLogin] are displayed inline as an alert.
///
/// ```dart
/// SDLoginScreen(
///   logo: Image.asset('assets/logo.png'),
///   onLogin: (email, password) async {
///     await AuthService.login(email, password);
///   },
///   onForgotPassword: () => context.go('/forgot'),
///   onRegister: () => context.go('/register'),
/// )
/// ```
class SDLoginScreen extends StatefulWidget {
  const SDLoginScreen({
    super.key,
    this.logo,
    this.title,
    this.subtitle,
    required this.onLogin,
    this.onForgotPassword,
    this.onRegister,
    this.onBack,
  });

  /// Widget displayed above the form.
  /// Accepts any widget: `Image.asset(...)`, `SvgPicture.asset(...)`, etc.
  final Widget? logo;

  /// Headline text. Defaults to 'Welcome back'.
  final String? title;

  /// Subtitle text. Defaults to 'Sign in to continue'.
  final String? subtitle;

  /// Called with the submitted email and password.
  /// Throw any [Exception] to display an inline error message.
  final Future<void> Function(String email, String password) onLogin;

  /// Called when the user taps 'Forgot password?'. Pass null to hide the link.
  final VoidCallback? onForgotPassword;

  /// Called when the user taps 'Register'. Pass null to hide the link.
  final VoidCallback? onRegister;

  /// Called when the user taps the back arrow in the app bar. Pass null to hide it.
  final VoidCallback? onBack;

  @override
  State<SDLoginScreen> createState() => _SDLoginScreenState();
}

class _SDLoginScreenState extends State<SDLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await widget.onLogin(_emailCtrl.text.trim(), _passwordCtrl.text);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: widget.onBack != null
          ? AppBar(leading: BackButton(onPressed: widget.onBack))
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                if (widget.logo != null) ...[
                  Center(child: widget.logo!),
                  const SizedBox(height: 32),
                ],
                Text(
                  widget.title ?? 'Welcome back',
                  style: tt.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.subtitle ?? 'Sign in to continue',
                  style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: 32),
                if (_error != null) ...[
                  SDAlert.error(message: _error!),
                  const SizedBox(height: 16),
                ],
                SDTextField(
                  controller: _emailCtrl,
                  label: 'Email',
                  hint: 'you@example.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Email is required' : null,
                ),
                const SizedBox(height: 16),
                SDTextField(
                  controller: _passwordCtrl,
                  label: 'Password',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Password is required' : null,
                ),
                if (widget.onForgotPassword != null) ...[
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: widget.onForgotPassword,
                      child: const Text('Forgot password?'),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                SDButton.primary(
                  label: 'Sign in',
                  onPressed: _loading ? null : _submit,
                  loading: _loading,
                  fullWidth: true,
                ),
                if (widget.onRegister != null) ...[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: tt.bodyMedium),
                      TextButton(
                        onPressed: widget.onRegister,
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
