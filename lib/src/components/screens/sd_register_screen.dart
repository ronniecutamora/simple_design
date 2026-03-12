import 'package:flutter/material.dart';
import '../buttons/sd_button.dart';
import '../feedback/sd_alert.dart';
import '../inputs/sd_text_field.dart';

/// A pre-built registration screen with name, email, password, and confirm fields.
///
/// Form validation and loading state are managed internally.
/// Errors thrown by [onRegister] are displayed inline as an alert.
///
/// ```dart
/// SDRegisterScreen(
///   logo: Image.asset('assets/logo.png'),
///   onRegister: (name, email, password) async {
///     await AuthService.register(name: name, email: email, password: password);
///   },
///   onLogin: () => context.go('/login'),
/// )
/// ```
class SDRegisterScreen extends StatefulWidget {
  const SDRegisterScreen({
    super.key,
    this.logo,
    this.title,
    this.subtitle,
    required this.onRegister,
    this.onLogin,
  });

  /// Widget displayed above the form.
  /// Accepts any widget: `Image.asset(...)`, `SvgPicture.asset(...)`, etc.
  final Widget? logo;

  /// Headline text. Defaults to 'Create account'.
  final String? title;

  /// Subtitle text. Defaults to 'Fill in your details to get started'.
  final String? subtitle;

  /// Called with the submitted name, email, and password.
  /// Throw any [Exception] to display an inline error message.
  final Future<void> Function(String name, String email, String password) onRegister;

  /// Called when the user taps 'Sign in'. Pass null to hide the link.
  final VoidCallback? onLogin;

  @override
  State<SDRegisterScreen> createState() => _SDRegisterScreenState();
}

class _SDRegisterScreenState extends State<SDRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await widget.onRegister(
        _nameCtrl.text.trim(),
        _emailCtrl.text.trim(),
        _passwordCtrl.text,
      );
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
                  widget.title ?? 'Create account',
                  style: tt.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.subtitle ?? 'Fill in your details to get started',
                  style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: 32),
                if (_error != null) ...[
                  SDAlert.error(message: _error!),
                  const SizedBox(height: 16),
                ],
                SDTextField(
                  controller: _nameCtrl,
                  label: 'Full name',
                  hint: 'Jane Doe',
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Name is required' : null,
                ),
                const SizedBox(height: 16),
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
                  textInputAction: TextInputAction.next,
                  validator: (v) => (v == null || v.length < 6)
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
                const SizedBox(height: 16),
                SDTextField(
                  controller: _confirmCtrl,
                  label: 'Confirm password',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  validator: (v) =>
                      v != _passwordCtrl.text ? 'Passwords do not match' : null,
                ),
                const SizedBox(height: 24),
                SDButton.primary(
                  label: 'Create account',
                  onPressed: _loading ? null : _submit,
                  loading: _loading,
                  fullWidth: true,
                ),
                if (widget.onLogin != null) ...[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?', style: tt.bodyMedium),
                      TextButton(
                        onPressed: widget.onLogin,
                        child: const Text('Sign in'),
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
