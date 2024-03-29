import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tree_plantation_mobile/app/core/base/base_remote_source.dart';
import 'package:tree_plantation_mobile/app/data/model/request/login_request.dart';
import 'package:tree_plantation_mobile/app/data/model/request/sign_up_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/login_response.dart';
import 'package:tree_plantation_mobile/app/data/model/response/sign_up_response.dart';
import 'package:tree_plantation_mobile/app/data/model/response/user_profile.dart';
import 'package:tree_plantation_mobile/app/data/remote/auth-remote/auth_remote_source.dart';
import 'package:tree_plantation_mobile/app/network/dio_provider.dart';

class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  // Sign up start

  @override
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) {
    var endpoint = "${DioProvider.baseUrl}/auth/users/";
    String json = jsonEncode(signUpRequest);
    var dioCall = dioClient.post(endpoint, data: json);

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

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    var endpoint = "${DioProvider.baseUrl}/auth/jwt/create/";
    String json = jsonEncode(loginRequest);

    var dioCall = dioClient.post(endpoint, data: json);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseLoginResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  LoginResponse _parseLoginResponse(Response<dynamic> response) {
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<UserProfile> userProfile() {
    var endpoint = "${DioProvider.baseUrl}/auth/users/me/";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((response) => _parseUserProfile(response));
    } catch (e) {
      rethrow;
    }
  }

  UserProfile _parseUserProfile(Response<dynamic>response) {
    return UserProfile.fromJson(response.data);
  }



}
