import 'package:choose_app/page/doing/doing_page.dart';
import 'package:choose_app/page/done/done_page.dart';
import 'package:choose_app/page/history/history_page.dart';
import 'package:choose_app/page/schedule/schedule_page.dart';
import 'package:choose_app/page/todo/todo_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 2;
  List<Widget> homePagesList = [];

  @override
  void initState() {
    super.initState();
    homePagesList.add(DoingPage());
    homePagesList.add(DonePage());
    homePagesList.add(ToDoPage());
    homePagesList.add(SchedulePage());
    homePagesList.add(HistoryPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: homePagesList[selectedIndex],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _tabImageWidget(
              imageUri: 'doing_icon.png', index: 0, isActive: false),
          _tabImageWidget(
              imageUri: 'done_image.png', index: 1, isActive: false),
          _tabImageWidget(imageUri: 'todo_icon.png', index: 2, isActive: false),
          _tabImageWidget(
              imageUri: 'calender_image.png', index: 3, isActive: false),
          _tabImageWidget(
              imageUri: 'history_image.png', index: 4, isActive: false),
        ],
      ),
    );
  }

//  Widget _tabIconWidget({IconData iconData, int index, bool isActive}) {
//    return Material(
//      child: InkWell(
//        onTap: () {
//          setState(() {
//            selectedIndex = index;
//          });
//        },
//        child: Container(
//          decoration: selectedIndex == index
//              ? BoxDecoration(
//                  border: Border(
//                    bottom: BorderSide(
//                      width: 3,
//                      color: Colors.indigo,
//                    ),
//                  ),
//                  gradient: LinearGradient(
//                    colors: [
//                      Colors.indigo.withOpacity(0.5),
//                      Colors.indigo.withOpacity(0.015),
//                    ],
//                    begin: Alignment.bottomCenter,
//                    end: Alignment.topCenter,
//                  ))
//              : BoxDecoration(),
//          width: MediaQuery.of(context).size.width * 0.2,
//          height: 60,
//          child: Center(
//            child: Icon(
//              iconData,
//              size: 30,
//            ),
//          ),
//        ),
//      ),
//    );
//  }

  Widget _tabImageWidget({String imageUri, int index, bool isActive}) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          decoration: selectedIndex == index
              ? BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.indigo,
                      ),
                      top: BorderSide(
                        color: Colors.grey,
                        width: 0.08,
                      )),
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo.withOpacity(0.3),
                      Colors.indigo.withOpacity(0.015),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ))
              : BoxDecoration(
                  border: Border(
                      top: BorderSide(
                    color: Colors.grey,
                    width: 0.08,
                  )),
                ),
          width: MediaQuery.of(context).size.width * 0.2,
          height: 60,
          child: Center(
            child: Image.asset(
              'images/$imageUri',
              width: 24,
              height: 24,
              color: selectedIndex == index ? Colors.indigo : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
