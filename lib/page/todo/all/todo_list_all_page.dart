import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/page/todo/all/todo_list_all_bloc.dart';
import 'package:choose_app/page/todo/all/todo_list_all_item.dart';
import 'package:choose_app/page/todo/todo_list_bloc.dart';
import 'package:choose_app/page/todo/todo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TodoListAllPage extends StatelessWidget {
  final TodoListAllBloc bloc;

  const TodoListAllPage({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: bloc.newTaskCreatedResponseStream,
      builder: (context, snapshot) {
        bloc.getAllTodoList();

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
                    return TodoListAllItem(
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
      },
    );
  }
}
