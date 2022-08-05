abstract class PreferenceManager {
  static const keyToken = "token";
  static const String databaseName = "tree_plantation_data";
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String userId = "userId";
  static const String userName = "userName";
  static const String name = "name";
  static const String email = "email";
  static const String phone = "phone";
  static const String userDetailId = "userDetailId";
  static const String profilePictureLink = "profilePictureLink";
  static const String profileDetailsCreated = "profileDetailsCreated";

  String getString(String key, {String defaultValue = ""});

  void setString(String key, String value);

  int getInt(String key, {int defaultValue = 0});

  void setInt(String key, int value);

  double getDouble(String key, {double defaultValue = 0.0});

  void setDouble(String key, double value);

  bool getBool(String key, {bool defaultValue = false});

  void setBool(String key, bool value);

  List<String> getStringList(String key,
      {List<String> defaultValue = const []});

  void setStringList(String key, List<String> value);

  void remove(String key);

  void clear();
}
