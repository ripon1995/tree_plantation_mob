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

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getProfile() async {
    UserProfile? profile = await _authRepository.userProfile();
    if (profile.detail?.id != null) {
      await _preferenceManager.setString(
          PreferenceManager.email, profile.detail!.email.toString());
      await _preferenceManager.setString(
          PreferenceManager.name, profile.detail!.name.toString());
    }
    printData();
  }

  void printData() async {
    String name = await _preferenceManager.getString(PreferenceManager.name);
    String email = await _preferenceManager.getString(PreferenceManager.email);
    Log.debug("Fetching user profile from preference");
    Log.debug("name : $name");
    Log.debug("email : $email");
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
