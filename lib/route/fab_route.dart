import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/route/route_aware_widget.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class FabRoute<T> extends MaterialPageRoute<T> {
  FabRoute(Widget widget, Store<AppState> store, {RouteSettings settings})
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
    return super
        .buildTransitions(context, animation, secondaryAnimation, child);
  }
}
