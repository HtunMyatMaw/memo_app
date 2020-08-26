import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/main.dart';
import 'package:choose_app/redux/device_uuid_action.dart';
import 'package:choose_app/redux/navigation_action.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAllMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigatePush),
    TypedMiddleware<AppState, NavigatePopAction>(_navigatePop),
    TypedMiddleware<AppState, DeviceUUIDAction>(_getUUID),
  ];
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).routeName;
  if (store.state.routes.last != routeName) {
    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  next(action);
}

_navigatePush(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).routeName;

  print('${store.state.routes}');

  if (store.state.routes.last != routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }
  next(action);
}

_navigatePop(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pop();
  next(action);
}

_getUUID(Store<AppState> store, action, NextDispatcher next) async {
  next(action);
  String uuid = await FlutterUdid.udid;
  store.dispatch(SetDeviceUUIDAction(uuid));
}
