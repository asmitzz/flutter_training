import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/modules/todos/provider/todos_provider.dart';
import 'package:flutter_training/modules/todos/widgets/todo_card.dart';

class DisplayTodos extends StatefulWidget {
  const DisplayTodos({Key? key}) : super(key: key);

  @override
  _DisplayTodosState createState() => _DisplayTodosState();
}

class _DisplayTodosState extends State<DisplayTodos> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    final todos = TodoProvider.of(context)!.todos;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todos"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    show = !show;
                    setState(() {});
                  },
                  child: Text(show ? "Show todos" : "Hide todos")),
                  
              AnimatedOpacity(
                opacity: show ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: 500.0,
                  child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) => TodoCard(
                            key: UniqueKey(),
                            todo: todos[index],
                          )),
                ),
              ),
            ],
          ),
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
