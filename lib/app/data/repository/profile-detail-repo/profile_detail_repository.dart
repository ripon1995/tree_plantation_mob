import 'package:tree_plantation_mobile/app/data/model/request/profile_details_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/profile_detail_response.dart';

abstract class ProfileDetailRepository {
  Future<ProfileDetailResponse> createProfileDetail(
      ProfileDetailRequest profileDetailRequest);

  Future<ProfileDetailResponse> updateProfileDetail(
      ProfileDetailRequest profileDetailRequest,int id);

  Future<ProfileDetailResponse> fetchProfileDetail(int id);
}
