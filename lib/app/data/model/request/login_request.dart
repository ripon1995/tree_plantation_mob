class LoginRequest {
  String email = "";
  String password = "";

  LoginRequest(this.email, this.password);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;

    return map;
  }
}
