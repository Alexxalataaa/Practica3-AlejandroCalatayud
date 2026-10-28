import 'package:flutter/material.dart';
import 'package:paisesgui/themes/tema_paises.dart';
import 'package:paisesgui/ui/screens/launcher_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Países',
      theme: temaPaises,
      home: const LauncherScreen(),
    );
  }
}
