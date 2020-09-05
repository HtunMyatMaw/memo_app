import 'dart:async';

import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/redux/navigation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

@immutable
class CustomBottomSheet extends StatefulWidget {
  final Color backgroundColor;
  final Widget child;

  CustomBottomSheet({this.child, this.backgroundColor});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();

  static show(
      {@required BuildContext context,
      @required child,
      backgroundColor = const Color(0xb3212121)}) {
    ///
    StoreProvider.of<AppState>(context)
        .dispatch(NavigatePushAction('just_popup'));

    ///
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) {
              return CustomBottomSheet(
                child: child,
                backgroundColor: backgroundColor,
              );
            },
            opaque: false));
  }
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  final GlobalKey _childKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) Navigator.pop(context);
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: onBackPressed,
        child: GestureDetector(
          onVerticalDragUpdate: null,
          onVerticalDragEnd: null,
          child: Scaffold(
            backgroundColor: widget.backgroundColor,
            body: SafeArea(
              child: Column(
                key: _childKey,
                children: <Widget>[
                  Spacer(),
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, _) {
                        return Transform(
                          transform: Matrix4.translationValues(
                              0.0, width * _animation.value, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: Colors.indigo,
                            ),
                            width: width,
                            child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {},
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(
                                        right: 20.0,
                                        bottom: 10,
                                        top: 10,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Material(
                                          color: Colors.indigo,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            splashColor: Colors.white,
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget.child,
                                  ],
                                )),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
          excludeFromSemantics: true,
        ));
  }

  Future<bool> onBackPressed() {
    _animationController..reverse();
    return Future<bool>.value(false);
  }
}
