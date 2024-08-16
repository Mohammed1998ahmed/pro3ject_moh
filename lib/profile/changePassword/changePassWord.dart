// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/auth/Login/login.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/changePassword/cubit/change_pass_word_cubit.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

class ChangPasswordProfileApp extends StatelessWidget {
  ChangPasswordProfileApp({Key? key}) : super(key: key);

  final keyForm = GlobalKey<FormState>();
  TextEditingController oldPassWordController = TextEditingController();
  TextEditingController newPassWordController = TextEditingController();
  TextEditingController conf_PassWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ChangePassWordCubitProfile();
      },
      child: BlocConsumer<ChangePassWordCubitProfile, ChangePassWordState>(
        listener: (context, state) {
          if (state is ChangePassWordSueccsufly) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => LoginW(),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = ChangePassWordCubitProfile.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                iconTheme: IconThemeData(color: Color0),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color0,
                  ),
                ),
              ),
              body: Container(
                width: width,
                height: height,
                child: SingleChildScrollView(
                  child: Form(
                    key: keyForm,
                    child: Column(
                      children: [
                        SafeArea(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Container(
                                      width: width * 0.90,
                                      height: height * 0.28,
                                      child: Image.asset(
                                        'assets/images/Mobile login-bro.png',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      text(
                                          title: "Change password",
                                          color: Color.fromRGBO(35, 0, 44, 1),
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700),
                                      Spacer()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFieldWidght(
                                    context: context,
                                    hintText: "Previous Password",
                                    controller: oldPassWordController,
                                    messageForm: "Pleas Enter Email",
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: height * 0.0150,
                                  ),
                                  TextFieldWidght(
                                    context: context,
                                    hintText: "New Password",
                                    controller: newPassWordController,
                                    messageForm: "Pleas Enter Email",
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: height * 0.0150,
                                  ),
                                  TextFieldWidght(
                                    context: context,
                                    hintText: "password_confirmation",
                                    controller: conf_PassWordController,
                                    messageForm:
                                        "Pleas Enter password_confirmation",
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: height * 0.150,
                                  ),
                                  cubit.isLoad1
                                      ? SpinkitWave()
                                      : ButtonStaic(
                                          onTap: () {
                                            // يتم تنفيذ هذا الكود عند النقر على الزر
                                            if (keyForm.currentState!
                                                .validate()) {
                                              cubit.chaingLoaging1(true);
                                              cubit.ChangPassWord(
                                                  oldPassWord:
                                                      oldPassWordController
                                                          .text,
                                                  newPassWord:
                                                      newPassWordController
                                                          .text,
                                                  conf_PassWord:
                                                      conf_PassWordController
                                                          .text);
                                              // cubit.postEmail(
                                              //     Email: emailController.text,
                                              //     context: context);
                                              // إذا كانت جميع الحقول صحيحة
                                              // يمكنك تنفيذ الإجراء المطلوب هنا، مثل تسجيل الدخول
                                              print('Login successful');
                                            }

                                            print('تم النقر على الزر!' +
                                                "gggggggggggggggggg" +
                                                CachShpreafapp.getdata(
                                                    key: "tokenProfile"));
                                          },
                                          title: "Send Verification Code",
                                          context: context),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
