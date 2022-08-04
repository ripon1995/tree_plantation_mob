class ProfileDetailResponse {
  String? message;
  Data? data;

  ProfileDetailResponse({
    this.message,
    this.data,
  });

  ProfileDetailResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
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
  String? profile_picture_link;

  Data({
    this.id,
    this.profile_picture_link,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    profile_picture_link = json['profile_picture_link'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['profile_picture_link'] = profile_picture_link;

    return map;
  }
}
