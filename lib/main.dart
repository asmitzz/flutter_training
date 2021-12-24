import 'package:flutter/material.dart';
import 'package:flutter_training/modules/todos/models/todo_model.dart';
import 'package:flutter_training/modules/todos/provider/todos_provider.dart';
import 'package:flutter_training/modules/todos/views/display_todos.dart';
import 'package:flutter_training/modules/todos/views/todo_form.dart';
import 'package:flutter_training/modules/todos/views/todos_page.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const TodosPage(),
        "/add": (context) => const TodoForm(),
        "/weather": (context) => const CurrentWeatherPage(),
      },
    );
  }
}
