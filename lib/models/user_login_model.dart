class UserLoginModel {
  int clientId = -1;
  String clientSecret = "";
  String username = "";
  String _password = "";

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    clientId = json["client_id"] ?? -1;
    clientSecret = json["client_secret"] ?? "";
    username = json["username"] ?? "";
    _password = json["password"] ?? "";
  }

  String get password => _password;

  @override
  String toString() {
    return 'UserLoginModel{client_id: $clientId, client_id: $clientSecret, username: $username, _password: $_password,}';
  }
}
