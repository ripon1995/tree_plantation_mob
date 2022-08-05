import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/remote/profile-detail-remote/profile_detail_remote_source.dart';
import 'package:tree_plantation_mobile/app/data/remote/profile-detail-remote/profile_detail_remote_source_impl.dart';

class ProfileDetailRemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDetailRemoteSource>(
      () => ProfileDetailRemoteSourceImpl(),
      tag: (ProfileDetailRemoteSource).toString(),
    );
  }
}
