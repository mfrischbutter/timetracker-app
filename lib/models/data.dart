import 'dart:convert';

List<Data> dataFromJson(String str) => new List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
    DateTime createdAt;
    DateTime updatedAt;
    int id;
    String user;
    String value;
    String status;

    Data({
      this.createdAt,
      this.updatedAt,
      this.id,
      this.user,
      this.value,
      this.status,
    });

    factory Data.fromJson(Map<String, dynamic> json) => new Data(
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      id: json["id"],
      user: json["user"],
      value: json["value"],
      status: json["status"],
    );

    Map<String, dynamic> toJson() => {
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
      "id": id,
      "user": user,
      "value": value,
      "status": status,
    };
}