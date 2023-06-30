import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/todo_feature/logic/bloc/todo_bloc.dart';
import 'package:todo_list/todo_feature/widget/empty_list_view.dart';
import 'package:todo_list/todo_feature/widget/show_todo_list.dart';
import 'package:todo_list/tools/loading_widget.dart';

class ShowTodoScreen extends StatelessWidget {
  const ShowTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    context.read<TodoBloc>().add(FetchTaskTodoEvent());

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoEvent is LoadingTodoEvent) {
            return const LoadingWidget();
          }
          if (state.todoEvent is CompletedTodoEvent) {
            final CompletedTodoEvent event =
                state.todoEvent as CompletedTodoEvent;

            return event.todoModels.isEmpty
                ? const EmptyListView()
                : ShowTodoList(todoModels: event.todoModels);
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed('add_todo'),
        child: Icon(Icons.add, color: theme.scaffoldBackgroundColor),
      ),
    );
  }
}
