/// message : "success"
/// data : {"id":3,"name":"AL AMIN RIPON","username":"rootless","email":"ripon1995dc@gmail.com","phone":"01791015207","password":"rootless"}

class SignUpModel {
  SignUpModel({
      String message, 
      Data data,}){
    _message = message;
    _data = data;
}

  SignUpModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String _message;
  Data _data;

  String get message => _message;
  Data get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data.toJson();
    }
    return map;
  }

}

/// id : 3
/// name : "AL AMIN RIPON"
/// username : "rootless"
/// email : "ripon1995dc@gmail.com"
/// phone : "01791015207"
/// password : "rootless"

class Data {
  Data({
      int id, 
      String name, 
      String username, 
      String email, 
      String phone, 
      String password,}){
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _phone = phone;
    _password = password;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
  }
  int _id;
  String _name;
  String _username;
  String _email;
  String _phone;
  String _password;

  int get id => _id;
  String get name => _name;
  String get username => _username;
  String get email => _email;
  String get phone => _phone;
  String get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    return map;
  }

}