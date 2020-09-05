import 'dart:async';

import 'package:choose_app/bloc/bloc.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/redux/todo_action.dart';
import 'package:redux/redux.dart';

class TodoListBloc implements Bloc {
  Store<AppState> _store;

  final _todoListStreamController =
      StreamController<List<TaskDataModel>>.broadcast();

  final _taskProgressChangeStreamController = StreamController<int>.broadcast();

  /// 初期化
  TodoListBloc(Store<AppState> store) {
    _store = store;
    _todoListStreamController.sink.add(_store.state.todoDataList);
  }

  Stream<List<TaskDataModel>> get todoListStream =>
      _todoListStreamController.stream;

  Stream<int> get taskProgressChangeStream =>
      _taskProgressChangeStreamController.stream;

  /// todoリスト取得
  Future<void> getTodoTaskList() async {
    /// Store→Service系でデータをもらう
    _store.dispatch(GetAllTodoDataAction());
    _todoListStreamController.sink.add(await Future.value(_store
        .state.todoDataList
        .where((element) => element.taskProgress == 1)
        .toList()));
  }

  void notifyList(int taskProgress) {
    _taskProgressChangeStreamController.sink.add(taskProgress);
  }

  @override
  void dispose() {
    _todoListStreamController.close();
    _taskProgressChangeStreamController.close();
  }
}
