import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:choose_app/common/rounded_rectangular_simple_text_widget.dart';
import 'package:choose_app/common/time_picker/time_picker.dart';
import 'package:choose_app/utility/date_utility.dart';
import 'package:flutter/material.dart';

class CreateNewToDo extends StatefulWidget {
  @override
  _CreateNewTodoState createState() => _CreateNewTodoState();
}

class _CreateNewTodoState extends State<CreateNewToDo> {
  int selectedStartHour;
  int selectedStartMinute;

  String selectedStartTimeStr = DateUtility().formattedCurrentTimeHHMM();
  String selectedEndTimeStr = '23 : 59';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /// タイトル
          MultiSmallWidgets().titleWidget(
            dataText: 'Title',
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.text,
              maxLength: 50,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),

          /// コンテンツ
          MultiSmallWidgets().titleWidget(
            dataText: 'Content',
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10.0,
            ),
            child: TextField(
              maxLines: 6,
              keyboardType: TextInputType.text,
              maxLength: 250,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),

          /// タイム（HH：MM）
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      var data = await TimePicker.showTimePicker(
                          context: context,
                          selectedHour: (hour) {
                            selectedStartHour = hour;
                          },
                          selectedMinute: (minute) {
                            selectedStartMinute = minute;
                          });

                      setState(() {
                        if (selectedStartTimeStr != data) {
                          selectedStartTimeStr = data;
                          selectedEndTimeStr = '23 : 59';
                        }
                      });
                    },
                    icon: Icon(Icons.calendar_today),
                    label: Text('Start Time')),
                Text(selectedStartTimeStr),
              ],
            ),
          ),

          /// タイム（HH：MM）
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      var data = await TimePicker.showTimePicker(
                          context: context,
                          initHour: selectedStartHour,
                          initMinute: selectedStartMinute,
                          selectedHour: (hour) {},
                          selectedMinute: (minute) {});

                      setState(() {
                        selectedEndTimeStr = data;
                      });
                    },
                    icon: Icon(Icons.calendar_today),
                    label: Text('End Time')),
                Text(selectedEndTimeStr),
              ],
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          /// TODO保存
          Center(
            child: RoundedRectangularSimpleTextWidget(
              title: 'Create',
              buttonPress: () {
                /// Save in Realm
              },
            ),
          ),
        ],
      ),
    );
  }
}
