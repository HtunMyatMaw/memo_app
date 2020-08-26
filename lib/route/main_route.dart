import 'package:choose_app/route/route_aware_widget.dart';
import 'package:flutter/material.dart';

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
          builder: (_) => RouteAwareWidget(
            child: widget,
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
