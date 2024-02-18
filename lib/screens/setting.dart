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
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
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
              if (Platform.isIOS)
                SettingsTile.navigation(
                  leading: const Icon(Icons.share),
                  title: const Text('このアプリをシェアする'),
                  onPressed: (BuildContext context) async {
                    await Share.share(
                      'https://apps.apple.com/jp/app/ここらへん/id0000000000',
                    );
                  },
                ),
              if (Platform.isAndroid)
                SettingsTile.navigation(
                  leading: const Icon(Icons.share),
                  title: const Text('このアプリをシェアする'),
                  onPressed: (BuildContext context) async {
                    await Share.share(
                      'https://play.google.com/store/apps/details?id=com.example.kokorahen',
                    );
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
                onPressed: (BuildContext context) async {
                  showLicensePage(
                    context: context,
                    applicationName: _packageInfo.appName,
                    applicationVersion: _packageInfo.version,
                  );
                },
              ),
              SettingsTile(
                title: const Text('バージョン情報'),
                leading: const Icon(Icons.privacy_tip),
                value: Text(_packageInfo.version),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
