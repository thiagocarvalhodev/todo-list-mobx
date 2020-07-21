import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mobx/list/store/todo_list_store.dart';
import 'package:todo_list_mobx/list/widgets/task_tile.dart';
import 'package:todo_list_mobx/shared/colors.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoListStore>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: store.scaffoldKey,
      floatingActionButton: Observer(builder: (_) {
        return FloatingActionButton(
          autofocus: false,
          child: Observer(builder: (_) {
            return Icon(Icons.add);
          }),
          onPressed: () {
            store.goToAddTask();
          },
        );
      }),
      appBar: AppBar(
        backgroundColor: TodoListColors.blue,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            _backgroud(),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 240,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.filter_frames,
                              size: 28.0,
                              color: TodoListColors.blue,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'All',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                Observer(builder: (_) {
                                  int length = store.taskList.length;
                                  return Text(
                                    '$length ${length > 1 ? 'tasks' : 'task'}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25)),
                        border: Border.all(
                            width: 2,
                            color: Colors.white,
                            style: BorderStyle.solid)),
                    child: Observer(builder: (_) {
                      return ListView.builder(
                          itemCount: store?.taskList?.length ?? 0,
                          itemBuilder: (context, index) {
                            return TaskTile(store.taskList[index], index);
                          });
                    }),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _backgroud() => Container(
        color: TodoListColors.blue,
      );
}
