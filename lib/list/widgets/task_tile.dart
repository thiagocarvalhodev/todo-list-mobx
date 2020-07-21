import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mobx/list/store/todo_list_store.dart';
import 'package:todo_list_mobx/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;

  TaskTile(this.task, this.index);

  @override
  Widget build(BuildContext context) {
    final todoListStore = Provider.of<TodoListStore>(context);
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(task.date?.toIso8601String() ?? ''),
      trailing: Checkbox(
        value: task.isFinished,
        onChanged: (bool value) {
          task.isFinished = value;
          todoListStore.editTask(task, index);
        },
      ),
    );
  }
}
