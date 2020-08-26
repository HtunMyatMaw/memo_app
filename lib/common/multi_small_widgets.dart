import 'package:flutter/material.dart';

class MultiSmallWidgets {
  Widget titleWidget(
      {String dataText,
      Color dataColor = Colors.black,
      double fontSize = 16.0}) {
    return Text(
      dataText,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: dataColor,
      ),
    );
  }

  Widget contentWidget({String dataText, Color dataColor = Colors.grey}) {
    return Text(
      dataText,
      style: TextStyle(
        fontSize: 14.0,
        color: dataColor,
      ),
    );
  }

  Widget paddingRowWidget({
    @required Widget child,
    double left = 0.0,
    double top = 0.0,
    double right = 10.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: child,
      );
}
