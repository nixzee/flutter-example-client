import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config_model.g.dart';

@JsonSerializable()
class AppConfigModel {
  final String? language;
  final ThemeMode? themeMode;

  AppConfigModel({
    this.language,
    this.themeMode,
  });

  factory AppConfigModel.fromJson(Map<String, dynamic> json) {
    return _$AppConfigModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppConfigModelToJson(this);
}
