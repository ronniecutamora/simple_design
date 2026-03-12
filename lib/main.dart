import 'package:flutter/material.dart';
import 'package:simple_design/router.dart';
import 'package:simple_design/simple_design.dart';

void main() {
  runApp(const SimpleApp());
}

class SimpleApp extends StatelessWidget {
  const SimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Simple Design',
      debugShowCheckedModeBanner: false,
      theme: SDTheme.withSeed(const Color.fromARGB(255, 243, 33, 124)),
      darkTheme: SDTheme.withSeed(Color.fromARGB(255, 243, 33, 124), brightness: Brightness.dark),
      themeMode: ThemeMode.system,
    );
  }
}
