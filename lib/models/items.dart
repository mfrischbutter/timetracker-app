import 'dart:convert';

List<Items> dataFromJson(String str) => new List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String dataToJson(List<Items> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
    int id;
    String date;
    String start;
    String end;
    String user;
    String customer;

    Items({
      this.id,
      this.user,
    });

    factory Items.fromJson(List<dynamic> json) => new Items(
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "user": user,
    };
}