class SignUpRequest {
  String username = "";
  String name = "";
  String email = "";
  String phone = "";
  String password = "";

  SignUpRequest(
      this.name, this.username, this.email, this.phone, this.password);

  Map<String,dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;

    return map;
  }
}
