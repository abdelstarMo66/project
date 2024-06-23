import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_cubit.dart';
import 'package:flutter_application_1/controllers/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostgraduateExamsView extends StatelessWidget {
  const PostgraduateExamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "جدول الامتحانات",
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
          create: (context) => AppCubit()..getExamScheduale(),
          child: BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              if (state is GetExamSchedualeSuccess) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: ElevatedButton(
                      onPressed: () {
                        AppCubit.get(context).launchUrl(
                          url:
                          'https://527d-197-165-157-42.ngrok-free.app/${AppCubit.get(context).ExamScheduale!.content}',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0XFF57B4D7).withOpacity(0.8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        minimumSize: const Size(double.infinity, 50.0),
                      ),
                      child: const Text(
                        "فتح الجدول",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              } else if (state is GetExamSchedualeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text(
                    "حدث خطا اثناء تنزيل الجدول، برجاء المحاوله لاحقا",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
