import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/todo_feature/model/todo_model.dart';
import 'package:todo_list/todo_feature/screen/add_todo_screen.dart';
import 'package:todo_list/todo_feature/screen/edit_todo_screen.dart';
import 'package:todo_list/todo_feature/screen/show_todo_screen.dart';

// Config App routes
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ShowTodoScreen();
      },
    ),
    GoRoute(
      path: '/add_todo',
      name: 'add_todo',
      builder: (context, state) {
        return const AddTodoScreen();
      },
    ),
    GoRoute(
      path: '/edit_todo/:index',
      name: 'edit_todo',
      builder: (context, state) {
        return EditTodoScreen(
          index: int.parse(state.pathParameters['index'] ?? '0'),
          todoModel: state.extra as TodoModel,
        );
      },
    )
  ],
);
