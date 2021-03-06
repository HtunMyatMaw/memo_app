import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/page/done/done_bloc.dart';
import 'package:choose_app/page/done/done_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DoneBloc bloc = DoneBloc(StoreProvider.of<AppState>(context));

    return StreamBuilder<int>(
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
                    return DoneListItem(
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

  void loadTask(DoneBloc bloc) {
    bloc.getDoneTaskList();
  }
}
