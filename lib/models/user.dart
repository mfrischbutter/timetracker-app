class UserModel {
  final username;
  final sessionId;

  UserModel({this.username, this.sessionId});

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      sessionId: json['sessionId'],
    );
  }
}
