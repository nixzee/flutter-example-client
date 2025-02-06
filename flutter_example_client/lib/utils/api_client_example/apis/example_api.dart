// ignore: use_string_in_part_of_directives
part of api.client.example;

class ExampleApi {
  final ApiClient _apiClient;

  ExampleApi(this._apiClient);

  Future<ExampleResponseModel> getExample() async {
    final response =
        await _apiClient.invoke(endpoint: '/example', method: 'GET');
    return ExampleResponseModel.fromJson(response.data);
  }
}
