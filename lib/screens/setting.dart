// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late Future<PackageInfo> _packageInfoFuture;

  @override
  void initState() {
    super.initState();
    _packageInfoFuture = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: FutureBuilder<PackageInfo>(
        future: _packageInfoFuture,
        builder: (context, snapshot) {
          final packageInfo = snapshot.data ??
              PackageInfo(
                appName: 'Unknown',
                packageName: 'Unknown',
                version: 'Unknown',
                buildNumber: 'Unknown',
                buildSignature: 'Unknown',
                installerStore: 'Unknown',
              );

          return SettingsList(
            sections: [
              SettingsSection(
                title: const Text('配色'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.color_lens),
                    title: const Text('テーマカラー'),
                    value: const Text('端末の設定に従う'),
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
                title: const Text('このアプリについて'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: const Text('ライセンス'),
                    leading: const Icon(Icons.terminal),
                    onPressed: (_) {
                      showLicensePage(
                        context: context,
                        applicationName: packageInfo.appName,
                        applicationVersion: packageInfo.version,
                      );
                    },
                  ),
                  SettingsTile(
                    title: const Text('バージョン情報'),
                    leading: const Icon(Icons.privacy_tip),
                    value: Text(packageInfo.version),
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
