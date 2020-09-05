import 'package:choose_app/config/app_route.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/page/doing/doing_page.dart';
import 'package:choose_app/page/done/done_page.dart';
import 'package:choose_app/page/todo/all/todo_list_all_bloc.dart';
import 'package:choose_app/page/todo/all/todo_list_all_page.dart';
import 'package:choose_app/page/todo/todo_list_page.dart';
import 'package:choose_app/redux/navigation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  PageController pageController;
  List<String> _todoStatusList = [
    'All',
    'No Progress',
    'In Progress',
    'Finish',
  ];
  int maxTabLength = 4;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext mContext) {
    TodoListAllBloc todoListAllBloc =
        TodoListAllBloc(StoreProvider.of<AppState>(mContext));
    todoListAllBloc.getAllTodoList();

    List<Widget> pageViewList = _pageViewList(todoListAllBloc);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
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
              child: Stack(
                children: <Widget>[
                  ///
                  Container(
                    child: Column(
                      children: <Widget>[
                        _appBarWidget(mContext),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          height: 35,
                          child: StreamBuilder(
                            stream: todoListAllBloc.tabIndexStream,
                            initialData: 0,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                    onTap: () async {
                                      todoListAllBloc.updateTabIndex(index);
                                      todoListAllBloc
                                          .updateTabViewMoveStatus(true);
                                      await pageController.animateToPage(index,
                                          duration: Duration(
                                            milliseconds: 500,
                                          ),
                                          curve: Curves.easeInOutQuart);
                                      todoListAllBloc
                                          .updateTabViewMoveStatus(false);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                      ),
                                      decoration: snapshot.data == index
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors.indigoAccent,
                                            )
                                          : BoxDecoration(),
                                      child: Center(
                                          child: Text(
                                        '${_todoStatusList[index]}',
                                        style: TextStyle(
                                          color: snapshot.data == index
                                              ? Colors.white
                                              : Colors.indigo,
                                          fontSize: 15.0,
                                        ),
                                      )),
                                    ),
                                  );
                                },
                                itemCount: maxTabLength,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: StreamBuilder<bool>(
                            initialData: false,
                            stream: todoListAllBloc.tabViewMoveStream,
                            builder: (context, snapshot) {
                              return PageView.builder(
                                  itemCount: maxTabLength,
                                  controller: pageController,
                                  onPageChanged: (movePageIndex) {
                                    if (!snapshot.data) {
                                      todoListAllBloc
                                          .updateTabIndex(movePageIndex);
                                      pageViewList =
                                          _pageViewList(todoListAllBloc);
                                    }
                                  },
                                  itemBuilder: (context, index) {
                                    return pageViewList[index];
                                  });
                            },
                          ),
                        )
                      ],
                    ),
                  ),

                  ///
                  Container(
                    child: Column(
                      verticalDirection: VerticalDirection.up,
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: StreamBuilder<int>(
                              initialData: 0,
                              stream: todoListAllBloc.tabIndexStream,
                              builder: (context, snapshot) {
                                if (snapshot.data > 0) {
                                  return Container();
                                }

                                return Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Colors.indigoAccent.withOpacity(0.5),
                                    ),
                                    child: IconButton(
                                        splashColor: Colors.indigo,
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          StoreProvider.of<AppState>(context)
                                              .dispatch(NavigatePushAction(
                                                  AppRoute.createTaskPage,
                                                  argument: todoListAllBloc));
                                        }));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _pageViewList(TodoListAllBloc bloc) {
    List<Widget> _list = [];
    _list.add(TodoListAllPage(
      bloc: bloc,
    ));
    _list.add(TodoListPage());
    _list.add(DoingPage());
    _list.add(DonePage());
    return _list;
  }

  /// Custom Style Appbar
  Widget _appBarWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Row(
        children: <Widget>[
          /// Back Arrow Widget
          InkWell(
            borderRadius: BorderRadius.circular(15),
            splashColor: Colors.black12,
            onTap: () {
//              StoreProvider.of<AppState>(context).dispatch(NavigatePopAction());
              Navigator.of(context).pop();
            },
            child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.indigo,
                )),
          ),

          /// Title Widget
          Expanded(
            child: Center(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.indigo),
                      children: [
                    TextSpan(
                        text: 'Task',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w900)),
                  ])),
            ),
          ),

          /// Hidden Widget
          Opacity(opacity: 0, child: Icon(Icons.arrow_back_ios)),
        ],
      ),
    );
  }
}
