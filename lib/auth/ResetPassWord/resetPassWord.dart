// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/auth/ResetPassWord/cubit/reset_pass_word_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class ResetPassWord extends StatelessWidget {
  ResetPassWord({Key? key}) : super(key: key);
  final String flag = '🇦🇪';
  final String callingCode = '+971';
  final keyForm = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController codeEmail = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController conf_passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ResetPassWordCubit();
      },
      child: BlocConsumer<ResetPassWordCubit, ResetPassWordState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ResetPassWordCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
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
                                          'assets/images/Forgot password-cuate.png',
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
                                      hintText: "Email",
                                      controller: emailController,
                                      messageForm: "Pleas Enter Email",
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(
                                      height: height * 0.0150,
                                    ),
                                    TextFieldWidght(
                                      context: context,
                                      hintText: "Probe Code",
                                      controller: codeEmail,
                                      messageForm: "Pleas Enter Probe Code",
                                      keyboardType: TextInputType.phone,
                                    ),
                                    SizedBox(
                                      height: height * 0.0150,
                                    ),
                                    TextFieldWidght(
                                      context: context,
                                      hintText: "PassWord",
                                      controller: passWord,
                                      messageForm: "Pleas Enter Email",
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(
                                      height: height * 0.0150,
                                    ),
                                    TextFieldWidght(
                                      context: context,
                                      hintText: "Password_confirmation",
                                      controller: conf_passWord,
                                      messageForm:
                                          "Pleas Enter Password_confirmation",
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(
                                      height: height * 0.0150,
                                    ),
                                    SizedBox(
                                      height: height * 0.150,
                                    ),
                                    cubit.isLoad
                                        ? SpinkitWave()
                                        : ButtonStaic(
                                            onTap: () {
                                              // يتم تنفيذ هذا الكود عند النقر على الزر
                                              if (keyForm.currentState!
                                                  .validate()) {
                                                cubit.chaingLoaging(true);
                                                cubit.postResetPassWord(
                                                    email: emailController.text,
                                                    codeEmail: codeEmail.text,
                                                    passWord: passWord.text,
                                                    conf_PassWord:
                                                        conf_passWord.text,
                                                    context: context);
                                                // إذا كانت جميع الحقول صحيحة
                                                // يمكنك تنفيذ الإجراء المطلوب هنا، مثل تسجيل الدخول
                                                print('Login successful');
                                              }

                                              print('تم النقر على الزر!');
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
            ),
          );
        },
      ),
    );
  }
}
