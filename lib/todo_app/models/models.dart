class Task {
  int? id;
  String? title;
  String? description;
  bool isUrgent;
  Status status;
  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isUrgent = false,
    this.status = Status.pending,
  });
}

enum Status {
  pending('Pending'),
  inProgress('In Progress'),
  completed('Completed');

  final String name;
  const Status(this.name);
}
