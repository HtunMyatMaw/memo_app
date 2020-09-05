import 'package:choose_app/common/multi_small_widgets.dart';
import 'package:choose_app/common/rounded_rectangular_simple_text_widget.dart';
import 'package:choose_app/common/time_picker/time_picker.dart';
import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/page/todo/all/todo_list_all_bloc.dart';
import 'package:choose_app/redux/todo_action.dart';
import 'package:choose_app/utility/date_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CreateNewTask extends StatefulWidget {
  @override
  _CreateNewTodoState createState() => _CreateNewTodoState();
}

class _CreateNewTodoState extends State<CreateNewTask> {
  TextEditingController _titleController;
  TextEditingController _contentController;

  int selectedStartHour;
  int selectedStartMinute;

  String selectedStartTimeStr = DateUtility().formattedCurrentTimeHHMM();
  String selectedEndTimeStr = '23 : 59';

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final TodoListAllBloc args = ModalRoute.of(context).settings.arguments;
    print('$args');

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        bottom: false,
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: SafeArea(
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: _dataBody(args),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dataBody(TodoListAllBloc bloc) {
    List<Widget> list = [
      /// タイトル
      MultiSmallWidgets().titleWidget(
        dataText: 'Title',
      ),
      Container(
        padding: EdgeInsets.only(top: 10.0),
        child: TextField(
          controller: _titleController,
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
          controller: _contentController,
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
            var dataModel = TaskDataModel(
              id: '${DateTime.now().millisecondsSinceEpoch}',
              title: _titleController.text,
              content: _contentController.text,
              startDateStr: selectedStartTimeStr,
              endDateStr: selectedEndTimeStr,
            );

            /// ローカル
//                setState(() {
            StoreProvider.of<AppState>(context)
                .dispatch(AddTodoDataAction(dataModel));
            bloc.taskCreatedResponse(DateTime.now().millisecondsSinceEpoch);

            Navigator.pop(context);
//                });
          },
        ),
      ),
    ];

    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.indigo,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.white,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: (builder, index) {
                  return list[index];
                },
                itemCount: list.length,
                shrinkWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
