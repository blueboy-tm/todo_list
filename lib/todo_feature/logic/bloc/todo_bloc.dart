import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/todo_feature/model/todo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todoEvent: InitialTodoEvent())) {
    on<FetchTaskTodoEvent>(_fetchTask);
    on<AddTaskTodoEvent>(_addTask);
    on<EditTaskTodoEvent>(_editTask);
    on<ChangeOrderTodoEvent>(_changeOrderTask);
    on<MakeDoneTodoEvent>(_makeDone);
    on<DeleteTodoEvent>(_deleteTask);
  }

  FutureOr<void> _fetchTask(
      FetchTaskTodoEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(todoEvent: LoadingTodoEvent()));

    final box = Hive.box<TodoModel>('todoBox');
    emit(
      state.copyWith(
        todoEvent: CompletedTodoEvent(todoModels: box.values.toList()),
      ),
    );
  }

  FutureOr<void> _addTask(
      AddTaskTodoEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(todoEvent: LoadingTodoEvent()));

    final box = Hive.box<TodoModel>('todoBox');
    await box.add(event.todoModel);
    emit(
      state.copyWith(
        todoEvent: CompletedTodoEvent(todoModels: box.values.toList()),
      ),
    );
  }

  FutureOr<void> _editTask(
      EditTaskTodoEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(todoEvent: LoadingTodoEvent()));

    final box = Hive.box<TodoModel>('todoBox');
    await box.putAt(event.index, event.todoModel);
    emit(
      state.copyWith(
        todoEvent: CompletedTodoEvent(todoModels: box.values.toList()),
      ),
    );
  }

  FutureOr<void> _changeOrderTask(
      ChangeOrderTodoEvent event, Emitter<TodoState> emit) async {
    int newIndex = event.newIndex;
    if (event.oldIndex < event.newIndex) {
      newIndex--;
    }

    final box = Hive.box<TodoModel>('todoBox');
    var values = box.values.toList();
    var object = values.removeAt(event.oldIndex);
    values.insert(newIndex, object);
    box.clear().then((value) => box.addAll(values));
    emit(
      state.copyWith(
        todoEvent: CompletedTodoEvent(todoModels: values),
      ),
    );
  }

  FutureOr<void> _makeDone(
      MakeDoneTodoEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(todoEvent: LoadingTodoEvent()));

    final box = Hive.box<TodoModel>('todoBox');
    var obj = box.getAt(event.index);
    await box.putAt(event.index, obj!.copyWith(isDone: !obj.isDone));
    emit(
      state.copyWith(
        todoEvent: CompletedTodoEvent(todoModels: box.values.toList()),
      ),
    );
  }

  FutureOr<void> _deleteTask(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(todoEvent: LoadingTodoEvent()));

    final box = Hive.box<TodoModel>('todoBox');
    await box.deleteAt(event.index);
    emit(
      state.copyWith(
        todoEvent: CompletedTodoEvent(todoModels: box.values.toList()),
      ),
    );
  }
}
