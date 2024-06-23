import 'dart:async';

import 'package:flutter_application_1/controllers/app_states.dart';
import 'package:flutter_application_1/models/get_available%20_courses_response.dart';
import 'package:flutter_application_1/models/get_grade_response.dart';
import 'package:flutter_application_1/models/profile_response.dart';
import 'package:flutter_application_1/utils/api_helper.dart';
import 'package:flutter_application_1/utils/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/get_courses_response.dart';
import '../models/get_scheduale_response.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  ProfileResponse? profile;
  List<CoursesResponse> courses = [];

  Future<void> getProfile() async {
    emit(GetProfileLoading());

    String? token = await CacheHelper.getData(key: "token");

    await ApiHelper.postData(
      url: "auth/user-profile",
      token: token,
    ).then((value) {
      emit(GetProfileSuccess());
      profile = ProfileResponse.fromJson(value.data);
    }).catchError((error) {
      emit(GetProfileError());
    });
  }

  Future<void> getCourses() async {
    emit(GetCoursesLoading());

    String? token = await CacheHelper.getData(key: "token");

    await ApiHelper.postData(
      url: "showcourses",
      token: token,
    ).then((value) {
      emit(GetCoursesSuccess());

      value.data.forEach((val) {
        courses.add(CoursesResponse.fromJson(val));
      });
    }).catchError((error) {
      emit(GetCoursesError());
    });
  }

  List<AvailableCourses> availableCourses = [];

  Future<void> getAvailableCourses() async {
    emit(GetAvailableCoursesLoading());

    String? token = await CacheHelper.getData(key: "token");

    await ApiHelper.postData(
      url: "showcoursesForDepartment",
      token: token,
    ).then((value) {
      emit(GetAvailableCoursesSuccess());
      value.data.forEach((val) {
        availableCourses.add(AvailableCourses.fromJson(val));
      });
      print(availableCourses[0].name);
      print('gebt data');
    }).catchError((error) {
      emit(GetAvailableCoursesError());
      print(error);
      print('ERRROROROROROR');
    });
  }

  Scheduale? studyScheduale;

  Future<void> getStudyScheduale() async {
    emit(GetStudySchedualeLoading());

    String? token = await CacheHelper.getData(key: "token");

    await ApiHelper.postData(
      url: "showscheduales/1",
      token: token,
    ).then((value) {
      emit(GetStudySchedualeSuccess());
      studyScheduale = Scheduale.fromJson(value.data);
      print(studyScheduale!.id);
    }).catchError((onError) {
      emit(GetStudySchedualeError());
    });
  }

  Scheduale? ExamScheduale;

  Future<void> getExamScheduale() async {
    emit(GetExamSchedualeLoading());

    String? token = await CacheHelper.getData(key: "token");

    await ApiHelper.postData(
      url: "showscheduales/2",
      token: token,
    ).then((value) {
      emit(GetExamSchedualeSuccess());
      ExamScheduale = Scheduale.fromJson(value.data);
      print(ExamScheduale!.id);
      print('Ana hena');
    }).catchError((onError) {
      emit(GetExamSchedualeError());
      print(onError.toString());
      print('ERRROROROROROR');
    });
  }

  Future launchUrl({required String url}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(url: url);
    }
  }

  List<GetGradeResponse> grades = [];

  Future<void> getGrades() async {
    emit(GetGradesLoading());

    String? token = await CacheHelper.getData(key: "token");

    await ApiHelper.postData(
      url: "showgrade",
      token: token,
    ).then((value) {
      value.data.forEach((val) {
        grades.add(GetGradeResponse.fromJson(val));
      });
      print(grades[0].id);
      emit(GetGradesSuccess());
    }).catchError((onError) {
      print('error in grades');
      emit(GetGradesError());
    });
  }

  Future<void> enrollCourses({required List<int> id}) async {
    emit(EnrollCourseLoading());

    String? token = await CacheHelper.getData(key: "token");

    await ApiHelper.postData(
      url: "courses/enroll",
      token: token,
      data: {
        "course_ids": "$id",
      },
    ).then((value) {
      emit(EnrollCourseSuccess());
      print('Ana hena');
    }).catchError((onError) {
      emit(EnrollCourseError());
      print(onError.toString());
      print('ERRROROROROROR');
    });
  }


  Future<void> makeReportStudent({required content ,required String type ,required String date }) async{
    emit(MakeReportLoading());

    String? token = await CacheHelper.getData(key: "token");

    return ApiHelper.postData(
      url: "makereportstudent",
      token: token,
      data: {
        "content": "$content",
        "type": "$type",
        "date": "$date",
      },
    ).then((value) {
      emit(MakeReportSuccess());
      print('سجلت نقطه البحث يا نجم');
    }).catchError((onError) {
      emit(MakeReportError());
      print(onError.toString());
      print('ERRROROROROROR');
    });
  }
}
