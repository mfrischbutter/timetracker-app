class LoginRequest {
  String username;
  String password;

  LoginRequest({this.username, this.password});

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
      };
}
