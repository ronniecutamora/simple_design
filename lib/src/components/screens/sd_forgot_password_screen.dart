import 'package:flutter/material.dart';
import '../buttons/sd_button.dart';
import '../feedback/sd_alert.dart';
import '../inputs/sd_text_field.dart';

/// A pre-built forgot password screen with email field and success state.
///
/// After [onSendLink] completes without error, a confirmation message is shown.
/// Errors thrown by [onSendLink] are displayed inline as an alert.
///
/// ```dart
/// SDForgotPasswordScreen(
///   logo: Image.asset('assets/logo.png'),
///   onSendLink: (email) async {
///     await AuthService.sendPasswordReset(email);
///   },
///   onBack: () => context.go('/login'),
/// )
/// ```
class SDForgotPasswordScreen extends StatefulWidget {
  const SDForgotPasswordScreen({
    super.key,
    this.logo,
    required this.onSendLink,
    this.onBack,
  });

  /// Widget displayed above the form.
  /// Accepts any widget: `Image.asset(...)`, `SvgPicture.asset(...)`, etc.
  final Widget? logo;

  /// Called with the submitted email address.
  /// Throw any [Exception] to display an inline error message.
  final Future<void> Function(String email) onSendLink;

  /// Called when the user taps the back button. Pass null to hide it.
  final VoidCallback? onBack;

  @override
  State<SDForgotPasswordScreen> createState() => _SDForgotPasswordScreenState();
}

class _SDForgotPasswordScreenState extends State<SDForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  bool _loading = false;
  bool _sent = false;
  String? _error;

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await widget.onSendLink(_emailCtrl.text.trim());
      if (mounted) setState(() => _sent = true);
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
          child: _sent ? _buildSuccess(cs, tt) : _buildForm(cs, tt),
        ),
      ),
    );
  }

  Widget _buildSuccess(ColorScheme cs, TextTheme tt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 64),
        Icon(Icons.mark_email_read_outlined, size: 72, color: cs.primary),
        const SizedBox(height: 24),
        Text(
          'Check your inbox',
          style: tt.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'We sent a reset link to ${_emailCtrl.text.trim()}',
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
        if (widget.onBack != null) ...[
          const SizedBox(height: 40),
          SDButton.secondary(label: 'Back to sign in', onPressed: widget.onBack),
        ],
      ],
    );
  }

  Widget _buildForm(ColorScheme cs, TextTheme tt) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.onBack != null)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onBack,
                style: IconButton.styleFrom(minimumSize: const Size(48, 48)),
              ),
            ),
          const SizedBox(height: 16),
          if (widget.logo != null) ...[
            Center(child: widget.logo!),
            const SizedBox(height: 32),
          ],
          Text('Reset your password', style: tt.headlineMedium),
          const SizedBox(height: 8),
          Text(
            "Enter your email and we'll send you a reset link.",
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
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submit(),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Email is required' : null,
          ),
          const SizedBox(height: 24),
          SDButton.primary(
            label: 'Send reset link',
            onPressed: _loading ? null : _submit,
            loading: _loading,
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
