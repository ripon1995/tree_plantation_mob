import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/local/preference/preference_manager.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final accessToken =
        await _preferenceManager.getString(PreferenceManager.accessToken) ?? "";
    var customHeaders = {'content-type': 'application/json'};
    customHeaders.addAll({'Authorization': 'Bearer $accessToken'});
    return customHeaders;
  }
}
