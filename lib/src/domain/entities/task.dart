class Task {
  const Task({
    this.id,
    required this.description,
    required this.scheduledDay,
    this.isComplete = false,
  });

  final int? id;

  final String description;

  final DateTime scheduledDay;

  final bool isComplete;

  Task.empty()
      : id = 0,
        description = '',
        scheduledDay = DateTime.now(),
        isComplete = false;
}
