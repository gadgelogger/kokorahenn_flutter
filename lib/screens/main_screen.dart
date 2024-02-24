// FIX: このコメントは何のため...??
//消しました（多分import_sorterを実行した際にできた説が濃厚）
//https://zenn.dev/nishiyama/articles/117ba152b36a2b315c7a#views%2Fbase_tab_view.dart
//この記事を参考にRiverpodを用いたButtonNavigationを導入
// TODO: 全体のアーキテクチャとして、screenとwidgetが（視覚的に）離れているのは微妙な感じがする
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

// FIX:　管理したいならkeyThemeMode見たいにしっかり管理したほうがいいし、そういうのをenumか定数ファイルで管理していくと良い
// FIX: pushに指定するgenericsの意図がわかってなさそう！

//ここ理解できていないので一旦削除

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(locationNotifierProvider).fetchCurrentUserPosition();
    final view = ref.watch(baseTabViewProvider.state);

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
