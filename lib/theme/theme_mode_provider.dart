// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:kokorahenn_flutter/theme/share_preferences_instance.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    state = _loadThemeMode() ?? ThemeMode.system;
  }
  static const String keyThemeMode = 'theme_mode';

  final _prefs = SharedPreferencesInstance().prefs;

  Future<void> toggle() async {
    ThemeMode themeMode;
    switch (state) {
      case ThemeMode.light:
        themeMode = ThemeMode.dark;
      case ThemeMode.dark:
        themeMode = ThemeMode.system;
      case ThemeMode.system:
        themeMode = ThemeMode.light;
    }
    await _saveThemeMode(themeMode).then((value) {
      if (value) {
        state = themeMode;
      }
    });
  }

  ThemeMode? _loadThemeMode() {
    final loaded = _prefs.getString(keyThemeMode);
    if (loaded == null) {
      return null;
    }
    return ThemeMode.values.byName(loaded);
  }

  Future<bool> _saveThemeMode(ThemeMode themeMode) =>
      _prefs.setString(keyThemeMode, themeMode.name);
}

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);
