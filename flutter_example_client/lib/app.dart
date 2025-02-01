import 'package:flutter/material.dart';
import 'package:flutter_example_client/features/app_config/service/app_config_service.dart';
import 'package:flutter_example_client/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // Get theme and app config
    final AppTheme appTheme = AppTheme();
    final appConfigService = Provider.of<AppConfigService>(context);

    return MaterialApp.router(
      title: 'Flutter Example Client',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
    );
  }
}
