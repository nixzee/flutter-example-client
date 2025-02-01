import 'package:flutter_example_client/utils/hive_storage_service/hive_storage_service.dart';
import 'package:get_it/get_it.dart';

class DependencyRegister {
  static void registerDependencies() {
    final GetIt getIt = GetIt.I;
    // Register Hive Storage
    if (!getIt.isRegistered<HiveStorageService>()) {
      getIt.registerSingleton<HiveStorageService>(HiveStorageService());
    }

    // TODO: Register dependencies
  }
}
