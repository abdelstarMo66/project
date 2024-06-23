import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  static List notificationList = [
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
    ["تم تسجيل مقرر", "لقد تم تسجيل المقرر بنجاح", "34/03/2024, 05:23:00"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "الاشعارات",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 18.0),
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? Colors.greenAccent.withOpacity(0.2)
                        : Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notificationList[index][0],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        notificationList[index][1],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Colors.black87),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          notificationList[index][2],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 12.0),
            itemCount: notificationList.length,
          ),
        ),
      ],
    );
  }
}
