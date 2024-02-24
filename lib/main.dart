// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kokorahenn_flutter/api/service/location_service.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';
import 'package:kokorahenn_flutter/screens/main_screen.dart';
import 'package:kokorahenn_flutter/theme/share_preferences_instance.dart';
import 'package:kokorahenn_flutter/theme/theme_mode_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesInstance.initialize();
  LocaleSettings.useDeviceLocale();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: MaterialAppの前にロジック含めた処理 + State更新をするのは不敵切。MainPageの中でやってください。
    ref.read(locationNotifierProvider).fetchCurrentUserPosition();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ここらへん',
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ref.watch(themeModeProvider),
      home: const MainPage(),
    );
  }
}

ThemeData _buildTheme(Brightness brightness) {
  return ThemeData(
    colorSchemeSeed: Colors.orange,
    useMaterial3: true,
    brightness: brightness,
  );
}

// FIX: LocationNotifierクラスと同じファイルに記載するほうが適している
final locationNotifierProvider =
    ChangeNotifierProvider((ref) => LocationNotifier());
