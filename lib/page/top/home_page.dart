import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:choose_app/common/rounded_rectangular_widget.dart';
import 'package:choose_app/config/app_route.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/redux/navigation_action.dart';
import 'package:choose_app/utility/date_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _itemsList = _generateHomeItemsList(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        bottom: false,
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: SafeArea(
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _itemsList[index];
                },
                itemCount: _itemsList.length,
                shrinkWrap: false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateHomeItemsList(BuildContext context) {
    List<Widget> _itemsList = [
      MultiSmallWidgets().paddingRowWidget(
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
        top: 10.0,
        child: RichText(
            text: TextSpan(style: TextStyle(color: Colors.indigo), children: [
          TextSpan(
              text: 'Today',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900)),
          TextSpan(text: DateUtility().formatHomePageDate()),
        ])),
      ),
      RoundedRectangularButton(
        title: 'Tasks',
        content: 'Make your today todo lists.',
        imageUri: 'todo_icon.png',
        onPressed: () {
          StoreProvider.of<AppState>(context)
              .dispatch(NavigatePushAction(AppRoute.taskPage));
        },
      ),
      RoundedRectangularButton(
        title: 'Doing Tasks',
        imageUri: 'doing_icon.png',
        onPressed: () {
//          StoreProvider.of<AppState>(context)
//              .dispatch(NavigatePushAction(AppRoute.doingPage));
        },
      ),
      RoundedRectangularButton(
        title: 'Tasks Done',
        imageUri: 'done_icon.png',
        onPressed: () {
//          StoreProvider.of<AppState>(context)
//              .dispatch(NavigatePushAction(AppRoute.donePage));
        },
      ),
      MultiSmallWidgets().paddingRowWidget(
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
        top: 10.0,
        child: RichText(
            text: TextSpan(style: TextStyle(color: Colors.indigo), children: [
          TextSpan(
              text: 'Create Tasks\n',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900)),
          TextSpan(text: '(Tomorrow & Following Days)'),
        ])),
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
    ];

    return _itemsList;
  }
}
