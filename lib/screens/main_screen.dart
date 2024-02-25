//ここよく分からないので質問
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kokorahenn_flutter/api/service/location_notifier.dart';
import 'package:kokorahenn_flutter/screens/search_screen.dart';
// Project imports:
import 'package:kokorahenn_flutter/screens/setting_screen.dart';
import 'package:kokorahenn_flutter/widgets/bottom_navigation.dart';

final baseTabViewProvider = StateProvider<ViewType>((ref) => ViewType.home);

enum ViewType { home, setting }

class MainPage extends ConsumerWidget {
  MainPage({super.key});

  final widgets = [
    const SearchPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(locationNotifierProvider).fetchCurrentUserPosition();
    final view = ref.watch(baseTabViewProvider.notifier);

    return Scaffold(
      body: Center(
        child: widgets[view.state.index],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: view.state.index,
        onItemSelected: (int index) =>
            view.update((state) => ViewType.values[index]),
      ),
    );
  }
}
