import 'package:flutter/material.dart';
import 'package:flutter_example_client/features/app_shell/views/app_shell.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppShell(body: Placeholder());
  }
}
