import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/model/request/profile_details_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/profile_detail_response.dart';
import 'package:tree_plantation_mobile/app/data/remote/profile-detail-remote/profile_detail_remote_source.dart';
import 'package:tree_plantation_mobile/app/data/repository/profile-detail-repo/profile_detail_repository.dart';

class ProfileDetailRepositoryImpl extends ProfileDetailRepository {
  final ProfileDetailRemoteSource _profileDetailRemoteSource =
      Get.find(tag: (ProfileDetailRemoteSource).toString());

  @override
  Future<ProfileDetailResponse> createProfileDetail(
      ProfileDetailRequest profileDetailRequest) {
    return _profileDetailRemoteSource.createProfileDetail(profileDetailRequest);
  }

  @override
  Future<ProfileDetailResponse> updateProfileDetail(
      ProfileDetailRequest profileDetailRequest, int id) {
    return _profileDetailRemoteSource.updateProfileDetail(
        profileDetailRequest, id);
  }

  @override
  Future<ProfileDetailResponse> fetchProfileDetail(int id) {
    return _profileDetailRemoteSource.fetchProfileDetail(id);
  }
}
