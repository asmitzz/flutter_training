import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/modules/todos/models/todo_model.dart';

class TodosCubit extends Cubit<List<TodoModel>> {
  TodosCubit() : super([]);

  addTodo(TodoModel todo) {
    List<TodoModel> updatedState = [...state];
    updatedState.add(todo);
    emit(updatedState);
  }

  removeTodo(String id) {
    List<TodoModel> updatedState = [...state];
    updatedState.removeWhere((element) => element.id == id);
    emit(updatedState);
  }

  fetchTodos() {
    List<TodoModel> todosData = [
      TodoModel(id: UniqueKey().toString(), title: "Buy apples"),
      TodoModel(id: UniqueKey().toString(), title: "Buy Mango"),
      TodoModel(id: UniqueKey().toString(), title: "Learn flutter"),
      TodoModel(id: UniqueKey().toString(), title: "Learn dart"),
    ];
    Future.delayed(const Duration(seconds: 1), () {
      emit(todosData);
    });
  }
}
