// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });
  final int currentIndex;
  final void Function(int) onItemSelected;
  final home = t.bottomNavigation.home;
  final setting = t.bottomNavigation.setting;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemSelected,
      items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home), label: home),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: setting,
        ),
      ],
    );
  }
}
