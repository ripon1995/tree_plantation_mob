class SignUpResponse {
  String? message;
  Data? data;

  SignUpResponse({this.message, this.data});

  SignUpResponse.fromJson(dynamic json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;

    return map;
  }
}

class Data {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? password;

  Data(
      {this.id,
      this.name,
      this.username,
      this.phone,
      this.email,
      this.password});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] - id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;

    return map;
  }
}
