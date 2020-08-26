import 'package:choose_app/common/app_bar_widget.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DoingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('UUID : ${StoreProvider.of<AppState>(context).state.deviceUUID}');
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Doing',
      ),
      body: Container(
        child: Text('Doing'),
      ),
    );
  }
}
