class ProfileDetailRequest {
  String profile_picture_link = "";

  ProfileDetailRequest(this.profile_picture_link);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_picture_link'] = profile_picture_link;

    return map;
  }
}
