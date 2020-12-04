List<Customer> customersFromResponse(List<dynamic> items) =>
    new List<Customer>.from(items.map((x) => Customer.fromJson(x)));

class Customer {
  int id;
  String name;
  int active;
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
        id: int.parse(json['customer']['id']),
        name: json['customer']['name'],
        active: int.parse(json['customer']['active']),
        //Theses vars only needed if calling /getAllCustomers
        // global: int.parse(json['customer']['global']),
        // teams: json['customer']['teams'],
      );
}
