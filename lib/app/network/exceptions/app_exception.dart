import 'package:tree_plantation_mobile/app/network/exceptions/base_exception.dart';

class AppException extends BaseException {
  AppException({
    String message = "",
  }) : super(message: message);
}
