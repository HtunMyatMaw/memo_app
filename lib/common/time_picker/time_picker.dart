import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:flutter/material.dart';

int callBackSelectedHour;
int callBackSelectedMinute;

class TimePicker {
  static Future<String> showTimePicker({
    @required BuildContext context,
    int initHour,
    int initMinute,
    ValueChanged<int> selectedHour,
    ValueChanged<int> selectedMinute,
  }) async {
    var date = DateTime.now();

    await Navigator.push(
        context,
        _TimePickerRoute(
            widget: _PickerWidget(
          initHour: initHour ?? date.hour,
          initMinute: initMinute ?? date.minute,
          selectedHour: selectedHour,
          selectedMinute: selectedMinute,
        )));

    return Future.value('$callBackSelectedHour : $callBackSelectedMinute');
  }
}

class _PickerWidget extends StatefulWidget {
  final int initHour;
  final int initMinute;
  final ValueChanged<int> selectedHour;
  final ValueChanged<int> selectedMinute;

  const _PickerWidget(
      {Key key,
      this.initHour,
      this.initMinute,
      this.selectedHour,
      this.selectedMinute})
      : super(key: key);

  @override
  __PickerWidgetState createState() => __PickerWidgetState();
}

class __PickerWidgetState extends State<_PickerWidget> {
  FixedExtentScrollController _hourScrollController;
  FixedExtentScrollController _minuteScrollController;
  List<int> hourList = [];
  Map<int, List<int>> minuteMapList = Map();
  List<int> minuteList = [];

  bool scrollHour = false;
  bool scrollMinute = false;

  int hourSelectedIndex;

  @override
  void initState() {
    super.initState();

    hourSelectedIndex = widget.initHour;

    for (var h = widget.initHour; h < 24; h++) {
      hourList.add(h);
      if (h > widget.initHour) {
        for (var m = 0; m < 60; m++) {
          minuteList.add(m);
        }
        minuteMapList[h] = minuteList;
        minuteList = [];
      } else {
        for (var mm = widget.initMinute; mm < 60; mm++) {
          minuteList.add(mm);
        }
        minuteMapList[h] = minuteList;
        minuteList = [];
      }
    }

    _hourScrollController = FixedExtentScrollController(initialItem: 0);

    _minuteScrollController = FixedExtentScrollController(initialItem: 0);

    _hourScrollController..addListener(() {});

    _minuteScrollController..addListener(() {});

    callBackSelectedHour = widget.initHour;
    callBackSelectedMinute = widget.initMinute;
  }

  @override
  void dispose() {
    widget.selectedMinute(callBackSelectedMinute);
    widget.selectedHour(callBackSelectedHour);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Spacer(),
          Material(
              child: Container(
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
                          'Hour:',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
//                      SizedBox(
//                        width: MediaQuery.of(context).size.width * 0.01,
//                      ),
                      Expanded(
                        child: Text(
                          'Minute',
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
                              setState(() {
                                scrollHour = true;
                                hourSelectedIndex = hourList[value];
                                callBackSelectedHour = hourList[value];
                                callBackSelectedMinute =
                                    minuteMapList[hourSelectedIndex][0];
                              });
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
                                  color: Colors.black12,
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
                              scrollMinute = true;
                              callBackSelectedMinute =
                                  minuteMapList[hourSelectedIndex][value];
                            },
                            itemExtent: 40,
                            magnification: 1.3,
                            useMagnifier: true,
                            physics: FixedExtentScrollPhysics(),
                            diameterRatio: 1.5,
                            offAxisFraction: 0.5,
                            squeeze: 0.8,
                            children:
                                minuteMapList[hourSelectedIndex].map((minute) {
                              return Container(
                                  color: Colors.black12,
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
          )),
        ],
      ),
    );
  }
}

class _TimePickerRoute<T> extends PopupRoute<T> {
  final Widget widget;

  _TimePickerRoute({this.widget});

  @override
  Color get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  @override
  String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Widget bottomSheet = new MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: widget,
    );

    ThemeData inheritTheme = Theme.of(context, shadowThemeOnly: true);
    if (inheritTheme != null) {
      bottomSheet = new Theme(data: inheritTheme, child: bottomSheet);
    }

    return SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: bottomSheet);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}
