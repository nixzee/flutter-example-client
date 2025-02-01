import 'package:flutter/material.dart';
import 'package:flutter_example_client/features/app_shell/views/side_menu.dart';
import 'package:flutter_example_client/features/app_shell/views/top_app_bar.dart';

class AppShell extends StatelessWidget {
  final Widget body;

  const AppShell({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return _mobileView();
      } else {
        return _tabletView();
      }
    });
  }

  Widget _mobileView() {
    return Scaffold(
      appBar: TopAppBar(),
      drawer: SideMenu(),
      body: SafeArea(child: body),
    );
  }

  Widget _tabletView() {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SideMenu(),
            Expanded(
              child: Scaffold(
                appBar: TopAppBar(),
                body: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
