import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list_mobx/list/widgets/add_task.dart';
import 'package:todo_list_mobx/models/task.dart';
import 'package:todo_list_mobx/todo_list_app.dart';
part 'todo_list_store.g.dart';

class TodoListStore = _TodoListStoreBase with _$TodoListStore;

abstract class _TodoListStoreBase with Store {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  Task _currentTask = Task();

  Task get getCurrentTask => _currentTask;

  @observable
  List<Task> taskList = ObservableList<Task>();

  @action
  addTask(Task task) {
    taskList.add(task);
  }

  @action
  updateCurrentTask(Task task) {
    _currentTask = task;
  }

  goToAddTask() {
    navigatorKey.currentState
        .push(MaterialPageRoute(builder: (context) => AddTask()));
  }

  @action
  void editTask(Task task, index) {
    taskList[index] = task;

    taskList = taskList;
  }

  @action
  void removeTask(Task task) {}

  List<Task> getTaskList() {
    return taskList;
  }

  dispose() {}
}
