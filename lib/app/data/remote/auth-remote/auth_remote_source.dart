import 'package:tree_plantation_mobile/app/data/model/request/login_request.dart';
import 'package:tree_plantation_mobile/app/data/model/request/sign_up_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/login_response.dart';
import 'package:tree_plantation_mobile/app/data/model/response/sign_up_response.dart';
import 'package:tree_plantation_mobile/app/data/model/response/user_profile.dart';

abstract class AuthRemoteSource {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest);

  Future<LoginResponse> login(LoginRequest loginRequest);

  Future<UserProfile> userProfile();
}
