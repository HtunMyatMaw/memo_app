import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/route/route_aware_widget.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class PopUpRoute<T> extends MaterialPageRoute<T> {
  PopUpRoute(Widget widget, Store<AppState> store, {RouteSettings settings})
      : super(
          builder: (_) => RouteAwareWidget(
            child: widget,
            store: store,
          ),
          settings: settings,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
