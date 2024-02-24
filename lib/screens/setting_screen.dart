// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';
import 'package:kokorahenn_flutter/screens/tutorial_screen.dart';
import 'package:kokorahenn_flutter/theme/theme_mode_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingPage extends ConsumerWidget {
  SettingPage({super.key});
  final setting = t.settingsScreen;
  // FIX: 使い所1箇所なら変数定義の意味はないかも
  //直接呼び出すように変更しました。(44行目)
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(setting.title),
      ),
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          final packageInfo = snapshot.data;
          return SettingsList(
            sections: [
              SettingsSection(
                title: Text(setting.themeTitle),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: Text(setting.theme),
                    leading: const Icon(Icons.color_lens),
                    // FIX: せっかくproviderで状態として持たせてるから直接参照したらいいだけだと思います
                    //直接ref.watchで呼ぶようにしました。
                    trailing: Text(
                      ref.watch(themeModeProvider).toString(),
                    ),
                    onPressed: (_) async {
                      await ref.read(themeModeProvider.notifier).toggle();
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: Text(setting.othersTitle),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.share),
                    title: Text(setting.share),
                    onPressed: (_) async {
                      final url = Platform.isIOS
                          ? 'https://apps.apple.com/jp/app/ここらへん/id0000000000'
                          : 'https://play.google.com/store/apps/details?id=com.example.kokorahen';
                      await Share.share(url);
                    },
                  ),
                  SettingsTile.navigation(
                    title: Text(setting.privacy),
                    leading: const Icon(Icons.privacy_tip),
                    onPressed: (BuildContext context) {
                      launchUrlString('https://gadgelogger.com/kokorahenn/');
                    },
                  ),
                  SettingsTile.navigation(
                    title: Text(setting.contact),
                    leading: const Icon(Icons.info),
                    onPressed: (BuildContext context) {
                      launchUrlString('https://x.com/gadgelogger?s=21');
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: Text(setting.info),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: Text(setting.tutorial),
                    leading: const Icon(Icons.star_border_outlined),
                    onPressed: (_) {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) => const TutorialScreen(),
                        ),
                      );
                    },
                  ),
                  SettingsTile.navigation(
                    title: Text(setting.license),
                    leading: const Icon(Icons.terminal),
                    onPressed: (_) => showLicensePage(
                      context: context,
                      applicationName: packageInfo?.appName ?? setting.error,
                      applicationVersion: packageInfo?.version ?? setting.error,
                    ),
                  ),
                  SettingsTile(
                    title: Text(setting.version),
                    leading: const Icon(Icons.info_outline),
                    value: Text(packageInfo?.version ?? setting.error),
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
