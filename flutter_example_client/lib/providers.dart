import 'package:flutter_example_client/features/app_config/service/app_config_service.dart';
import 'package:provider/provider.dart';

class Providers {
  static List<ChangeNotifierProvider> register(
      AppConfigService appConfigServce) {
    return [
      // App Config Service
      ChangeNotifierProvider<AppConfigService>.value(value: appConfigServce),
      // TODO: Add other providers
    ];
  }
}
