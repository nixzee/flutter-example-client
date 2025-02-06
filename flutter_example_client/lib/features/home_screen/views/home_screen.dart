import 'package:flutter/material.dart';
import 'package:flutter_example_client/features/app_shell/views/app_shell.dart';
import 'package:flutter_example_client/features/home_screen/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeScreenProvider homeScreenProvider =
        Provider.of<HomeScreenProvider>(context);

    return PopScope(
      canPop: false,
      child: AppShell(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AbsorbPointer(
              // Over kill
              absorbing: true,
              child: SizedBox(
                width: 100.0,
                child: TextField(
                  controller: homeScreenProvider.textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            IconButton(
              onPressed: () {
                homeScreenProvider.increment();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      )),
    );
  }
}
