import 'package:choose_app/common/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        child: Text('History'),
      ),
    );
  }
}
