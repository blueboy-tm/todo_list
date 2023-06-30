import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/todo_feature/constant/show_todo_colors.dart';
import 'package:todo_list/todo_feature/model/todo_model.dart';
import 'package:todo_list/todo_feature/widget/dismissable.dart';
import 'package:todo_list/tools/theme/colors.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({super.key, required this.todoModel, required this.index});
  final TodoModel todoModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TodoDismissable(
      index: index,
      todoModel: todoModel,
      child: ListTile(
        trailing: IconButton(
          onPressed: () => context.goNamed(
            'edit_todo',
            pathParameters: {'index': '$index'},
            extra: todoModel,
          ),
          icon: Icon(Icons.edit, color: primaryColor),
        ),
        leading: ReorderableDragStartListener(
          index: index,
          child: const Icon(Icons.drag_handle),
        ),
        tileColor: todoModel.isDone ? completedTaskColor : taskColor,
        title: Text(todoModel.title),
        subtitle: Text(
          todoModel.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
