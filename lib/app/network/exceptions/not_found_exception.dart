import 'dart:io';
import 'package:tree_plantation_mobile/app/network/exceptions/api_exception.dart';

class NotFoundException extends ApiException {
  NotFoundException(String message, String status)
      : super(httpCode: HttpStatus.notFound, status: status, message: message);
}
