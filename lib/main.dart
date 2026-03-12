

import 'package:flutter/material.dart';
import 'package:simple_design/router.dart';

void main(){
  runApp(SimpleApp());
}


class SimpleApp extends StatelessWidget {
  const SimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Simple Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue))
    );
  }
}