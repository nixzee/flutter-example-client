import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_example_client/app.dart';
import 'package:flutter_example_client/dependencies.dart';
import 'package:flutter_example_client/features/app_config/models/app_config_model.dart';
import 'package:flutter_example_client/features/app_config/service/app_config_service.dart';
import 'package:flutter_example_client/providers.dart';
import 'package:flutter_example_client/utils/hive_storage_service/hive_storage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // Register Dependencies
      DependencyRegister.registerDependencies();
      // Initialize App Config Service
      final HiveStorageService hiveStorageService =
          GetIt.I.get<HiveStorageService>();
      final AppConfigService appConfigService = AppConfigService(
          AppConfigModel.fromJson(await hiveStorageService.get("appConfig")));

      runApp(
        MultiProvider(
          providers: Providers.register(appConfigService),
          child: const App(),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
