import 'package:choose_app/config/app_state.dart';
import 'package:choose_app/model/task_data_model.dart';
import 'package:choose_app/page/doing/doing_bloc.dart';
import 'package:choose_app/page/doing/doing_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DoingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DoingBloc bloc = DoingBloc(StoreProvider.of<AppState>(context));

    return StreamBuilder<int>(
      initialData: 0,
      stream: bloc.taskProgressChangeStream,
      builder: (context, snapshot) {
        loadTask(bloc);

        return Container(
          key: UniqueKey(),
          child: StreamBuilder<List<TaskDataModel>>(
            stream: bloc.doingListStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.isNotEmpty) {
                List<TaskDataModel> list = snapshot.data;

                return ListView.builder(
                  addAutomaticKeepAlives: false,
                  itemBuilder: (builder, index) {
                    return DoingListItem(
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

  void loadTask(DoingBloc bloc) {
    bloc.getDoingTaskList();
  }
}
