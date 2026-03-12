import 'package:flutter/material.dart';
import 'package:simple_design/simple_design.dart';

class NavigationShowcaseScreen extends StatelessWidget {
  const NavigationShowcaseScreen({super.key});
  static const routeName = '/navigation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation')),
      body: const Center(
        child: SDText.body('Coming in v0.5'),
      ),
    );
  }
}