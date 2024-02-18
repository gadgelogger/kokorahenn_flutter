// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'screens/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ここらへん',
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
      ),
      home: const MainPage(),
    );
  }
}
