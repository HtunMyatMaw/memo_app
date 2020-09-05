import 'package:choose_app/config/app_route.dart';
import 'package:choose_app/model/task_data_model.dart';

class AppState {
  final String deviceUUID;
  final List<String> routes;
  final List<TaskDataModel> todoDataList;

  AppState({
    this.deviceUUID,
    this.routes = const [AppRoute.homePage],
    this.todoDataList = const [],
  });
}
