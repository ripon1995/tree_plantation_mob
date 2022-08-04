import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/repository/profile-detail-repo/profile_detail_repository.dart';
import 'package:tree_plantation_mobile/app/data/repository/profile-detail-repo/profile_detail_repository_impl.dart';

class ProfileDetailRepositoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDetailRepository>(
      () => ProfileDetailRepositoryImpl(),
      tag: (ProfileDetailRepository).toString(),
    );
  }
}
