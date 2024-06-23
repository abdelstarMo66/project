import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/api_helper.dart';
import 'package:flutter_application_1/utils/cache_helper.dart';

import '../models/login_response_model.dart';
import 'layout_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String? loginState;

  LoginResponseModel? loginResponseModel;

  void login() async {
    setState(() {
      loginState = "loading";
      print("loading");
    });

    await ApiHelper.postData(
      url: "auth/loginstudent",
      data: {
        "account": _emailController.text,
        "password": _passwordController.text
      },
    ).then((value) async {
      loginResponseModel = LoginResponseModel.fromJson(value.data);

      setState(() {
        loginState = "success";
        Fluttertoast.showToast(
          msg: "تم تسجيل الدخول بنجاح",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        print("success");
      });

      await CacheHelper.saveData(
        key: "token",
        value: loginResponseModel!.token,
      ).then((value) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LayoutView(),
          ),
        );
      });
    }).catchError((error) {
      setState(() {
        loginState = "error";
        Fluttertoast.showToast(
          msg: "خطأ، برجاء المحاولة مره اخري",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        print("error");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0),
                    Center(
                      child: Image.asset(
                        "assets/images/benha_logo.png",
                        width: MediaQuery.sizeOf(context).width / 3,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "الدراسات العليا",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF57B4D7),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80.0),
                    const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
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
                        hintText: "الايميل الاكاديمي",
                      ),
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يجب ادخال الايميل الجامعي';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14.0),
                    TextFormField(
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
                        hintText: "كلمة السر",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            !_obscureText
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                      ),
                      controller: _passwordController,
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يجب ادخال كلمه السر';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 24.0),
                    if (loginState == "loading") ...{
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.symmetric(horizontal: 45.0),
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0XFF57B4D7).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                    } else ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              login();
                            }
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
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    },
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
