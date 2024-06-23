import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
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

  RadioGroupController myController = RadioGroupController();

  List<String> items = ["ماجستير", "الدكتوراة"];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectArController = TextEditingController();
  final TextEditingController _subjectEnController = TextEditingController();

  @override
  void initState() {
    selectedValue = deItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
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
                const Text(
                  "تحية طيبة وبعد،،\nأرجو من سيادتكم التكرم بالموافقة علي مد التسجيل لرسالة:",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
                RadioGroup(
                  controller: myController,
                  values: items,
                  orientation: RadioGroupOrientation.horizontal,
                  decoration: const RadioGroupDecoration(
                      spacing: 30.0, activeColor: Color(0XFF57B4D7)),
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
                  child: ElevatedButton(
                    onPressed: () {},
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
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF57B4D7).withOpacity(0.8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      minimumSize: const Size(double.infinity, 50.0),
                    ),
                    child: const Text(
                      "اعاده ملئ بيانات الطلب",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 22.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
