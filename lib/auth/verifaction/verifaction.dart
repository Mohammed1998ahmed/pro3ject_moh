// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/flutter_animated_timer_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:otp_text_field/style.dart';
import 'package:thi/auth/verifaction/cubit/verifiaction_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class ForgotPasswordVerificationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String email;
  List<String> otpValues = ['', '', '', '', ''];
  bool iscolor = false;
  int animationDuratio = 10;
  // ignore: unused_field
  bool _pinSuccess = false;
  int startMinutes = 5;
  int startSeconds = 0;
  ForgotPasswordVerificationPage({super.key, required this.email});

  // @override
  // void initState() {
  //   super.initState();
  //   animateTimerController = AnimateTimerController();
  //   // AnimateTimerController().start();
  // }

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    DateTime startTime = DateTime.now()
        .add(Duration(minutes: startMinutes, seconds: startSeconds));
    dynamic otp;
    return BlocProvider(
      create: (context) => VerifiactionCubit(),
      child: BlocConsumer<VerifiactionCubit, VerifiactionState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = VerifiactionCubit.getObject(context);
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
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.28,
                          child: Image.asset(
                            'assets/images/Two factor authentication-rafiki.png',
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  text(
                                      title: "Verification Code",
                                      color: Color2,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: text(
                                        title:
                                            "Enter the verification code that you received via a text message to your phone number",
                                        textAlign: TextAlign.center,
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                  cubit.isload
                                      ? SpinkitWave()
                                      : OTPTextField(
                                          length: 6,
                                          width: 300,

                                          outlineBorderRadius: 10,
                                          fieldWidth: 35,
                                          style: TextStyle(fontSize: 20),
                                          obscureText: true,
                                          textFieldAlignment:
                                              MainAxisAlignment.spaceAround,
                                          // fieldStyle: FieldStyle.underline,
                                          onCompleted: (pin) {
                                            cubit.chaingLoading(true);
                                            print(pin +
                                                "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
                                            cubit.postVerifiaction(
                                                context: context,
                                                Email: email,
                                                Verifiaction: pin);

                                            // c.valueotp(pin);
                                            // setState(() {
                                            //   otp = pin;
                                            //   print(pin.toString() +
                                            //       "****************************************************");
                                            //   _pinSuccess = true;
                                            // });
                                          },
                                          fieldStyle: FieldStyle.box,

                                          // outlineBorderRadius: 20,
                                          spaceBetween: 10,
                                          onChanged: (value) {
                                            print(value);

                                            // setState(() {
                                            //   otpValues = value.split('');
                                            //   iscolor =
                                            //       otpValues.contains('') ? false : true;
                                            //   print(iscolor.toString());
                                            // });
                                          },
                                          otpFieldStyle: OtpFieldStyle(
                                              focusBorderColor: Color0,
                                              backgroundColor: Color.fromRGBO(
                                                  71, 181, 255, 0.658),
                                              disabledBorderColor: Colors.red,
                                              enabledBorderColor: Color4),
                                        ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  AnimateTimer(
                                    animateTimerController:
                                        cubit.animateTimerController,
                                    size: 100,
                                    color: Color0,
                                    animationDuration: 300,
                                    animationBehaviorPreserve: true,
                                  ),
                                  // text(
                                  //     title: animateTimerController
                                  //         .getTimerIconController()
                                  //         .runtimeType
                                  //         .toString(),
                                  //     textAlign: TextAlign.center,
                                  //     color: Color0,
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TimerBuilder.periodic(Duration(seconds: 1),
                                      builder: (context) {
                                    final now = DateTime.now();
                                    final remainingTime =
                                        startTime.difference(now);

                                    if (remainingTime.isNegative) {
                                      return Text("Time's up!");
                                    } else {
                                      String formattedTime =
                                          formatTime(remainingTime.inSeconds);
                                      return text(
                                        title: formattedTime,
                                        fontSize: 30,
                                      );
                                    }
                                  }),
                                  text(
                                    title: "Didn’t you received any code?",
                                    color: Color2,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        cubit.postVerfitionCode(email: email);
                                        cubit.animateTimerController.restart();
                                      },
                                      child: text(
                                          title: "Resend a new code",
                                          color: Color0,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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

String formatTime(int seconds) {
  int minutes = (seconds ~/ 60);
  int remainingSeconds = seconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}
