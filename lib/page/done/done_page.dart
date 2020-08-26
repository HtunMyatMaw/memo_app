import 'package:choose_app/common/app_bar_widget.dart';
import 'package:flutter/material.dart';

class DonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Done',
      ),
      body: Container(
        child: Text('Done'),
      ),
    );
  }
}
