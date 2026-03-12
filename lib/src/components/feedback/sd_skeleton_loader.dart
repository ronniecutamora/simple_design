import 'package:flutter/material.dart';

/// An animated shimmer placeholder shown while content is loading.
///
/// ```dart
/// SDSkeletonLoader(width: double.infinity, height: 16)   // text line
/// SDSkeletonLoader(width: 80, height: 80, circular: true) // avatar
/// SDSkeletonLoader.card()                                 // card block
/// ```
class SDSkeletonLoader extends StatefulWidget {
  const SDSkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.circular = false,
  });

  /// A preset that mimics a card with title + two body lines.
  factory SDSkeletonLoader.card({Key? key}) => _SDSkeletonCard(key: key);

  final double width;
  final double height;
  final bool circular;

  @override
  State<SDSkeletonLoader> createState() => _SDSkeletonLoaderState();
}

class _SDSkeletonLoaderState extends State<SDSkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Opacity(
        opacity: _animation.value,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: cs.surfaceContainerHighest,
            borderRadius: widget.circular
                ? BorderRadius.circular(widget.height / 2)
                : BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class _SDSkeletonCard extends SDSkeletonLoader {
  const _SDSkeletonCard({super.key})
      : super(width: double.infinity, height: 0);

  @override
  State<SDSkeletonLoader> createState() => _SDSkeletonCardState();
}

class _SDSkeletonCardState extends _SDSkeletonLoaderState {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Opacity(
        opacity: _animation.value,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cs.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 120, height: 14, decoration: BoxDecoration(color: cs.surfaceContainerHigh, borderRadius: BorderRadius.circular(4))),
              const SizedBox(height: 12),
              Container(width: double.infinity, height: 12, decoration: BoxDecoration(color: cs.surfaceContainerHigh, borderRadius: BorderRadius.circular(4))),
              const SizedBox(height: 6),
              Container(width: 200, height: 12, decoration: BoxDecoration(color: cs.surfaceContainerHigh, borderRadius: BorderRadius.circular(4))),
            ],
          ),
        ),
      ),
    );
  }
}