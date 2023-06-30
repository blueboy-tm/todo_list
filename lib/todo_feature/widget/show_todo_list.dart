import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/todo_feature/logic/bloc/todo_bloc.dart';
import 'package:todo_list/todo_feature/model/todo_model.dart';
import 'package:todo_list/todo_feature/widget/show_todo.dart';

class ShowTodoList extends StatelessWidget {
  const ShowTodoList({super.key, required this.todoModels});
  final List<TodoModel> todoModels;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      onReorder: (oldIndex, newIndex) {
        context
            .read<TodoBloc>()
            .add(ChangeOrderTodoEvent(oldIndex: oldIndex, newIndex: newIndex));
      },
      itemCount: todoModels.length,
      itemBuilder: (context, index) => ShowTodo(
        key: ValueKey(todoModels[index].id),
        todoModel: todoModels[index],
        index: index,
      ),
    );
  }
}
