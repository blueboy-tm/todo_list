part of 'todo_bloc.dart';

class TodoState {
  TodoState({required this.todoEvent});

  final TodoEvent todoEvent;

  TodoState copyWith({TodoEvent? todoEvent}) {
    return TodoState(todoEvent: todoEvent ?? this.todoEvent);
  }
  
}
