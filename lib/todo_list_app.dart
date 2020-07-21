import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mobx/list/store/todo_list_store.dart';

import 'list/todo_list_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TodoListStore>(
      create: (context) => TodoListStore(),
      dispose: (context, bloc) => bloc.dispose(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        home: TodoListPage(),
      ),
    );
  }
}
