List<Customer> customersFromResponse(List<dynamic> items) =>
    new List<Customer>.from(items.map((x) => Customer.fromJson(x)));

class Customer {
  int id;
  String name;
  bool active;
  int global;
  List teams;

  Customer({
    this.id,
    this.name,
    this.active,
    this.global,
    this.teams,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => new Customer(
        id: json['customer']['id'],
        name: json['customer']['name'],
        active: json['customer']['active'],
        //Theses vars only needed if calling /getAllCustomers
        // global: int.parse(json['customer']['global']),
        // teams: json['customer']['teams'],
      );
}
