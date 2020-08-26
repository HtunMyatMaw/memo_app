import 'dart:async';

import 'package:choose_app/config/app_route.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/error_page.dart';
import 'package:choose_app/page/home.dart';
import 'package:choose_app/page/doing/doing_page.dart';
import 'package:choose_app/page/done/done_page.dart';
import 'package:choose_app/page/history/history_page.dart';
import 'package:choose_app/page/schedule/schedule_page.dart';
import 'package:choose_app/page/todo/todo_page.dart';
import 'package:choose_app/page/top/top_page.dart';
import 'package:choose_app/redux/app_reducer.dart';
import 'package:choose_app/redux/device_uuid_action.dart';
import 'package:choose_app/redux/middleware.dart';
import 'package:choose_app/route/fab_route.dart';
import 'package:choose_app/route/main_route.dart';
import 'package:choose_app/route/route_aware_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: createAllMiddleware(),
  );

  runZonedGuarded(
      () => runApp(ChooseApp(
            store: store,
          )),
      (e, s) {});
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class ChooseApp extends StatelessWidget {
  final Store<AppState> store;

  const ChooseApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    store.dispatch(DeviceUUIDAction());
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChooseApp',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _getRoute,
        navigatorKey: navigatorKey,
        navigatorObservers: [routeObserver],
      ),
    );
  }

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.homePage:
        return MainRoute(HomePage(), settings: settings);
      case AppRoute.topPage:
        return MainRoute(TopPage(), settings: settings);
      case AppRoute.todoPage:
        return FabRoute(ToDoPage(), settings: settings);
      case AppRoute.doingPage:
        return FabRoute(DoingPage(), settings: settings);
      case AppRoute.donePage:
        return FabRoute(DonePage(), settings: settings);
      case AppRoute.schedulePage:
        return FabRoute(SchedulePage(), settings: settings);
      case AppRoute.historyPage:
        return FabRoute(HistoryPage(), settings: settings);
      default:
        return MainRoute(ErrorPage(), settings: settings);
    }
  }
}
