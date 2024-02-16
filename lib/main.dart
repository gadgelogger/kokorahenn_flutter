// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'screens/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kokorahenn Flutter',
      home: MainPage(),
    );
  }
}
