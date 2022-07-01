class LoginResponse {
  String? accessToken;
  String? refreshToken;

  LoginResponse({this.accessToken, this.refreshToken});

  LoginResponse.fromJson(dynamic json) {
    accessToken = json['access'];
    refreshToken = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access'] = accessToken;
    map['refresh'] = refreshToken;

    return map;
  }
}
