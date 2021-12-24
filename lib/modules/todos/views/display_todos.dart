import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/modules/todos/cubit/todos_cubit.dart';
import 'package:flutter_training/modules/todos/models/todo_model.dart';
import 'package:flutter_training/modules/todos/provider/todos_provider.dart';
import 'package:flutter_training/modules/todos/widgets/screen_title.dart';
import 'package:flutter_training/modules/todos/widgets/todo_card.dart';

class DisplayTodos extends StatefulWidget {
  const DisplayTodos({Key? key}) : super(key: key);

  @override
  _DisplayTodosState createState() => _DisplayTodosState();
}

class _DisplayTodosState extends State<DisplayTodos> {
  @override
  void initState() {
    super.initState();
    print("Display Todos : initState");
  }

  @override
  void didChangeDependencies() {
    print("Display Todos : dependency changed");
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print("Display Todos : Deactivate widget");
    super.deactivate();
  }

  @override
  void dispose() {
    print("Display Todos : dispose widget");
    super.dispose();
  }

  bool show = true;
  @override
  Widget build(BuildContext context) {
    print("Display Todos : Widget build");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const ScreenTitle(text: "TODOS"),
          centerTitle: false,
        ),
        body: BlocBuilder<TodosCubit, List<TodoModel>>(
          builder: (context, todos) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        show = !show;
                        setState(() {});
                      },
                      child: Text(show ? "Hide todos" : "Show todos")),
                  ElevatedButton(
                      onPressed: () {
                        navigatorKey.currentState!
                            .pushReplacementNamed("/weather");
                      },
                      child: const Text("Go to weather app")),
                  todos.isNotEmpty
                      ? AnimatedOpacity(
                          opacity: show ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: SizedBox(
                              height: 500.0,
                              child: ListView.builder(
                                  itemCount: todos.length,
                                  itemBuilder: (context, index) => TodoCard(
                                        key: ValueKey(todos[index].id),
                                        todo: todos[index],
                                      ))),
                        )
                      : const SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: CircularProgressIndicator(
                            color: Colors.blueAccent,
                            strokeWidth: 1.5,
                          ),
                        ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            navigatorKey.currentState!.pushNamed("/add");
          },
        ),
      ),
    );
  }
}
