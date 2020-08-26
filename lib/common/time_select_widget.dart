import 'dart:ui';

import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:choose_app/common/time_select_popup.dart';
import 'package:flutter/material.dart';

class TimeSelectWidget extends StatefulWidget {
  final String title;

  const TimeSelectWidget({Key key, this.title = ''}) : super(key: key);

  @override
  _TimeSelectWidgetState createState() => _TimeSelectWidgetState();
}

class _TimeSelectWidgetState extends State<TimeSelectWidget> {
  List<int> startHour = [];
  List<int> startMin = [];
  int selectedStartHour = 0;
  int selectedStartMinute = 0;
  int updatedSelectedStartHour = 0;
  int updatedSelectedStartMinute = 0;

  List<int> endHour = [];
  List<int> endMin = [];
  int selectedEndHour = 0;
  int selectedEndMinute = 0;
  int updatedSelectedEndHour = 0;
  int updatedSelectedEndMinute = 0;

  bool releaseLock = false;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 24; i++) {
      startHour.add(i);
    }

    for (int i = 0; i < 60; i++) {
      startMin.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MultiSmallWidgets().paddingRowWidget(
                    right: 0.0,
                    bottom: 10.0,
                    child: MultiSmallWidgets().titleWidget(
                      fontSize: 14.0,
                      dataText: 'Start Time',
                    )),
                TimeSelectPopUp(
                  startHour: startHour,
                  startMin: startMin,
                  initSelectedHour: selectedStartHour,
                  initSelectedMinute: selectedStartMinute,
                  changedSelectedHour: (changedStartHour) {
                    endHour.clear();
                    releaseLock = false;
                    selectedStartHour = changedStartHour;
                    setState(() {
                      for (int eh = changedStartHour; eh < 24; eh++) {
                        endHour.add(eh);
                      }
                      releaseLock = true;
                    });
                  },
                  changedSelectedMinute: (changedStartMinute) {
                    endMin.clear();
                    releaseLock = false;
                    selectedStartMinute = changedStartMinute;
                    setState(() {
                      for (int em = changedStartMinute; em < 60; em++) {
                        endMin.add(em);
                      }
                      releaseLock = true;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MultiSmallWidgets().paddingRowWidget(
                    right: 0.0,
                    bottom: 10.0,
                    child: MultiSmallWidgets().titleWidget(
                      fontSize: 14.0,
                      dataText: 'End Time',
                    )),
                TimeSelectPopUp(
                  startHour: endHour,
                  startMin: endMin,
                  openLock: releaseLock,
                  changedSelectedHour: (changedStartHour) {
                    print('changedSelectedHour $changedStartHour');
                  },
                  changedSelectedMinute: (changedStartMinute) {
                    print('changedSelectedMinute $changedStartMinute');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
