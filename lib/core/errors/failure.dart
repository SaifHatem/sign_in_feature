import 'package:api_happy_tec/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerFailure implements Exception {
  final ErrorModel errModel;

  ServerFailure({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw ServerFailure(errModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
