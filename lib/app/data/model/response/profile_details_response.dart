class ProfileDetailsResponse {
  String? profile_picture_link;

  ProfileDetailsResponse(this.profile_picture_link);

  ProfileDetailsResponse.fromJson(dynamic json) {
    profile_picture_link = json['profile_picture_link'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_picture_link'] = profile_picture_link;

    return map;
  }
}
