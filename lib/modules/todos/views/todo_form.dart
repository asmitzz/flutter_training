import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/modules/todos/cubit/todos_cubit.dart';
import 'package:flutter_training/modules/todos/models/todo_model.dart';

import 'package:flutter_training/modules/todos/provider/todos_provider.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String title = "";

  void initState() {
    super.initState();
    print("Form : initState");
  }

  @override
  void didChangeDependencies() {
    print("Form : dependency changed");
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print("Form : Deactivate widget");
    super.deactivate();
  }

  @override
  void dispose() {
    print("Form : dispose widget");
    super.dispose();
  }

  _onPressed(BuildContext context) {
    final todosProvider = context.read<TodosCubit>();
    TodoModel todo = TodoModel(id: UniqueKey().toString(), title: title);
    if (_formKey.currentState!.validate()) {
      todosProvider.addTodo(todo);
      navigatorKey.currentState!.pop("/");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Form : widget build");
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: const Text("Todo Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Title",
                    hintText: "Enter Title",
                  ),
                  validator: (value) {
                    if (value!.length >= 3) return null;
                    return "Invalid title";
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    title = value;
                    setState(() {});
                  },
                ),
                BlocBuilder<TodosCubit, List<TodoModel>>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () => _onPressed(context),
                      child: const Text("Add"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
