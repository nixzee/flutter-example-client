import 'package:flutter_example_client/features/app_config/service/app_config_service.dart';
import 'package:flutter_example_client/features/home_screen/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class Providers {
  static List<ChangeNotifierProvider> register(
      AppConfigService appConfigService) {
    return [
      // App Config Service
      ChangeNotifierProvider<AppConfigService>.value(value: appConfigService),

      /// Home Screen Provider
      ChangeNotifierProvider<HomeScreenProvider>.value(
          value: HomeScreenProvider()),
      // TODO: Add other providers
    ];
  }
}
