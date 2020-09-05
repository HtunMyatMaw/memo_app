import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/redux/navigation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class RouteAwareWidget extends StatefulWidget {
  final Widget child;
  final Store<AppState> store;

  const RouteAwareWidget({Key key, this.child, this.store}) : super(key: key);

  @override
  _RouteAwareWidgetState createState() => _RouteAwareWidgetState(child: child);
}

class _RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  final Widget child;

  _RouteAwareWidgetState({this.child});

  @override
  Widget build(BuildContext context) => Container(child: child);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    super.didPush();
  }

  @override
  void didPopNext() {
    widget.store.dispatch(NavigatePopAction());
    super.didPopNext();
  }

  @override
  void didPop() {
    super.didPop();
  }
}
