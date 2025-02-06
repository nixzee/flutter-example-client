// ignore: use_string_in_part_of_directives
part of api.client.example;

@JsonSerializable()
class ExampleResponseModel {
  final String exampleField;

  ExampleResponseModel({required this.exampleField});

  factory ExampleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleResponseModelToJson(this);
}
