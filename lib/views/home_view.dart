import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_cubit.dart';
import 'package:flutter_application_1/views/service_view/chatbot_view.dart';
import 'package:flutter_application_1/views/service_view/material_book_view.dart';
import 'package:flutter_application_1/views/service_view/payment_view.dart';
import 'package:flutter_application_1/views/service_view/postgraduate_exams_view.dart';
import 'package:flutter_application_1/views/service_view/postgraduate_results_view.dart';
import 'package:flutter_application_1/views/service_view/postgraduate_study_view.dart';
import 'package:flutter_application_1/views/service_view/record_course_view.dart';
import 'package:flutter_application_1/views/service_view/record_search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static List<List> serviceList(context) => [
        [
          "assets/images/2.png",
          "الدفع الالكتروني",
          () {
            Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => const PaymentView(),
            ),);
          },
        ],
        [
          "assets/images/3.png",
          "تسجيل واختيار المواد",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RecordCourseView()),

            );
          },
        ],
        [
          "assets/images/2.png",
          "تسجيل نقطه البحث",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RecordSearchView()),
            );
          },
        ],
        [
          "assets/images/1.png",
          "الكتب والمصادر للمواد",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MaterialBookView()),
            );
          },
        ],
        [
          "assets/images/6.png",
          "جدول الامتحانات",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  const PostgraduateExamsView()),
            );

          },
        ],
        [
          "assets/images/8.png",
          "جدول الدراسه",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PostgraduateStudyView()),
            );
          },
        ],
        [
          "assets/images/7.png",
          "نتايج الدراسات العليا",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PostgraduateResultsView()),
            );
          },
        ],
        [
          "assets/images/10.png",
          "الطلبات والاعلانات",
          () {
            print("done");
          },
        ],
        [
          "assets/images/1.png",
          "الاعلانات ومواعيد الندوات",
          () {
            print("done");
          },
        ],
        [
          "assets/images/9.png",
          "الدردشه لمساعده الطالب",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatBotView()),
            );
          },
        ],
      ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.asset(
                "assets/images/banner_home.png",
                width: double.maxFinite,
                height: 250.0,
                fit: BoxFit.cover,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                color: Colors.black.withOpacity(0.4),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "الدراسات العليا",
                      style: TextStyle(
                          color: Color(0XFF57B4D7),
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "كل ما يحتاجه الطالب من مدخل واحد: تسجيل المقررات، دفع المصروفات، منصة منصة التعليم الالكتروني , جداول الدراسة , جداول الامتحانات نتائج.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0XFF57B4D7),
                        width: 5.0,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    "الخدمات الالكترونية",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: serviceList(context).length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: serviceList(context)[index][2],
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            serviceList(context)[index][0],
                            fit: BoxFit.fill,
                            width: MediaQuery.sizeOf(context).width / 4,
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            serviceList(context)[index][1],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
