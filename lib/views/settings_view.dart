import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/cache_helper.dart';
import 'package:flutter_application_1/views/login_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/benha_logo.png",
                width: MediaQuery.sizeOf(context).width / 3,
              ),
            ),
            const SizedBox(height: 14.0),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0XFF57B4D7),
              ),
              child: const Text(
                "الدراسات العليا",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            const Text(
              "1. يلتزم طلاب الدراسات العليا بالعديد من الجوانب الإدارية المتعلقة بشروط الالتحاق بالدراسات العليا، التي تختلف ما بين درجة علمية وأخرى، إضافة إلى البرامج العلمية المميزة في كل كلية من كليات الجامعة، استمارات التقدم والمستندات المطلوبة للالتحاق إضافة إلى المصروفات المطلوبة من المصريين والوافدين، بالإضافة إلى الدورات التدريبية المتاحة لطلاب الدراسات العليا.. وفيما يلي شرح توضيحي يتضمن كل هذه الجوانب وأكثر.\n 2. دليل الدراسات العليا",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
            const Divider(
              height: 30.0,
              thickness: 1.0,
              indent: 22.0,
              endIndent: 22.0,
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "النشرة الإخبارية",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0XFF57B4D7),
                      size: 22.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "عن القطاع",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0XFF57B4D7),
                      size: 22.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "الجوائز",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0XFF57B4D7),
                      size: 22.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "المكتبات",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0XFF57B4D7),
                      size: 22.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "اللغة",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0XFF57B4D7),
                      size: 22.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () {
                CacheHelper.removeData(key: "token").then((value) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                    (_) => false,
                  );
                });
              },
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                        fontSize: 18.0,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.deepOrange,
                      size: 22.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0)
          ],
        ),
      ),
    );
  }
}
