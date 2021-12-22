import 'package:flutter/material.dart';
import 'package:flutter_training/modules/todos/models/todo_model.dart';
import 'package:flutter_training/modules/todos/provider/todos_provider.dart';
import 'package:flutter_training/modules/todos/views/display_todos.dart';
import 'package:flutter_training/modules/todos/views/todo_form.dart';
import 'package:flutter_training/modules/weather_app/views/current_weather.dart';

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
  List<TodoModel> todos = [];

  void _fetchTodos() {
    List<TodoModel> todosData = [
      TodoModel(id: UniqueKey().toString(), title: "Buy apples"),
      TodoModel(id: UniqueKey().toString(), title: "Buy Mango"),
      TodoModel(id: UniqueKey().toString(), title: "Learn flutter"),
      TodoModel(id: UniqueKey().toString(), title: "Learn dart"),
    ];
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        todos = todosData;
      });
    });
  }

  addTodo(TodoModel todo) {
    todos.add(todo);
    setState(() {});
  }

  removeTodo(String id) {
    todos.removeWhere((element) => element.id == id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print("Main : initState");

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("Main : todos fetched");
      _fetchTodos();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      todos: todos,
      fetchTodos: _fetchTodos,
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
          "/weather": (context) => const CurrentWeatherPage(),
        },
      ),
    );
  }
}
