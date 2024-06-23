import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_view.dart';
import 'notifications_views.dart';
import 'profile_view.dart';
import 'settings_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;

  static const List<Widget> listOfViews = <Widget>[
    HomeView(),
    ProfileView(),
    NotificationView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => AppCubit()..getProfile(),
        child: Scaffold(
          body: SafeArea(child: listOfViews[selectedIndex]),
          bottomNavigationBar: NavigationBar(
            animationDuration: const Duration(milliseconds: 1000),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home_filled,
                  size: 28,
                ),
                label: 'الرئيسية',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_4,
                  size: 28,
                ),
                label: 'الحساب',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.notifications_active,
                  size: 28,
                ),
                label: 'الاشعارات',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings_sharp,
                  size: 28,
                ),
                label: 'الاعدادات',
              ),
            ],
            indicatorColor: const Color(0XFF57B4D7),
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
