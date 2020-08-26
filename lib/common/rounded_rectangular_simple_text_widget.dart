import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:flutter/material.dart';

class RoundedRectangularSimpleTextWidget extends StatelessWidget {
  final String title;
  final VoidCallback buttonPress;

  const RoundedRectangularSimpleTextWidget(
      {Key key, this.title, this.buttonPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Colors.lime,
        splashColor: Colors.black12,
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: buttonPress,
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child:
              Center(child: MultiSmallWidgets().titleWidget(dataText: title)),
        ));
  }
}
