// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoListStore on _TodoListStoreBase, Store {
  final _$_currentTaskAtom = Atom(name: '_TodoListStoreBase._currentTask');

  @override
  Task get _currentTask {
    _$_currentTaskAtom.reportRead();
    return super._currentTask;
  }

  @override
  set _currentTask(Task value) {
    _$_currentTaskAtom.reportWrite(value, super._currentTask, () {
      super._currentTask = value;
    });
  }

  final _$taskListAtom = Atom(name: '_TodoListStoreBase.taskList');

  @override
  List<Task> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(List<Task> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  final _$_TodoListStoreBaseActionController =
      ActionController(name: '_TodoListStoreBase');

  @override
  dynamic addTask(Task task) {
    final _$actionInfo = _$_TodoListStoreBaseActionController.startAction(
        name: '_TodoListStoreBase.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TodoListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCurrentTask(Task task) {
    final _$actionInfo = _$_TodoListStoreBaseActionController.startAction(
        name: '_TodoListStoreBase.updateCurrentTask');
    try {
      return super.updateCurrentTask(task);
    } finally {
      _$_TodoListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTask(Task task, dynamic index) {
    final _$actionInfo = _$_TodoListStoreBaseActionController.startAction(
        name: '_TodoListStoreBase.editTask');
    try {
      return super.editTask(task, index);
    } finally {
      _$_TodoListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(Task task) {
    final _$actionInfo = _$_TodoListStoreBaseActionController.startAction(
        name: '_TodoListStoreBase.removeTask');
    try {
      return super.removeTask(task);
    } finally {
      _$_TodoListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList}
    ''';
  }
}
