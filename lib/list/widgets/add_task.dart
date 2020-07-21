import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mobx/list/store/todo_list_store.dart';
import 'package:todo_list_mobx/models/task.dart';
import 'package:todo_list_mobx/shared/colors.dart';
import 'package:todo_list_mobx/todo_list_app.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoListStore>(context);

    TextEditingController _controller = TextEditingController();
    Task currentTask = Task();
    DateTime datetime;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'New task',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'What are you planning?',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 50,
              child: TextField(
                onChanged: (text) {
                  currentTask.name = text;
                  store.updateCurrentTask(currentTask);
                },
                controller: _controller,
              ),
            ),
            Divider(),
            SizedBox(
              height: 50,
              child: InkWell(
                onTap: () async {
                  currentTask.date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040, 1, 20));
                  store.updateCurrentTask(currentTask);
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.notifications_none,
                      color: TodoListColors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Observer(builder: (_) {
                      return Text(
                        store.getCurrentTask.getDateFormatted ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );
                    })
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        'Create',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Task task = Task(
                            name: _controller.text,
                            date: datetime,
                            isFinished: false);
                        store.addTask(task);
                        navigatorKey.currentState.pop();
                      },
                      color: TodoListColors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
