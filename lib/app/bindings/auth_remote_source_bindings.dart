import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/remote/auth-remote/auth_remote_source.dart';
import 'package:tree_plantation_mobile/app/data/remote/auth-remote/auth_remote_source_impl.dart';

class AuthRemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteSource>(() => AuthRemoteSourceImpl(),
        tag: (AuthRemoteSource).toString());
  }
}
