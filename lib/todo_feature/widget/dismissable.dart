import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/todo_feature/constant/dismissable_colors.dart';
import 'package:todo_list/todo_feature/logic/bloc/todo_bloc.dart';
import 'package:todo_list/todo_feature/model/todo_model.dart';

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({
    super.key,
    this.icon,
    this.color,
    this.alignment,
  });
  final Widget? icon;
  final Color? color;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.all(20),
      color: color,
      child: icon,
    );
  }
}

class TodoDismissable extends StatelessWidget {
  const TodoDismissable({
    super.key,
    required this.todoModel,
    required this.child,
    required this.index,
  });
  final TodoModel todoModel;
  final Widget child;
  final int index;

  Future<bool?> confirmDismiss(
      BuildContext context, DismissDirection direction) async {
    switch (direction) {
      case DismissDirection.endToStart:
        {
          context.read<TodoBloc>().add(MakeDoneTodoEvent(index: index));
          return false;
        }
      default:
        {
          context.read<TodoBloc>().add(DeleteTodoEvent(index: index));
          return true;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Dismissible(
      key: ValueKey(todoModel.id),
      confirmDismiss: (direction) => confirmDismiss(context, direction),
      background: DismissibleBackground(
        icon: Icon(
          Icons.delete,
          color: theme.scaffoldBackgroundColor,
        ),
        color: dismissableDeleteColor,
        alignment: Alignment.centerRight,
      ),
      secondaryBackground: todoModel.isDone
          ? DismissibleBackground(
              icon: Icon(
                Icons.refresh,
                color: theme.scaffoldBackgroundColor,
              ),
              color: dismissableRestoreColor,
              alignment: Alignment.centerLeft,
            )
          : DismissibleBackground(
              icon: Icon(
                Icons.done,
                color: theme.scaffoldBackgroundColor,
              ),
              color: dismissableDoneColor,
              alignment: Alignment.centerLeft,
            ),
      child: child,
    );
  }
}
