// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kokorahenn_flutter/screens/tutorial_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Project imports:
import '../theme/theme_mode_provider.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggle = ref.read(themeModeProvider.notifier).toggle;

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          final packageInfo = snapshot.data;
          return SettingsList(
            sections: [
              SettingsSection(
                title: const Text('配色'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: const Text('テーマ'),
                    leading: const Icon(Icons.color_lens),
                    trailing: Text(
                      {
                            ThemeMode.light: 'ライトモード',
                            ThemeMode.dark: 'ダークモード',
                            ThemeMode.system: 'システム設定に従う',
                          }[ref.watch(themeModeProvider)] ??
                          '不明',
                    ),
                    onPressed: (_) async {
                      await toggle();
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('その他'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.share),
                    title: const Text('このアプリをシェアする'),
                    onPressed: (_) async {
                      final url = Platform.isIOS
                          ? 'https://apps.apple.com/jp/app/ここらへん/id0000000000'
                          : 'https://play.google.com/store/apps/details?id=com.example.kokorahen';
                      await Share.share(url);
                    },
                  ),
                  SettingsTile.navigation(
                    title: const Text('プライバシーポリシー'),
                    leading: const Icon(Icons.privacy_tip),
                    onPressed: (BuildContext context) {
                      launchUrlString('https://gadgelogger.com/kokorahenn/');
                    },
                  ),
                  SettingsTile.navigation(
                    title: const Text('お問い合わせはこちら'),
                    leading: const Icon(Icons.info),
                    onPressed: (BuildContext context) {
                      launchUrlString('https://x.com/gadgelogger?s=21');
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('その他情報'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: const Text('このアプリについて'),
                    leading: const Icon(Icons.star_border_outlined),
                    onPressed: (_) {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) => TutorialScreen(),
                        ),
                      );
                    },
                  ),
                  SettingsTile.navigation(
                    title: const Text('ライセンス'),
                    leading: const Icon(Icons.terminal),
                    onPressed: (_) => showLicensePage(
                      context: context,
                      applicationName: packageInfo?.appName ?? '不明',
                      applicationVersion: packageInfo?.version ?? '不明',
                    ),
                  ),
                  SettingsTile(
                    title: const Text('バージョン情報'),
                    leading: const Icon(Icons.info_outline),
                    value: Text(packageInfo?.version ?? '不明'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
