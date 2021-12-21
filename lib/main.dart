import 'package:flutter/material.dart';
import 'package:flutter_training/models/todo_model.dart';
import 'package:flutter_training/modules/todos/provider/todos_provider.dart';
import 'package:flutter_training/modules/todos/views/display_todos.dart';
import 'package:flutter_training/modules/todos/views/todo_form.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TodoModel> todos = [
    TodoModel(id: UniqueKey().toString(), title: "Buy apples"),
    TodoModel(id: UniqueKey().toString(), title: "Buy Mango"),
    TodoModel(id: UniqueKey().toString(), title: "Learn flutter"),
    TodoModel(id: UniqueKey().toString(), title: "Learn dart"),
  ];

  addTodo(TodoModel todo) {
    todos.add(todo);
    setState(() {});
  }

  removeTodo(String id) {
    todos.removeWhere((element) => element.id == id);
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      todos: todos,
      removeTodo: removeTodo,
      addTodo: addTodo,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => const DisplayTodos(),
          "/add": (context) => const TodoForm(),
        },
      ),
    );
  }
}
