import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/modules/todos/cubit/todos_cubit.dart';
import 'package:flutter_training/modules/todos/views/display_todos.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit()..fetchTodos(),
      child: const DisplayTodos(),
    );
  }
}
