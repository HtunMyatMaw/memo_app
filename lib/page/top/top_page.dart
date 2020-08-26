import 'package:choose_app/common/rounded_rectangular_widget.dart';
import 'package:choose_app/config/app_route.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/redux/navigation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                RoundedRectangularButton(
                  title: 'To Do',
                  content: 'Make your today todo lists.',
                  imageUri: 'todo_icon.png',
                  onPressed: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(NavigatePushAction(AppRoute.todoPage));
                  },
                ),
                RoundedRectangularButton(
                  title: 'Doing',
                  imageUri: 'doing_icon.png',
                  onPressed: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(NavigatePushAction(AppRoute.doingPage));
                  },
                ),
                RoundedRectangularButton(
                  title: 'Done',
                  imageUri: 'done_icon.png',
                  onPressed: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(NavigatePushAction(AppRoute.donePage));
                  },
                ),
                RoundedRectangularButton(
                  title: 'Schedule',
                  icon: Icon(
                    Icons.calendar_today,
                    size: 60,
                  ),
                  onPressed: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(NavigatePushAction(AppRoute.schedulePage));
                  },
                ),
                RoundedRectangularButton(
                  title: 'History',
                  icon: Icon(
                    Icons.history,
                    size: 60,
                  ),
                  onPressed: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(NavigatePushAction(AppRoute.historyPage));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
