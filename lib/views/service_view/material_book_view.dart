import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_cubit.dart';
import 'package:flutter_application_1/controllers/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialBookView extends StatelessWidget {
  const MaterialBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => AppCubit()..getCourses(),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "مصادر المواد المسجله",
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
              body: state is GetCoursesLoading
                  ? const Center(child: CircularProgressIndicator())
                  : cubit.courses.isEmpty
                      ? const Center(
                          child: Text(
                            "لا يوجد مواد مسجله بعد",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18.0),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          child: ListView.builder(
                            itemBuilder: (context, index) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "كود الماده: ${cubit.courses[index].course!.code ?? "undefined"}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Text(
                                      "اسم الماده: ${cubit.courses[index].course!.name ?? "undefined"}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Text(
                                      "عدد ساعات الماده: ${cubit.courses[index].course!.hours ?? "undefined"}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            backgroundColor:
                                                const Color(0XFF57B4D7),
                                          ),
                                          child: const Text(
                                            "تنزيل",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8.0),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            backgroundColor:
                                                const Color(0XFF57B4D7),
                                          ),
                                          child: const Text(
                                            "فتح",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            itemCount: cubit.courses.length,
                          ),
                        ),
            );
          },
        ),
      ),
    );
  }
}
