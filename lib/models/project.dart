List<Project> projectsFromResponse(List<dynamic> items) =>
    new List<Project>.from(items.map((x) => Project.fromJson(x)));

class Project {
  int id;
  String name;
  String jiraId;
  int ticketSystem;
  int customer;
  int active;
  int global;
  int estimation;
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
        id: json['project']['id'],
        name: json['project']['name'],
        jiraId: json['project']['jiraId'],
        ticketSystem: json['project']['ticket_system'],
        customer: json['project']['customer'],
        active: json['project']['active'] ? 1 : 0,
        global: json['project']['global'] ? 1 : 0,
        estimation: json['project']['estimation'],
        estimationText: json['project']['estimationText'],
      );
}
