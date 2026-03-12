import 'package:flutter/material.dart';
import 'package:simple_design/simple_design.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});
  static const routeName = '/feedback';

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  bool _showInfoAlert = true;
  bool _showSuccessAlert = true;
  bool _showWarningAlert = true;
  bool _showErrorAlert = true;
  double _progressValue = 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ── Alert ────────────────────────────────────────────────────────
          SDText.heading3('Alert'),
          const SizedBox(height: 12),
          if (_showInfoAlert) ...[
            SDAlert.info(
              title: 'Info',
              message: 'Your session will expire in 10 minutes.',
              onDismiss: () => setState(() => _showInfoAlert = false),
            ),
            const SizedBox(height: 8),
          ],
          if (_showSuccessAlert) ...[
            SDAlert.success(
              title: 'Success',
              message: 'Your profile has been updated.',
              onDismiss: () => setState(() => _showSuccessAlert = false),
            ),
            const SizedBox(height: 8),
          ],
          if (_showWarningAlert) ...[
            SDAlert.warning(
              title: 'Warning',
              message: 'Storage is almost full.',
              onDismiss: () => setState(() => _showWarningAlert = false),
            ),
            const SizedBox(height: 8),
          ],
          if (_showErrorAlert) ...[
            SDAlert.error(
              title: 'Error',
              message: 'Failed to connect. Please try again.',
              onDismiss: () => setState(() => _showErrorAlert = false),
            ),
            const SizedBox(height: 8),
          ],
          if (!_showInfoAlert && !_showSuccessAlert && !_showWarningAlert && !_showErrorAlert)
            TextButton(
              onPressed: () => setState(() {
                _showInfoAlert = true;
                _showSuccessAlert = true;
                _showWarningAlert = true;
                _showErrorAlert = true;
              }),
              child: const Text('Reset alerts'),
            ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Snackbar ─────────────────────────────────────────────────────
          SDText.heading3('Snackbar'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SDButton.primary(
                label: 'Default',
                onPressed: () => SDSnackbar.show(context, message: 'Changes saved.'),
              ),
              SDButton.secondary(
                label: 'With action',
                onPressed: () => SDSnackbar.show(
                  context,
                  message: 'Item deleted.',
                  actionLabel: 'Undo',
                  onAction: () => SDSnackbar.show(context, message: 'Undo successful.'),
                ),
              ),
              SDButton.ghost(
                label: 'Success',
                onPressed: () => SDSnackbar.showSuccess(context, message: 'Profile updated!'),
              ),
              SDButton.ghost(
                label: 'Info',
                onPressed: () => SDSnackbar.showInfo(context, message: 'Sync in progress…'),
              ),
              SDButton.ghost(
                label: 'Warning',
                onPressed: () => SDSnackbar.showWarning(context, message: 'Storage almost full.'),
              ),
              SDButton.danger(
                label: 'Error',
                onPressed: () => SDSnackbar.showError(context, message: 'Failed to save. Try again.'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Toast ────────────────────────────────────────────────────────
          SDText.heading3('Toast'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SDButton.secondary(
                label: 'Show toast',
                leadingIcon: Icons.info_outline,
                onPressed: () => SDToast.show(
                  context,
                  message: 'Copied to clipboard',
                  icon: Icons.copy_outlined,
                ),
              ),
              SDButton.secondary(
                label: 'Upload done',
                leadingIcon: Icons.cloud_upload_outlined,
                onPressed: () => SDToast.show(
                  context,
                  message: 'Upload complete',
                  icon: Icons.cloud_done_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Modal ────────────────────────────────────────────────────────
          SDText.heading3('Modal'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SDButton.secondary(
                label: 'Standard',
                onPressed: () => SDModal.show(
                  context,
                  title: 'Save changes?',
                  body: 'Your unsaved changes will be lost if you leave this page.',
                  confirmLabel: 'Save',
                  onConfirm: () => SDSnackbar.show(context, message: 'Saved.'),
                ),
              ),
              SDButton.danger(
                label: 'Destructive',
                onPressed: () => SDModal.showDestructive(
                  context,
                  title: 'Delete account?',
                  body: 'This action is permanent and cannot be undone.',
                  onConfirm: () => SDSnackbar.show(context, message: 'Account deleted.'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Bottom Sheet ─────────────────────────────────────────────────
          SDText.heading3('Bottom Sheet'),
          const SizedBox(height: 12),
          SDButton.secondary(
            label: 'Open bottom sheet',
            leadingIcon: Icons.open_in_browser_outlined,
            onPressed: () => SDBottomSheet.show(
              context,
              title: 'Share via',
              child: Column(
                children: [
                  SDListItem(
                    title: 'Copy link',
                    leading: const Icon(Icons.link),
                    onTap: () {
                      Navigator.of(context).pop();
                      SDToast.show(context, message: 'Link copied', icon: Icons.copy);
                    },
                  ),
                  SDListItem(
                    title: 'Send by email',
                    leading: const Icon(Icons.email_outlined),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  SDListItem(
                    title: 'Export as PDF',
                    leading: const Icon(Icons.picture_as_pdf_outlined),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Progress Bar ─────────────────────────────────────────────────
          SDText.heading3('Progress Bar'),
          const SizedBox(height: 12),
          SDProgressBar(value: _progressValue, label: 'Upload progress'),
          const SizedBox(height: 12),
          const SDProgressBar(), // indeterminate
          const SizedBox(height: 12),
          Slider(
            value: _progressValue,
            onChanged: (v) => setState(() => _progressValue = v),
          ),
          const SizedBox(height: 24),
          const SDDivider.horizontal(),
          const SizedBox(height: 24),

          // ── Skeleton Loader ──────────────────────────────────────────────
          SDText.heading3('Skeleton Loader'),
          const SizedBox(height: 12),
          Row(
            children: [
              SDSkeletonLoader(width: 48, height: 48, circular: true),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SDSkeletonLoader(width: double.infinity, height: 14),
                    const SizedBox(height: 6),
                    SDSkeletonLoader(width: 140, height: 12),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SDSkeletonLoader.card(),
          const SizedBox(height: 12),
          SDSkeletonLoader.card(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}