import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/page/todo/all/todo_list_all_bloc.dart';
import 'package:choose_app/redux/todo_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TodoListAllItem extends StatefulWidget {
  final TaskDataModel itemModel;
  final TodoListAllBloc bloc;

  const TodoListAllItem({Key key, this.itemModel, this.bloc}) : super(key: key);

  @override
  _TodoListAllItemState createState() => _TodoListAllItemState();
}

class _TodoListAllItemState extends State<TodoListAllItem> {
  int _selectedTaskProgress;

  @override
  void initState() {
    super.initState();
    _selectedTaskProgress = widget.itemModel.taskProgress;
  }

  @override
  Widget build(BuildContext context) {
    Store store = StoreProvider.of<AppState>(context);

    return Dismissible(
      key: ValueKey(widget.itemModel.startDateTime),
      onDismissed: (_) async {
        StoreProvider.of<AppState>(context)
            .dispatch(RemoveTodoDataAction(widget.itemModel.id));
      },
      background: Container(
        padding: EdgeInsets.only(left: 10.0),
        color: Colors.red,
        child:
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.delete)),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.only(right: 10.0),
        color: Colors.red,
        child:
            Align(alignment: Alignment.centerRight, child: Icon(Icons.delete)),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              )),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListTileTheme(
          contentPadding: EdgeInsets.all(0),
          child: ExpansionTile(
            title: Text(
              '${widget.itemModel.title}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            subtitle: Text('${widget.itemModel.content}'),
            children: <Widget>[
              Text('Change Task Progress & View Detail'),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Row(
                  children: <Widget>[
                    Material(
                      child: InkWell(
//                        highlightColor: _selectedTaskProgress == 0 ? Colors.redAccent : Colors.red[200],
                        onTap: () {
                          setState(() {
                            _selectedTaskProgress = 1;
                            updateTaskProgress(store, 1, widget.itemModel);
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 24,
                          decoration: BoxDecoration(
                            color: _selectedTaskProgress == 1
                                ? Colors.red
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      child: InkWell(
//                        highlightColor: _selectedTaskProgress == 1 ? Colors.yellowAccent : Colors.yellow[200],
                        onTap: () {
                          setState(() {
                            _selectedTaskProgress = 2;
                            updateTaskProgress(store, 2, widget.itemModel);
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 24,
                          decoration: BoxDecoration(
                            color: _selectedTaskProgress == 2
                                ? Colors.orange
                                : Colors.orange[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      child: InkWell(
//                        highlightColor: _selectedTaskProgress == 2 ? Colors.greenAccent : Colors.green[200],
                        onTap: () {
                          setState(() {
                            _selectedTaskProgress = 3;
                            updateTaskProgress(store, 3, widget.itemModel);
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 24,
                          decoration: BoxDecoration(
                            color: _selectedTaskProgress == 3
                                ? Colors.green
                                : Colors.green[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.more_horiz))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateTaskProgress(Store store, int taskPos, TaskDataModel itemModel) {
    store.dispatch(UpdateTodoDataAction(TaskDataModel(
      id: itemModel.id,
      title: itemModel.title,
      content: itemModel.content,
      startDateStr: itemModel.startDateStr,
      endDateStr: itemModel.endDateStr,
      startDateTime: itemModel.startDateTime,
      endDateTime: itemModel.endDateTime,
      taskProgress: taskPos,
    )));
  }
}
