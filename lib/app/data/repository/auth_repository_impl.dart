import 'package:tree_plantation_mobile/app/data/model/request/login_request.dart';
import 'package:tree_plantation_mobile/app/data/model/request/sign_up_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/login_response.dart';
import 'package:tree_plantation_mobile/app/data/model/response/sign_up_response.dart';
import 'package:tree_plantation_mobile/app/data/remote/auth_remote_source.dart';
import 'package:tree_plantation_mobile/app/data/remote/auth_remote_source_impl.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteSource _authRemoteSource = AuthRemoteSourceImpl();

  @override
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) {
    return _authRemoteSource.signUp(signUpRequest);
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _authRemoteSource.login(loginRequest);
  }
}
