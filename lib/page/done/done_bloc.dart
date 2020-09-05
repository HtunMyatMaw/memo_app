import 'dart:async';

import 'package:choose_app/bloc/bloc.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/redux/todo_action.dart';
import 'package:redux/redux.dart';

class DoneBloc implements Bloc {
  Store<AppState> _store;

  final _doneListStreamController =
  StreamController<List<TaskDataModel>>.broadcast();

  final _taskProgressChangeStreamController = StreamController<int>.broadcast();

  /// 初期化
  DoneBloc(Store<AppState> store) {
    _store = store;
    _doneListStreamController.sink.add(_store.state.todoDataList);
  }

  Stream<List<TaskDataModel>> get todoListStream =>
      _doneListStreamController.stream;

  Stream<int> get taskProgressChangeStream =>
      _taskProgressChangeStreamController.stream;

  /// doingリスト取得
  Future<void> getDoneTaskList() async {
    /// Store→Service系でデータをもらう
    _store.dispatch(GetAllTodoDataAction());
    _doneListStreamController.sink.add(await Future.value(_store
        .state.todoDataList
        .where((element) => element.taskProgress == 3)
        .toList()));
  }

  @override
  void dispose() {
    _doneListStreamController.close();
    _taskProgressChangeStreamController.close();
  }

  void notifyList(int taskProgress) {
    _taskProgressChangeStreamController.sink.add(taskProgress);
  }
}
