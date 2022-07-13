abstract class PreferenceManager {
  static const keyToken = "token";
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String userId = "userId";
  static const String userName = "userName";
  static const String name = "name";
  static const String email = "email";
  static const String phone = "phone";

  Future<String> getString(String key, {String defaultValue = ""});

  Future<bool> setString(String key, String value);

  Future<int> getInt(String key, {int defaultValue = 0});

  Future<bool> setInt(String key, int value);

  Future<double> getDouble(String key, {double defaultValue = 0.0});

  Future<bool> setDouble(String key, double value);

  Future<bool> getBool(String key, {bool defaultValue = false});

  Future<bool> setBool(String key, bool value);

  Future<List<String>> getStringList(String key,
      {List<String> defaultValue = const []});

  Future<bool> setStringList(String key, List<String> value);

  Future<bool> remove(String key);

  Future<bool> clear();
}
