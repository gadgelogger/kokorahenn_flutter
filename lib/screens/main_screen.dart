// FIX: このコメントは何のため...??
// main_screen.dart

// TODO: 全体のアーキテクチャとして、screenとwidgetが（視覚的に）離れているのは微妙な感じがする

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

  static final List<Widget> _widgetOptions = <Widget>[
    const SearchPage(),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    // TODO:　管理したいならkeyThemeMode見たいにしっかり管理したほうがいいし、そういうのをenumか定数ファイルで管理していくと良い
    final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      if (!mounted) {
        return;
      }

      // TODO: pushに指定するgenericsの意図がわかってなさそう！
      await Navigator.of(context).push<TutorialScreen>(
        MaterialPageRoute(builder: (_) => const TutorialScreen()),
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
