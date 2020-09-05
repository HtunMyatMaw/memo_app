import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/redux/todo_action.dart';

List<TaskDataModel> todoDataListReducer(List<TaskDataModel> previous, action) {
  if (action is AddTodoDataAction) {
    return _addTodoData(previous, action);
  } else if (action is RemoveTodoDataAction) {
    return _removeTodoData(previous, action);
  } else if (action is UpdateTodoDataAction) {
    return _updateTodoData(previous, action);
  } else if (action is LoadAllTodoDataAction) {
    return _loadAllTodoData(previous, action);
  }
  return previous;
}

List<TaskDataModel> _loadAllTodoData(
    List<TaskDataModel> previous, LoadAllTodoDataAction action) {
  if (previous.isEmpty) {
    /// 初回起動にRealmからもらう想定
    return previous;
  } else {
    return previous;
  }
}

List<TaskDataModel> _addTodoData(
    List<TaskDataModel> previous, AddTodoDataAction action) {
  return List.from(previous)..add(action.todoItemModel);
}

List<TaskDataModel> _removeTodoData(
    List<TaskDataModel> previous, RemoveTodoDataAction action) {
  return List<TaskDataModel>.from(previous)
    ..removeWhere((old) => old.id == action.id);
}

List<TaskDataModel> _updateTodoData(
    List<TaskDataModel> previous, UpdateTodoDataAction action) {
  return previous
      .map((old) =>
          old.id == action.todoItemModel.id ? action.todoItemModel : old)
      .toList();
}
