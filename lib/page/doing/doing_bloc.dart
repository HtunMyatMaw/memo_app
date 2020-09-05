import 'dart:async';

import 'package:choose_app/bloc/bloc.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/redux/todo_action.dart';
import 'package:redux/redux.dart';

class DoingBloc implements Bloc {
  Store<AppState> _store;

  final _doingListStreamController =
      StreamController<List<TaskDataModel>>.broadcast();

  final _taskProgressChangeStreamController = StreamController<int>.broadcast();

  /// 初期化
  DoingBloc(Store<AppState> store) {
    _store = store;
    _doingListStreamController.sink.add(_store.state.todoDataList);
  }

  Stream<List<TaskDataModel>> get doingListStream =>
      _doingListStreamController.stream;

  Stream<int> get taskProgressChangeStream =>
      _taskProgressChangeStreamController.stream;

  /// doingリスト取得
  Future<void> getDoingTaskList() async {
    /// Store→Service系でデータをもらう
    _store.dispatch(GetAllTodoDataAction());
    _doingListStreamController.sink.add(await Future.value(_store
        .state.todoDataList
        .where((element) => element.taskProgress == 2)
        .toList()));
  }

  @override
  void dispose() {
    _doingListStreamController.close();
    _taskProgressChangeStreamController.close();
  }

  void notifyList(int taskProgress) {
    _taskProgressChangeStreamController.sink.add(taskProgress);
  }
}
