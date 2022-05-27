import 'dart:io';
import 'package:tree_plantation_mobile/app/network/exceptions/base_api_exception.dart';


class UnauthorizedException extends BaseApiException {
  UnauthorizedException(String message)
      : super(
            httpCode: HttpStatus.unauthorized,
            message: message,
            status: "unauthorized");
}
