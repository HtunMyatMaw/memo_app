import 'dart:async';

import 'package:choose_app/bloc/bloc.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/redux/todo_action.dart';
import 'package:redux/redux.dart';

class TodoListAllBloc implements Bloc {
  Store<AppState> _store;

  final _todoListStreamController =
      StreamController<List<TaskDataModel>>.broadcast();

  final _tabIndexStreamController = StreamController<int>.broadcast();

  final _tabViewMoveStreamController = StreamController<bool>.broadcast();

  final _newTaskCreatedResponseStreamController =
      StreamController<int>.broadcast();

  /// 初期化
  TodoListAllBloc(Store<AppState> store) {
    _store = store;
    _todoListStreamController.sink.add(_store.state.todoDataList);
  }

  Stream<List<TaskDataModel>> get todoListStream =>
      _todoListStreamController.stream;

  Stream<int> get tabIndexStream => _tabIndexStreamController.stream;

  Stream<bool> get tabViewMoveStream => _tabViewMoveStreamController.stream;

  Stream<int> get newTaskCreatedResponseStream =>
      _newTaskCreatedResponseStreamController.stream;

  /// todoリスト取得
  Future<void> getAllTodoList() async {
    /// Store→Service系でデータをもらう
    _store.dispatch(GetAllTodoDataAction());
    _todoListStreamController.sink
        .add(await Future.value(_store.state.todoDataList));
  }

  /// todoリスト取得
  Future<void> getTodoTaskList() async {
    /// Store→Service系でデータをもらう
    _store.dispatch(GetAllTodoDataAction());
    _todoListStreamController.sink.add(await Future.value(_store
        .state.todoDataList
        .where((element) => element.taskProgress == 1)
        .toList()));
  }

  /// todoリスト取得
  Future<void> getDoingTaskList() async {
    /// Store→Service系でデータをもらう
    _store.dispatch(GetAllTodoDataAction());
    _todoListStreamController.sink.add(await Future.value(_store
        .state.todoDataList
        .where((element) => element.taskProgress == 2)
        .toList()));
  }

  /// todoリスト取得
  Future<void> getDoneTaskList() async {
    /// Store→Service系でデータをもらう
    _store.dispatch(GetAllTodoDataAction());
    _todoListStreamController.sink.add(await Future.value(_store
        .state.todoDataList
        .where((element) => element.taskProgress == 3)
        .toList()));
  }

  void updateTabIndex(int index) {
    _tabIndexStreamController.sink.add(index);
  }

  void updateTabViewMoveStatus(bool data) {
    _tabViewMoveStreamController.sink.add(data);
  }

  void taskCreatedResponse(int timeInMilli) {
    _newTaskCreatedResponseStreamController.sink.add(timeInMilli);
  }

  @override
  void dispose() {
    _todoListStreamController.close();
    _tabIndexStreamController.close();
    _tabViewMoveStreamController.close();
    _newTaskCreatedResponseStreamController.close();
  }
}
