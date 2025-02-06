import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  int _counter = 0;
  final TextEditingController _textEditingController = TextEditingController();

  TextEditingController get textEditingController => _textEditingController;

  void increment() {
    _counter++;
    _textEditingController.text = _counter.toString();
    notifyListeners();
  }
}
