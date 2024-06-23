import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_cubit.dart';
import 'package:flutter_application_1/controllers/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PostgraduateResultsView extends StatefulWidget {
  const PostgraduateResultsView({super.key});

  @override
  State<PostgraduateResultsView> createState() =>
      _PostgraduateResultsViewState();
}

class _PostgraduateResultsViewState extends State<PostgraduateResultsView> {
  List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'ID',
      field: 'id',
      type: PlutoColumnType.text(),
      width: 80.0,
      readOnly: true,
      enableColumnDrag: false,
      enableFilterMenuItem: false,
      enableDropToResize: false,
      enableSetColumnsMenuItem: false,
      enableEditingMode: false,
      enableSorting: false,
      enableHideColumnMenuItem: false,
    ),
    PlutoColumn(
        title: 'كود الماده',
        field: 'code',
        type: PlutoColumnType.text(),
        width: 120.0,
        readOnly: true,
        enableColumnDrag: false,
        enableFilterMenuItem: false,
        enableDropToResize: false,
        enableSetColumnsMenuItem: false,
        enableEditingMode: false,
        enableSorting: false,
        enableHideColumnMenuItem: false),
    PlutoColumn(
        title: 'الدرجه',
        field: 'grade',
        type: PlutoColumnType.text(),
        width: 100.0,
        readOnly: true,
        enableColumnDrag: false,
        enableFilterMenuItem: false,
        enableDropToResize: false,
        enableSetColumnsMenuItem: false,
        enableEditingMode: false,
        enableSorting: false,
        enableHideColumnMenuItem: false),
  ];

  List<PlutoRow> rows = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "نتائج المواد المسجلة",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0XFF57B4D7),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) =>
          AppCubit()
            ..getGrades(),
          child: BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              if (state is GetGradesSuccess) {
                for (var grade in AppCubit.get(context).grades) {
                  rows.add(
                    PlutoRow(
                      cells: {
                        'id': PlutoCell(value: grade.id),
                        'code': PlutoCell(value: grade.courseId),
                        'grade': PlutoCell(value: grade.grade),
                      },
                    ),
                  );
                }
              }

              if(state is GetGradesSuccess){

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: PlutoGrid(
                      columns: columns,
                      rows: rows,
                      onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                      },
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        print(event);
                      }),
                );
              }
              else if(state is GetGradesLoading){
              return const Center(child: CircularProgressIndicator(),);
              }else{
                return const Center(child: Text("error", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),),);
              }
            },
          ),
        ),
      ),
    );
  }
}
