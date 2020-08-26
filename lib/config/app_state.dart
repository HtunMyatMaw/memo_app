import 'package:choose_app/config/app_route.dart';

class AppState {
  final String deviceUUID;
  final List<String> routes;

  AppState({this.deviceUUID, this.routes = const [AppRoute.topPage]});

}
