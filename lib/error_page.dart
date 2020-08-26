import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.black,
      child: Center(
        child: Icon(
          Icons.warning,
          color: Colors.red,
          size: 60.0,
        ),
      ),
    ));
  }
}
