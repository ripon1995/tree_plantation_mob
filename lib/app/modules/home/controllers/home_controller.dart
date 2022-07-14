import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/local/preference/preference_manager.dart';
import 'package:tree_plantation_mobile/app/data/model/response/user_profile.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository.dart';
import 'package:tree_plantation_mobile/app/log.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository =
      Get.find(tag: (AuthRepository).toString());
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());

  RxString name = "".obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


  @override
  void onClose() {}

  void increment() => count.value++;
}
