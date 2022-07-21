class UserProfile {
  String? message;
  Detail? detail;

  UserProfile({this.message, this.detail});

  UserProfile.fromJson(dynamic json) {
    message = json['message'];
    detail = Detail.fromJson(json['detail']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['detail'] = detail;

    return map;
  }
}

class Detail {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;

  Detail({this.id, this.name, this.username, this.phone, this.email});

  Detail.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] - id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;

    return map;
  }
}
