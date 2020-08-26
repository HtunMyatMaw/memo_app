import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/page/todo/create_new_todo.dart';
import 'package:choose_app/redux/navigation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
//        appBar: AppBar(
//          leading: InkWell(
//              onTap: () {
//                StoreProvider.of<AppState>(context)
//                    .dispatch(NavigatePopAction());
//              },
//              child: Icon(
//                Icons.arrow_back_ios,
//              )),
//          title: Text('ToDo'),
//          bottom: TabBar(tabs: [
//            Tab(
//              child: MultiSmallWidgets().titleWidget(dataText: 'New Todo'),
//            ),
//            Tab(
//              child: MultiSmallWidgets().titleWidget(dataText: 'Todo List'),
//            ),
//          ]),
//        ),
      body: CreateNewToDo(),
    );
  }
}

//import 'package:choose_app/common/multi_small_widgets.dart';
//import 'package:choose_app/config/app_state.dart';
//import 'package:choose_app/page/todo/create_new_todo.dart';
//import 'package:choose_app/redux/navigation_action.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//
//class ToDoPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTabController(
//      length: 2,
//      child: Scaffold(
//        resizeToAvoidBottomPadding: true,
//        resizeToAvoidBottomInset: true,
//        appBar: AppBar(
//          leading: InkWell(
//              onTap: () {
//                StoreProvider.of<AppState>(context)
//                    .dispatch(NavigatePopAction());
//              },
//              child: Icon(
//                Icons.arrow_back_ios,
//              )),
//          title: Text('ToDo'),
//          bottom: TabBar(tabs: [
//            Tab(
//              child: MultiSmallWidgets().titleWidget(dataText: 'New Todo'),
//            ),
//            Tab(
//              child: MultiSmallWidgets().titleWidget(dataText: 'Todo List'),
//            ),
//          ]),
//        ),
//        body: Container(
//          child: TabBarView(children: [
//            /// 新しいメモを作成
//            CreateNewToDo(),
//
//            /// TODO一覧
//            Icon(
//              Icons.history,
//            ),
//          ]),
//        ),
//      ),
//    );
//  }
//}
