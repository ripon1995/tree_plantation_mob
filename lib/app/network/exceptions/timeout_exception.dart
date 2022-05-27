import 'package:tree_plantation_mobile/app/network/exceptions/base_exception.dart';

class TimeoutException extends BaseException {
  TimeoutException(String message) : super(message: message);
}
