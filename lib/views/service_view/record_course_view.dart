import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_cubit.dart';
import 'package:flutter_application_1/controllers/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto_grid/pluto_grid.dart';

class RecordCourseView extends StatefulWidget {
  const RecordCourseView({super.key});

  @override
  State<RecordCourseView> createState() => _RecordCourseViewState();
}

class _RecordCourseViewState extends State<RecordCourseView> {
  List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'ID',
      field: 'id',
      type: PlutoColumnType.number(),
      width: 120.0,
      readOnly: true,
      enableColumnDrag: false,
      enableFilterMenuItem: false,
      enableDropToResize: false,
      enableSetColumnsMenuItem: false,
      enableEditingMode: false,
      enableSorting: false,
      enableHideColumnMenuItem: false,
      enableRowChecked: true,
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
        title: 'اسم الماده',
        field: 'name',
        type: PlutoColumnType.text(),
        readOnly: true,
        enableColumnDrag: false,
        enableFilterMenuItem: false,
        enableDropToResize: false,
        enableSetColumnsMenuItem: false,
        enableEditingMode: false,
        enableSorting: false,
        enableHideColumnMenuItem: false),
    PlutoColumn(
        title: 'عدد الساعات',
        field: 'hours',
        type: PlutoColumnType.number(),
        width: 100.0,
        readOnly: true,
        enableColumnDrag: false,
        enableFilterMenuItem: false,
        enableDropToResize: false,
        enableSetColumnsMenuItem: false,
        enableEditingMode: false,
        enableSorting: false,
        enableHideColumnMenuItem: false),
    PlutoColumn(
        title: 'اختار',
        field: 'chose',
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

  List hasChecked = [];

  List<PlutoColumn> columnsRecorded = [
    PlutoColumn(
      title: 'ID',
      field: 'id',
      type: PlutoColumnType.number(),
      width: 120.0,
      readOnly: true,
      enableColumnDrag: false,
      enableFilterMenuItem: false,
      enableDropToResize: false,
      enableSetColumnsMenuItem: false,
      enableEditingMode: false,
      enableSorting: false,
      enableHideColumnMenuItem: false,
      enableRowChecked: true,
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
        title: 'اسم الماده',
        field: 'name',
        type: PlutoColumnType.text(),
        readOnly: true,
        enableColumnDrag: false,
        enableFilterMenuItem: false,
        enableDropToResize: false,
        enableSetColumnsMenuItem: false,
        enableEditingMode: false,
        enableSorting: false,
        enableHideColumnMenuItem: false),
    PlutoColumn(
        title: 'عدد الساعات',
        field: 'hours',
        type: PlutoColumnType.number(),
        width: 100.0,
        readOnly: true,
        enableColumnDrag: false,
        enableFilterMenuItem: false,
        enableDropToResize: false,
        enableSetColumnsMenuItem: false,
        enableEditingMode: false,
        enableSorting: false,
        enableHideColumnMenuItem: false),
    PlutoColumn(
        title: 'اختار',
        field: 'chose',
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

  List<PlutoRow> rowsRecorded = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "تسجيل الكورسات",
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
          create: (context) => AppCubit()..getAvailableCourses()..getCourses(),
          child: BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              AppCubit cubit = AppCubit.get(context);

              if (state is GetAvailableCoursesSuccess) {
                for (var course in cubit.availableCourses) {
                  rows.add(
                    PlutoRow(
                      cells: {
                        'id': PlutoCell(value: course.id),
                        'code': PlutoCell(value: course.code),
                        'name': PlutoCell(value: course.name),
                        'hours': PlutoCell(value: course.hours),
                        'chose': PlutoCell(value: course.chose),
                      },
                    ),
                  );
                }
              }
              if (state is GetCoursesSuccess) {
                for (var course in cubit.availableCourses) {
                  rowsRecorded.add(
                    PlutoRow(
                      cells: {
                        'id': PlutoCell(value: course.id),
                        'code': PlutoCell(value: course.code),
                        'name': PlutoCell(value: course.name),
                        'hours': PlutoCell(value: course.hours),
                        'chose': PlutoCell(value: course.chose),
                      },
                    ),
                  );
                }
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning_rounded,
                            size: 16.0,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                              child: Text(
                                  "برجاء استكمال البيانات التالية والتحقق من وضوحها وسلامتها لضمان وصولها")),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    if (cubit.availableCourses.isNotEmpty) ...[
                      Expanded(
                        child: PlutoGrid(
                          columns: columns,
                          rows: rows,
                          onRowChecked: (PlutoGridOnRowCheckedEvent p) {
                            if (p.isChecked!) {
                              hasChecked.add(p.row!.cells["id"]!.value);
                            } else {
                              hasChecked.remove(p.row!.cells["id"]!.value);
                            }
                          },
                        ),
                      ),
                    ] else ...[
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                    const SizedBox(height: 12.0),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 18.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (hasChecked.isNotEmpty) {
                              hasChecked.forEach((checkId) {
                                cubit.enrollCourses(id: checkId);
                              });
                              cubit.getAvailableCourses();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0XFF57B4D7).withOpacity(0.8),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            minimumSize: const Size(90.0, 50.0),
                          ),
                          child: const Text(
                            "تسجيل المقرر",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "المواد المسجله",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    if (cubit.courses.isNotEmpty) ...[
                      Expanded(
                        child: PlutoGrid(
                            columns: columnsRecorded,
                            rows: rowsRecorded,
                            onChanged: (PlutoGridOnChangedEvent event) {
                              print(event);
                            },
                            onLoaded: (PlutoGridOnLoadedEvent event) {
                              print(event);
                            }),
                      ),
                    ] else ...[
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],

                    const SizedBox(height: 12.0),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
