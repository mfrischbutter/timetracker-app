List<Customers> itemsFromResponse(List<dynamic> items) =>
    new List<Customers>.from(items.map((x) => Customers.fromJson(x)));

class Customers {
  String id;
  String name;
  String active;
  String global;
  String teams;

  Customers({
    this.id,
    this.name,
    this.active,
    this.global,
    this.teams,
  });

  factory Customers.fromJson(Map<String, dynamic> json) => new Customers(
        id: json['customers']['id'],
        name: json['customers']['name'],
        active: json['customers']['active'],
        global: json['customers']['global'],
        teams: json['customers']['teams'],
      );
}
