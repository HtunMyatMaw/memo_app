import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/page/todo/todo_list_bloc.dart';
import 'package:choose_app/page/todo/todo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoListBloc bloc = TodoListBloc(StoreProvider.of<AppState>(context));

    return Container(
      child: StreamBuilder<int>(
          initialData: 0,
          stream: bloc.taskProgressChangeStream,
          builder: (context, snapshot) {
            loadTask(bloc);

            return Container(
              key: UniqueKey(),
              child: StreamBuilder<List<TaskDataModel>>(
                stream: bloc.todoListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data.isNotEmpty) {
                    List<TaskDataModel> list = snapshot.data;

                    return ListView.builder(
                      addAutomaticKeepAlives: false,
                      itemBuilder: (builder, index) {
                        return TodoListItem(
                          itemModel: list[index],
                          bloc: bloc,
                        );
                      },
                      itemCount: list.length,
                    );
                  }

                  /// エラー、データ無し
                  return Container();
                },
              ),
            );
          }),
    );
  }

  void loadTask(TodoListBloc bloc) {
    bloc.getTodoTaskList();
  }
}
