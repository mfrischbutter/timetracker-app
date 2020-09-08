List<Projects> projectsFromResponse(List<dynamic> items) =>
    new List<Projects>.from(items.map((x) => Projects.fromJson(x)));

class Projects {
  int id;
  String name;
  String jiraId;
  String ticketSystem;
  String customer;
  String active;
  String global;
  String estimation;
  String estimationText;

  Projects({
    this.id,
    this.name,
    this.jiraId,
    this.ticketSystem,
    this.customer,
    this.active,
    this.global,
    this.estimation,
    this.estimationText,
  });

  factory Projects.fromJson(Map<String, dynamic> json) => new Projects(
        id: int.parse(json['project']['id']),
        name: json['project']['name'],
        jiraId: json['project']['jiraId'],
        ticketSystem: json['project']['ticket_system'],
        customer: json['project']['customer'],
        active: json['project']['active'],
        global: json['project']['global'],
        estimation: json['project']['estimation'],
        estimationText: json['project']['estimationText'],
      );
}
