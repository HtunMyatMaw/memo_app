import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:flutter/material.dart';

/// 角丸長方形ボタン
class RoundedRectangularButton extends StatelessWidget {
  const RoundedRectangularButton({
    Key key,
    this.title,
    this.content = '',
    this.imageUri,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  /// タイトル
  final String title;

  /// 説明内容
  final String content;

  /// 画像URI
  final String imageUri;

  /// アイコン
  final Icon icon;

  /// ボタン押下のコールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: onPressed,
        padding: EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.lime,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /// 画像
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
                child: icon != null
                    ? icon
                    : Image.asset(
                        'images/' + imageUri,
                        width: 60,
                        height: 60,
                      ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.lime[900],
                  width: 1.0,
                )),
                height: 60,
              ),

              /// 説明
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      MultiSmallWidgets().titleWidget(
                        dataText: title,
                      ),
                      MultiSmallWidgets().contentWidget(
                        dataText: title,
                      ),
                    ],
                  ),
                ),
              ),

              /// アイコン
              Container(
                height: 80,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.lime[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
