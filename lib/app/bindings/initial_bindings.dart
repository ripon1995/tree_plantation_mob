import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/bindings/auth_remote_source_bindings.dart';
import 'package:tree_plantation_mobile/app/bindings/auth_repository_bindings.dart';
import 'package:tree_plantation_mobile/app/bindings/local_source_bindings.dart';
import 'package:tree_plantation_mobile/app/bindings/profile_detail_remote_source_bindings.dart';
import 'package:tree_plantation_mobile/app/bindings/profile_detail_repository_bindings.dart';

class InitialBindings implements Bindings {

  @override
  void dependencies() {
    AuthRepositoryBindings().dependencies();
    AuthRemoteSourceBindings().dependencies();
    LocalSourceBindings().dependencies();
    ProfileDetailRepositoryBindings().dependencies();
    ProfileDetailRemoteSourceBindings().dependencies();
  }
}