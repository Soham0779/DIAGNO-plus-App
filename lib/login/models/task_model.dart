import 'package:flutter/cupertino.dart';

class TaskModel {
  String taskId;
  String taskName;
  int dt;

  TaskModel({
    @required this.taskId,
    @required this.taskName,
    @required this.dt,
  });

  static TaskModel fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskId: map['taskId'],
      taskName: map['taskName'],
      dt: map['dt'],
    );
  }
}
