import 'package:flutter/material.dart';
import 'package:simple_design/simple_design.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});
  static const routeName = '/typography';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Typography')),
      body: const Center(
        child: SDText.body('Coming in v0.5'),
      ),
    );
  }
}