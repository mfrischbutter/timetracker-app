List<Project> projectsFromResponse(List<dynamic> items) =>
    new List<Project>.from(items.map((x) => Project.fromJson(x)));

class Project {
  int id;
  String name;
  String jiraId;
  String ticketSystem;
  int customer;
  int active;
  int global;
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
        customer: int.parse(json['project']['customer']),
        active: int.parse(json['project']['active']),
        global: int.parse(json['project']['global']),
        estimation: json['project']['estimation'],
        estimationText: json['project']['estimationText'],
      );
}
