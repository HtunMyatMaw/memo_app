import 'package:flutter/material.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class RouteAwareWidget extends StatefulWidget {
  final Widget child;

  const RouteAwareWidget({Key key, this.child}) : super(key: key);

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
    super.didPopNext();
  }
}
