// Flutter imports:
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
              SettingsTile(
                title: const Text('このアプリを他の人に勧める'),
                leading: const Icon(Icons.share),
                onPressed: (BuildContext context) {
                  // ここに遷移先の画面を指定
                },
              ),
              SettingsTile(
                title: const Text('プライバシーポリシー'),
                leading: const Icon(Icons.privacy_tip),
                onPressed: (BuildContext context) {
                  // ここに遷移先の画面を指定
                },
              ),
              SettingsTile(
                title: const Text('お問い合わせはこちら'),
                leading: const Icon(Icons.info),
                onPressed: (BuildContext context) {
                  // ここに遷移先の画面を指定
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text('このアプリについて'),
            tiles: <SettingsTile>[
              SettingsTile(
                title: const Text('ライセンス'),
                leading: const Icon(Icons.terminal),
                onPressed: (BuildContext context) {
                  // ここに遷移先の画面を指定},
                },
              ),
              SettingsTile(
                title: const Text('バージョン情報'),
                leading: const Icon(Icons.privacy_tip),
                onPressed: (BuildContext context) {
                  // ここに遷移先の画面を指定
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
