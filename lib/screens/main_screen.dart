// main_screen.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:kokorahenn_flutter/screens/setting_screen.dart';
import 'package:kokorahenn_flutter/screens/tutorial_screen.dart';
import 'package:kokorahenn_flutter/widgets/bottom_navigation.dart';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart'; //import_sorter:keep

import 'search_screen.dart'; //import_sorter:keep

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool _isFirstLaunch = true;

  static const List<Widget> _widgetOptions = <Widget>[
    SearchPage(),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      if (!mounted) {
        return;
      }

      await Navigator.of(context).push<TutorialScreen>(
        MaterialPageRoute(builder: (_) => TutorialScreen()),
      );
      await prefs.setBool('isFirstLaunch', false);
    }

    setState(() {
      _isFirstLaunch = false;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstLaunch) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
