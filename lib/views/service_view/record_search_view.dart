import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_cubit.dart';
import 'package:flutter_application_1/controllers/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

class RecordSearchView extends StatefulWidget {
  const RecordSearchView({super.key});

  @override
  State<RecordSearchView> createState() => _RecordSearchViewState();
}

class _RecordSearchViewState extends State<RecordSearchView> {
  final List<String> deItems = [
    'IS',
    'CS',
    'AI',
    'SC',
  ];
  String? selectedValue;

  final List<String> items = [
    'تقديم علي ماسجتير',
    'عرض الفكرة',
    'سمنار عرض نتائج',
    'سمنار مناقشه نهائي',
    'طلب التحاق بالدكتوراه',
    'امتحان شامل الخاص بالدكتوراه',
  ];
  String? selectedTypeValue;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectArController = TextEditingController();
  final TextEditingController _subjectEnController = TextEditingController();

  @override
  void initState() {
    selectedValue = deItems[0];
    selectedTypeValue = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => AppCubit()..availableCourses,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "تسجيل النقطة البحثية",
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "السيد الأستاذ الدكتور/ رئيس قسم",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          items: deItems
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 90,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                   Text(
                   "تحية طيبة وبعد،،\nأرجو من سيادتكم التكرم بالموافقة علي :",
                   style: TextStyle(
                     fontWeight: FontWeight.w500,
                     fontSize: 18.0,
                   ),
                   ),
                   DropdownButtonHideUnderline(
                     child: DropdownButton2<String>(
                       isExpanded: true,
                       items: items
                           .map((String item) => DropdownMenuItem<String>(
                         value: item,
                         child: Text(
                           item,
                           style: const TextStyle(
                             fontSize: 14,
                           ),
                         ),
                       ))
                           .toList(),
                       value: selectedTypeValue,
                       onChanged: (String? value) {
                         setState(() {
                           selectedTypeValue = value;
                         });
                       },
                       buttonStyleData: const ButtonStyleData(
                         padding: EdgeInsets.symmetric(horizontal: 16),
                         height: 60,
                         width: 150,
                       ),
                       menuItemStyleData: const MenuItemStyleData(
                         height: 40,
                       ),
                     ),
                   ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Text(
                        "للطالب",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Expanded(
                        child: SizedBox(
                          height: 40.0,
                          child: TextFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors.black45,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Color(0XFF57B4D7),
                                    )),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 16.0)),
                            controller: _nameController,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "المقيد بالقسم التخصصي",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          items: deItems
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 90,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "عنوان الرسالة باللغة العربية :",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0XFF57B4D7),
                        ),
                      ),
                    ),
                    maxLines: 7,
                    minLines: 4,
                    controller: _subjectArController,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "عنوان الرسالة باللغة الانجليزيه :",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0XFF57B4D7),
                        ),
                      ),
                    ),
                    maxLines: 7,
                    minLines: 4,
                    controller: _subjectEnController,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 8.0),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "وتفضلوا بقبول وافر الشكر والتقدير،،،",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: BlocListener<AppCubit, AppStates>(
                      listenWhen: (previous, current) => current is MakeReportLoading ||
                          current is MakeReportSuccess||
                          current is MakeReportError,
                      listener: (context, state) {
                        if(state is MakeReportLoading) {
                          showDialog(context: context, builder: (context) => const Center(
                            child: CircularProgressIndicator(color: Colors.blue,),
                          ),);
                        } if (state is MakeReportSuccess) {
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                            msg: "تم تسجيل نقطة البحث",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }if (state is MakeReportError)
                        {
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                            msg: 'حدث خطأ ما حاول في وقت لاحق',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                          );}
                      },
                    child: ElevatedButton(
                      onPressed: () {
                        AppCubit.get(context).makeReportStudent(
                            content: {
                              "name" : _nameController.text,
                              "title arabic" : _subjectEnController.text,
                              "title english" : _subjectArController.text,
                                 "department" : selectedValue,
                            },
                            type: '$selectedTypeValue',
                            date: DateTime.now().toString(),);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF57B4D7).withOpacity(0.8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        minimumSize: const Size(double.infinity, 50.0),
                      ),
                      child: const Text(
                        "ارسال الطلب",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                                      ),),
                  const SizedBox(height: 22.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
