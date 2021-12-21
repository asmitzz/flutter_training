import 'package:flutter/material.dart';
import 'package:flutter_training/models/todo_model.dart';
import 'package:flutter_training/modules/todos/provider/todos_provider.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool extend = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInCubic,
      padding:const EdgeInsets.symmetric(horizontal: 20.0) ,
      height: extend ? 100.0 : 50.0,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      duration: const Duration(milliseconds: 300),
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.todo.title,
            style: const TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    TodoProvider.of(context)!.removeTodo(widget.todo.id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  )),
              IconButton(
                  onPressed: () {
                    extend = !extend;
                    setState(() {
                      
                    });
                  },
                  icon: Icon(
                    extend ? Icons.close_fullscreen : Icons.fullscreen,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
