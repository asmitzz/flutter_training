import 'package:flutter/material.dart';
import 'package:flutter_training/modules/todos/models/todo_model.dart';

class TodoProvider extends InheritedWidget {
  final List<TodoModel> todos;
  final Function addTodo;
  final Function removeTodo;
  final Function fetchTodos;

  const TodoProvider({
    Key? key,
    required Widget child,
    required this.fetchTodos,
    required this.todos,
    required this.addTodo,
    required this.removeTodo,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return child != oldWidget.child;
  }

  static TodoProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoProvider>();
  }
}
