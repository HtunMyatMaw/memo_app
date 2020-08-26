import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TimeSelectPopUp extends StatefulWidget {
  final List<int> startHour;
  final List<int> startMin;
  final int initSelectedHour;
  final int initSelectedMinute;
  final ValueChanged<int> changedSelectedHour;
  final ValueChanged<int> changedSelectedMinute;
  final bool openLock;

  TimeSelectPopUp(
      {Key key,
      this.startHour = const [],
      this.startMin = const [],
      this.initSelectedHour = 0,
      this.initSelectedMinute = 0,
      this.changedSelectedHour,
      this.changedSelectedMinute,
      this.openLock = true})
      : super(key: key);

  @override
  _TimeSelectPopUpState createState() => _TimeSelectPopUpState();
}

class _TimeSelectPopUpState extends State<TimeSelectPopUp> {
  List<int> hourList = [];
  List<int> minuteList = [];
  int selectedHour = 0;
  int selectedMinute = 0;

  String initTime = 'Not Set';
  FixedExtentScrollController _hourScrollController;
  FixedExtentScrollController _minuteScrollController;

  @override
  void initState() {
    super.initState();

    hourList = widget.startHour;
    minuteList = widget.startMin;
    selectedHour = widget.initSelectedHour;
    selectedMinute = widget.initSelectedMinute;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: widget.openLock
          ? () async {
              await showTimePopUp(hourList, minuteList);
              setState(() {
                widget.changedSelectedHour(selectedHour);
                widget.changedSelectedMinute(selectedMinute);

                String hour = selectedHour < 10 ? '0$selectedHour' : '$selectedHour';
                String minute = selectedMinute < 10 ? '0$selectedMinute' : '$selectedMinute';

                initTime = '$hour : $minute';
              });
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.lime,
          ),
          color: widget.openLock ? Colors.white : Colors.grey,
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            MultiSmallWidgets().paddingRowWidget(
              child: Icon(
                Icons.access_time,
                size: 25,
              ),
            ),
            Expanded(
              child: MultiSmallWidgets().contentWidget(
                dataText: initTime,
              ),
            ),
          ],
        ),
      ),
    );

    DatePicker.showTimePicker(context);

  }

  Future<void> showTimePopUp(List<int> hourList, List<int> minuteList) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          _hourScrollController =
              FixedExtentScrollController(initialItem: selectedHour);

          _minuteScrollController =
              FixedExtentScrollController(initialItem: selectedMinute);
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: <Widget>[
                MultiSmallWidgets().paddingRowWidget(
                  right: 0,
                  left: 0,
                  top: 10.0,
                  bottom: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'HH',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Expanded(
                        child: Text(
                          'MM',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 50,
                        child: ListWheelScrollView(
                            controller: _hourScrollController,
                            overAndUnderCenterOpacity: 0.3,
                            onSelectedItemChanged: (value) {
                              print('MM $value');
                              print('MM ${hourList[value]}');
                              selectedHour = hourList[value];
                            },
                            itemExtent: 40,
                            magnification: 1.3,
                            useMagnifier: true,
                            physics: FixedExtentScrollPhysics(),
                            diameterRatio: 1.5,
                            offAxisFraction: -0.5,
                            squeeze: 0.8,
                            children: hourList.map((hour) {
                              return Container(
                                  color: Colors.lime,
                                  height: 30,
                                  padding: EdgeInsets.only(right: 7.5),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      hour < 10 ? '0$hour' : '$hour',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.indigo),
                                    ),
                                  ));
                            }).toList()),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Container(
                        width: 50,
                        child: ListWheelScrollView(
                            key: UniqueKey(),
                            controller: _minuteScrollController,
                            overAndUnderCenterOpacity: 0.3,
                            onSelectedItemChanged: (value) {
                              print('MM $value');
                              print('MM ${minuteList[value]}');
                              selectedMinute = minuteList[value];
                            },
                            itemExtent: 40,
                            magnification: 1.3,
                            useMagnifier: true,
                            physics: FixedExtentScrollPhysics(),
                            diameterRatio: 1.5,
                            offAxisFraction: 0.5,
                            squeeze: 0.8,
                            children: minuteList.map((minute) {
                              return Container(
                                  color: Colors.lime,
                                  height: 30,
                                  key: UniqueKey(),
                                  padding: EdgeInsets.only(left: 7.5),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      minute < 10 ? '0$minute' : '$minute',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo),
                                    ),
                                  ));
                            }).toList()),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
