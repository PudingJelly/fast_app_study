import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/bloc/todo_event.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoBlocState> {
  TodoBloc() : super(const TodoBlocState(BlocStatus.initial, <Todo>[])) {
    on<TodoAddEvent>(_addTodo);
    on<TodoStatusUpdateEvent>(_changeTodoStatus);
    on<TodoContentUpdateEvent>(_editTodo);
    on<TodoRemovedEvent>(_removeTodo);
  }

  void _addTodo(TodoAddEvent event, Emitter<TodoBlocState> emit) async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      final copiedOldTodoList = List.of(state.todoList);
      copiedOldTodoList.add(
        Todo(
          id: DateTime.now().millisecondsSinceEpoch,
          title: result.text,
          dueDate: result.dateTime,
          createdTime: DateTime.now(),
          status: TodoStatus.incomplete,
        ),
      );
      emit(state.copyWith(
        todoList: copiedOldTodoList,
      ));
    }
  }

  void _changeTodoStatus(
      TodoStatusUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final copiedOldTodoList = List.of(state.todoList);
    final todo = event.statusUpdateTodo;
    final todoIndex =
        copiedOldTodoList.indexWhere((element) => element.id == todo.id);
    TodoStatus status = todo.status;
    switch (todo.status) {
      case TodoStatus.incomplete:
        status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog("처음 상태로 변경 하시겠어요?").show();
        result?.runIfSuccess((data) {
          status = TodoStatus.incomplete;
        });
    }
    copiedOldTodoList[todoIndex] = todo.copyWith(status: status);
    emitNewList(copiedOldTodoList, emit);
  }

  void _editTodo(
      TodoContentUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final todo = event.contentUpdateTodo;
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      final oldCopiedList = List<Todo>.from(state.todoList);
      oldCopiedList[oldCopiedList.indexOf(todo)] = todo.copyWith(
        title: result.text,
        dueDate: result.dateTime,
        modifyTime: DateTime.now(),
      );
      emitNewList(oldCopiedList, emit);
    }
  }

  void _removeTodo(TodoRemovedEvent event, Emitter<TodoBlocState> emit) async {
    final copiedOldTodoList = List.of(state.todoList);
    final todo = event.removedTodo;
    copiedOldTodoList.removeWhere((element) => element.id == todo.id);
    emitNewList(copiedOldTodoList, emit);
  }

  void emitNewList(List<Todo> copiedOldTodoList, Emitter<TodoBlocState> emit) =>
      emit(state.copyWith(todoList: copiedOldTodoList));
}
