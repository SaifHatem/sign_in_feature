import 'package:api_happy_tec/core/api/endpoints.dart';

class ErrorModel {
  final int statusCode;
  final String errorMessage;

  ErrorModel({required this.statusCode, required this.errorMessage});

  factory ErrorModel.fromJson(json) {
    return ErrorModel(
      statusCode: json[ApiKey.status],
      errorMessage: json[ApiKey.errorMessage],
    );
  }
}
