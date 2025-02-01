import 'package:flutter/material.dart';
import 'package:flutter_example_client/features/app_config/service/app_config_service.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TopAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    final AppConfigService appConfigService =
        Provider.of<AppConfigService>(context, listen: false);
    bool isDark = appConfigService.themeMode == ThemeMode.dark;

    return AppBar(
      scrolledUnderElevation: 0.0,
      elevation: 0.0,
      leading: IconButton(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
        ),
      ),
      leadingWidth: 40.0,
      title: Row(
        children: [
          InkWell(
            onTap: () => context.go('/'),
            child: const Text("Some Logo"), // TODO Add logo
          ),
          const Spacer(),
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: IconButton(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                setState(() {
                  ThemeMode themeMode =
                      (isDark) ? ThemeMode.dark : ThemeMode.light;
                  appConfigService.themeMode = themeMode;
                });
              },
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
