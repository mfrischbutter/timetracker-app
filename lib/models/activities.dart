List<Activities> activitiesFromResponse(List<dynamic> items) =>
    new List<Activities>.from(items.map((x) => Activities.fromJson(x)));

class Activities {
  int id;
  String name;
  bool needsTicket;
  int factor;

  Activities({
    this.id,
    this.name,
    this.needsTicket,
    this.factor,
  });

  factory Activities.fromJson(Map<String, dynamic> json) => new Activities(
        id: int.parse(json['activity']['id']),
        name: json['activity']['name'],
        needsTicket: json['activity']['needsTicket'],
        factor: json['activity']['factor'],
      );
}
