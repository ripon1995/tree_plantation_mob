import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:tree_plantation_mobile/app/network/dio_provider.dart';
import 'package:tree_plantation_mobile/app/network/error_handlers.dart';
import 'package:tree_plantation_mobile/app/network/exceptions/base_exception.dart';
import 'package:tree_plantation_mobile/flavors/build_config.dart';


abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  final logger = BuildConfig.instance.config.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] !=
              HttpStatus.ok) {
        // do
      }

      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e(
          "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
