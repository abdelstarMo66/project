import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_cubit.dart';
import 'package:flutter_application_1/controllers/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jopController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    _nameController.text = "يوسف عمادالدين";
    _emailController.text = "Useifemad123@gmail.com";
    _passwordController.text = "kahlawy123";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      buildWhen: (previous, current) =>
          current is GetProfileSuccess ||
          current is GetProfileLoading ||
          current is GetProfileError,
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        if (state is GetProfileSuccess) {
          _nameController.text = cubit.profile!.student!.name ?? "";
          _jopController.text = cubit.profile!.student!.job ?? "";
          _phoneController.text = cubit.profile!.student!.phone ?? "";
          _addressController.text = cubit.profile!.student!.address ?? "";
          _emailController.text = cubit.profile!.student!.email ?? "";
          _accountController.text = cubit.profile!.student!.account ?? "";

          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-photo/young-handsome-man-wearing-casual-tshirt-blue-background-happy-face-smiling-with-crossed-arms-looking-camera-positive-person_839833-12963.jpg?t=st=1718628159~exp=1718631759~hmac=5a63cece01ce4e251ea70b2aee86602f658743dc9bc3c26870ce40aaf09abaa1&w=996"),
                    ),
                  ),
                  const SizedBox(height: 38.0),
                  Row(
                    children: [
                      const Text(
                        "الاسم",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
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
                          ),
                          controller: _nameController,
                          validator: (value) {
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      const Text(
                        "البريد الالكتروني",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
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
                          ),
                          controller: _emailController,
                          validator: (value) {
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      const Text(
                        "الاكونت",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
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
                          ),
                          controller: _accountController,
                          validator: (value) {
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      const Text(
                        "الوظيفه",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
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
                          ),
                          controller: _jopController,
                          validator: (value) {
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      const Text(
                        "رقم الهاتف",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
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
                          ),
                          controller: _phoneController,
                          validator: (value) {
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      const Text(
                        "العنوان",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
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
                          ),
                          controller: _addressController,
                          validator: (value) {
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 28.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: ElevatedButton(
                      onPressed: () {},
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
                        "حفظ",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text(
              "Error, Please Login Again",
              style: TextStyle(fontSize: 18.0),
            ),
          );
        }
      },
    );
  }
}
