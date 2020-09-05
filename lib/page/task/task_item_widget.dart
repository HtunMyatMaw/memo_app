import 'package:flutter/material.dart';

class TaskItemWidget extends StatefulWidget {
  @override
  _TaskItemWidgetState createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
//          Container(
//            height: 30,
//            width: 30,
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color: Colors.black12,
//            ),
//            child: Center(
//              child: Icon(
//                Icons.view_list,
//                size: 30,
//              ),
//            ),
//          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'This is title',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'This is content.. This is content.. This is content.. This is content..',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
