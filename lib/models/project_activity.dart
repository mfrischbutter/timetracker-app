List<ProjectActivity> activitiesFromResponse(List<dynamic> items) =>
    new List<ProjectActivity>.from(
        items.map((x) => ProjectActivity.fromJson(x)));

class ProjectActivity {
  int id;
  String name;
  bool needsTicket;
  int factor;

  ProjectActivity({
    this.id,
    this.name,
    this.needsTicket,
    this.factor,
  });

  factory ProjectActivity.fromJson(Map<String, dynamic> json) =>
      new ProjectActivity(
        id: json['activity']['id'],
        name: json['activity']['name'],
        needsTicket: json['activity']['needsTicket'],
        factor: json['activity']['factor'],
      );
}
