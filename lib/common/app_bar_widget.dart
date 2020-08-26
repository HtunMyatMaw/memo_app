import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/redux/navigation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarWidget({Key key, this.title})
      : this.preferredSize = Size.fromHeight(50),
        super(key: key);

  final String title;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: () {
            StoreProvider.of<AppState>(context).dispatch(NavigatePopAction());
          },
          child: Icon(
            Icons.arrow_back_ios,
          )),
    );
  }
}
