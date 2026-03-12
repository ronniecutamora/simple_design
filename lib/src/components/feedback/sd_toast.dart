import 'package:flutter/material.dart';

/// Shows a lightweight toast overlay that auto-dismisses.
///
/// Unlike [SDSnackbar], SDToast does not require a Scaffold and
/// appears near the top of the screen.
///
/// ```dart
/// SDToast.show(context, message: 'Copied to clipboard');
/// SDToast.show(context, message: 'Upload complete', icon: Icons.cloud_done_outlined);
/// ```
class SDToast {
  SDToast._();

  static void show(
    BuildContext context, {
    required String message,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => _SDToastWidget(
        message: message,
        icon: icon,
        onDone: () => entry.remove(),
        duration: duration,
      ),
    );

    overlay.insert(entry);
  }
}

class _SDToastWidget extends StatefulWidget {
  const _SDToastWidget({
    required this.message,
    required this.onDone,
    required this.duration,
    this.icon,
  });

  final String message;
  final IconData? icon;
  final VoidCallback onDone;
  final Duration duration;

  @override
  State<_SDToastWidget> createState() => _SDToastWidgetState();
}

class _SDToastWidgetState extends State<_SDToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Future.delayed(widget.duration, () async {
      if (mounted) {
        await _controller.reverse();
        widget.onDone();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 24,
      right: 24,
      child: FadeTransition(
        opacity: _opacity,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: cs.inverseSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, size: 18, color: cs.onInverseSurface),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    widget.message,
                    style: tt.bodySmall?.copyWith(color: cs.onInverseSurface),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}