List<Project> projectsFromResponse(List<dynamic> items) =>
    new List<Project>.from(items.map((x) => Project.fromJson(x)));

class Project {
  int id;
  String name;
  String jiraId;
  String ticketSystem;
  String customer;
  String active;
  String global;
  String estimation;
  String estimationText;

  Project({
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

  factory Project.fromJson(Map<String, dynamic> json) => new Project(
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
