import 'package:choose_app/model/task_data_model.dart';

class GetAllTodoDataAction {
  GetAllTodoDataAction();
}

class LoadAllTodoDataAction {
  LoadAllTodoDataAction();
}

class AddTodoDataAction {
  final TaskDataModel todoItemModel;

  AddTodoDataAction(this.todoItemModel);
}

class RemoveTodoDataAction {
  final String id;

  RemoveTodoDataAction(this.id);
}

class UpdateTodoDataAction {
  final TaskDataModel todoItemModel;

  UpdateTodoDataAction(this.todoItemModel);
}
