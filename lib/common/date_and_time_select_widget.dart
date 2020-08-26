//import 'package:choose_app/common/multi_small_widgets.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//
//class DateAndTimeSelectWidget extends StatefulWidget {
//  final String title;
//
//  const DateAndTimeSelectWidget({Key key, this.title = ''}) : super(key: key);
//
//  @override
//  _DateAndTimeSelectWidgetState createState() => _DateAndTimeSelectWidgetState();
//}
//
//class _DateAndTimeSelectWidgetState extends State<DateAndTimeSelectWidget> {
//  MultiSmallWidgets smallWidgets = MultiSmallWidgets();
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisAlignment: MainAxisAlignment.start,
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        smallWidgets.paddingRowWidget(
//            right: 0.0,
//            bottom: 10.0,
//            child: smallWidgets.titleWidget(dataText: widget.title)),
//        Row(
//          children: <Widget>[
//            Expanded(
//                flex: 5,
//                child: FlatButton(
//                  padding: EdgeInsets.all(
//                    0.0,
//                  ),
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(
//                    10.0,
//                  )),
//                  onPressed: () {
//                    DatePicker.showDatePicker(
//                      context,
//                    );
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(10.0),
//                      border: Border.all(
//                        color: Colors.lime,
//                      ),
//                    ),
//                    padding: EdgeInsets.all(10.0),
//                    child: Row(
//                      children: <Widget>[
//                        smallWidgets.paddingRowWidget(
//                          child: Icon(
//                            Icons.calendar_today,
//                            size: 25,
//                          ),
//                        ),
//                        Expanded(
//                          child:
//                              smallWidgets.contentWidget(dataText: 'Not Set'),
//                        ),
//                      ],
//                    ),
//                  ),
//                )),
//            SizedBox(
//              width: 10.0,
//            ),
//            Expanded(
//                flex: 3,
//                child: FlatButton(
//                  padding: EdgeInsets.all(
//                    0.0,
//                  ),
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(
//                    10.0,
//                  )),
//                  onPressed: () {
//                    DatePicker.showTimePicker(context);
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(10.0),
//                      border: Border.all(
//                        color: Colors.lime,
//                      ),
//                    ),
//                    padding: EdgeInsets.all(10.0),
//                    child: Row(
//                      children: <Widget>[
//                        smallWidgets.paddingRowWidget(
//                          child: Icon(
//                            Icons.access_time,
//                            size: 25,
//                          ),
//                        ),
//                        Expanded(
//                          child:
//                              smallWidgets.contentWidget(dataText: 'Not Set'),
//                        ),
//                      ],
//                    ),
//                  ),
//                )),
//          ],
//        ),
//      ],
//    );
//  }
//}
