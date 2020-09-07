List<Customers> customersFromResponse(List<dynamic> items) =>
    new List<Customers>.from(items.map((x) => Customers.fromJson(x)));

class Customers {
  int id;
  String name;
  String active;
  String global;
  List teams;

  Customers({
    this.id,
    this.name,
    this.active,
    this.global,
    this.teams,
  });

  factory Customers.fromJson(Map<String, dynamic> json) => new Customers(
        id: int.parse(json['customer']['id']),
        name: json['customer']['name'],
        active: json['customer']['active'],
        global: json['customer']['global'],
        teams: json['customer']['teams'],
      );
}
