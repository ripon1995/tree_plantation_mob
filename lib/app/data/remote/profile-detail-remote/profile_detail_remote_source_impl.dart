import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:tree_plantation_mobile/app/core/base/base_remote_source.dart';
import 'package:tree_plantation_mobile/app/data/model/request/profile_details_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/profile_detail_response.dart';
import 'package:tree_plantation_mobile/app/data/remote/profile-detail-remote/profile_detail_remote_source.dart';
import 'package:tree_plantation_mobile/app/network/dio_provider.dart';

class ProfileDetailRemoteSourceImpl extends BaseRemoteSource
    implements ProfileDetailRemoteSource {
  @override
  Future<ProfileDetailResponse> createProfileDetail(
      ProfileDetailRequest profileDetailRequest) {
    var endpoint = "${DioProvider.baseUrl}/customer/details/";
    String json = jsonEncode(profileDetailRequest);

    var dioCall = dioClient.post(endpoint, data: json);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseProfileDetailResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileDetailResponse> updateProfileDetail(
      ProfileDetailRequest profileDetailRequest, int id) {
    var endpoint = "${DioProvider.baseUrl}/customer/details/${id}/";
    String json = jsonEncode(profileDetailRequest);

    var dioCall = dioClient.put(endpoint, data: json);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseProfileDetailResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileDetailResponse> fetchProfileDetail(int id) {
    var endpoint = "${DioProvider.baseUrl}/customer/details/$id/";

    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseProfileDetailResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ProfileDetailResponse _parseProfileDetailResponse(
      Response<dynamic> response) {
    return ProfileDetailResponse.fromJson(response.data);
  }
}
