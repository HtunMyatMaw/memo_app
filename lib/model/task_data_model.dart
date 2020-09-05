class TaskDataModel {
  final String id; // created_datetime
  final String title;
  final String content;
  final String startDateStr;
  final String endDateStr;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final int taskProgress;

  TaskDataModel({
    this.id,
    this.title,
    this.content,
    this.startDateStr,
    this.endDateStr,
    this.startDateTime,
    this.endDateTime,
    this.taskProgress = 1,
  });
}
