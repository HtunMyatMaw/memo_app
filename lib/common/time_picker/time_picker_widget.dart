import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final int initHour;
  final int initMinute;
  final VoidCallback selectedTime;

  const TimePickerWidget(
      {Key key, this.initHour, this.initMinute, this.selectedTime})
      : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  List<int> hourList = [];
  List<int> minuteList = [];

  @override
  void initState() {
    super.initState();

    for (var h = 0; h < 24; h++) {
      hourList.add(h);
    }

    for (var m = 0; m < 60; m++) {
      minuteList.add(m);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
