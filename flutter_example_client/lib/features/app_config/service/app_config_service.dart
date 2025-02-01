import 'package:flutter/material.dart';
import 'package:flutter_example_client/features/app_config/models/app_config_model.dart';
import 'package:flutter_example_client/utils/hive_storage_service/hive_storage_service.dart';
import 'package:get_it/get_it.dart';

class AppConfigService extends ChangeNotifier {
  Locale? _locale;
  ThemeMode? _themeMode;

  AppConfigService(AppConfigModel? appConfigModel) {
    if (appConfigModel?.language != null) {
      _locale = Locale(appConfigModel!.language!);
    }
    _themeMode = appConfigModel?.themeMode;
  }

  // Theme Mode
  ThemeMode get themeMode => _themeMode ?? ThemeMode.light;
  set themeMode(ThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    _save();
    notifyListeners();
  }

  // Locale
  Locale? get locale => _locale;
  set locale(Locale? newLocale) {
    _locale = newLocale;
    _save();
    notifyListeners();
  }

  Future<void> _save() async {
    GetIt.I.get<HiveStorageService>().set(
        "appConfig",
        AppConfigModel(
          themeMode: _themeMode,
          language: _locale?.languageCode,
        ));
  }
}
