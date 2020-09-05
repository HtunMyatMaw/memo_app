import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/redux/device_uuid_reducer.dart';
import 'package:choose_app/redux/navigation_reducer.dart';
import 'package:choose_app/redux/todo_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    routes: navigationReducer(state.routes, action),
    deviceUUID: deviceUUIDReducer(state.deviceUUID, action),
    todoDataList: todoDataListReducer(state.todoDataList, action),
  );
}
