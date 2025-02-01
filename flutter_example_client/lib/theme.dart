import 'package:flutter/material.dart';

class AppTheme {
  // TODO: Add color pallete

  ThemeData get dark {
    final ThemeData theme = ThemeData(
      brightness: Brightness.dark,
    );
    return theme.copyWith(
        // TODO: Set theme of you widgets if need be
        );
  }

  ThemeData get light {
    final ThemeData theme = ThemeData(
      brightness: Brightness.light,
    );
    return theme.copyWith(
        // TODO: Set theme of you widgets if need be
        );
  }
}
