import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth-repo/auth_repository.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth-repo/auth_repository_impl.dart';

class AuthRepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(),
        tag: (AuthRepository).toString());
  }
}
