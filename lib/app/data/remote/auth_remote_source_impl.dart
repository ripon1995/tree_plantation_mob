import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tree_plantation_mobile/app/core/base/base_remote_source.dart';
import 'package:tree_plantation_mobile/app/data/model/request/sign_up_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/sign_up_response.dart';
import 'package:tree_plantation_mobile/app/data/remote/auth_remote_source.dart';
import 'package:tree_plantation_mobile/app/network/dio_provider.dart';

class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  @override
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) {
    var endpoint = "${DioProvider.baseUrl}/customers/signup/";
    String json = jsonEncode(signUpRequest);
    var dioCall = dioClient.post(endpoint,data: json);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseSignUpResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  SignUpResponse _parseSignUpResponse(Response<dynamic> response) {
    return SignUpResponse.fromJson(response.data);
  }
}
