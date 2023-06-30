part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class InitialTodoEvent extends TodoEvent {}

class LoadingTodoEvent extends TodoEvent {}

class FetchTaskTodoEvent extends TodoEvent {}

class CompletedTodoEvent extends TodoEvent {
  CompletedTodoEvent({required this.todoModels});
  final List<TodoModel> todoModels;
}

class AddTaskTodoEvent extends TodoEvent {
  AddTaskTodoEvent({required this.todoModel});
  final TodoModel todoModel;
}

class EditTaskTodoEvent extends TodoEvent {
  EditTaskTodoEvent({required this.index, required this.todoModel});
  final int index;
  final TodoModel todoModel;
}

class ChangeOrderTodoEvent extends TodoEvent {
  ChangeOrderTodoEvent({required this.oldIndex, required this.newIndex});
  final int oldIndex;
  final int newIndex;
}

class MakeDoneTodoEvent extends TodoEvent {
  MakeDoneTodoEvent({required this.index});
  final int index;
}
class DeleteTodoEvent extends TodoEvent {
  DeleteTodoEvent({required this.index});
  final int index;
}
