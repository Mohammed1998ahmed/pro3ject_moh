import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:image_picker/image_picker.dart';
import 'package:thi/auth/Login/login.dart';
import 'package:thi/auth/Register/cubit/register_cubit.dart';
import 'package:thi/auth/verifaction/verifaction.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

// class Register extends StatefulWidget {
//   Register({Key? key}) : super(key: key);

//   @override
//   State<Register> createState() => _RegisterState();
// }

// ignore: must_be_immutable
class Register extends StatelessWidget {
  // ignore: unused_field
  TextEditingController _emailController = TextEditingController();

  // ignore: unused_field
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  // ignore: unused_field
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _conf_passwordController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  final String flag = '🇦🇪';
  final keyForm = GlobalKey<FormState>();

  final String callingCode = '+971';
  File? selectedImage;
  int selectedValue = 1;
  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedImage != null) {
  //     setState(() {
  //       _selectedImage = File(pickedImage.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RegisterCubit();
      },
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSeccsfully) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    ForgotPasswordVerificationPage(
                  email: _emailController.text,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = RegisterCubit.getObject(context);
          // ignore: unused_local_variable
          File? imageFile;
          return Container(
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
                    color: Color2,
                  ),
                ),
              ),
              body: Container(
                child: SingleChildScrollView(
                  child: Form(
                    key: keyForm,
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ImageRegister(),
                                text(
                                    title: "Register",
                                    color: Color6,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: text(
                                      title: "You are welcome",
                                      textAlign: TextAlign.center,
                                      color: Color2,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Center(
                                        child: imageProfile(cubit),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                      Row(
                                        children: [
                                          TextFieldWidght(
                                            widthC: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            controller: _nameController,
                                            context: context,
                                            hintText: "Name",
                                            messageForm:
                                                'Please enter your Name',
                                            keyboardType: TextInputType.name,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.019,
                                          ),
                                          TextFieldWidght(
                                            widthC: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            controller: _lnameController,
                                            context: context,
                                            hintText: "Last Name",
                                            messageForm:
                                                'Please enter your Last Name',
                                            keyboardType: TextInputType.name,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.90,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.080,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color0,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _emailController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your email';
                                              }
                                              // تحقق من صيغة البريد الإلكتروني باستخدام تعبير منتظم
                                              final emailRegex = RegExp(
                                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                              if (!emailRegex.hasMatch(value)) {
                                                return "Please enter a valid email address.";
                                              }
                                              return null;
                                            },

                                            keyboardType: TextInputType
                                                .emailAddress, // تغيير نوع لوحة المفاتيح إلى البريد الإلكتروني
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                fontFamily: 'Caveat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color5,
                                              ),
                                              hintText:
                                                  "example@example.com", // تغيير نص التلميح لصيغة البريد الإلكتروني
                                            ),
                                          ),
                                        ),
                                      ),
                                      // TextFieldWidght(
                                      //   controller: _emailController,
                                      //   context: context,
                                      //   hintText: "Email",
                                      //   messageForm: 'Please enter your Email',
                                      //   keyboardType: TextInputType.emailAddress,
                                      // ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                      Row(
                                        children: [
                                          TextFieldWidght(
                                            widthC: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            controller: _passwordController,
                                            context: context,
                                            hintText: "PassWord",
                                            messageForm:
                                                'Please enter your PassWord',
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.019,
                                          ),
                                          TextFieldWidght(
                                            widthC: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            controller:
                                                _conf_passwordController,
                                            context: context,
                                            hintText: "password_confirmation",
                                            messageForm:
                                                'Please enter your password_confirmation',
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                      TextFieldWidght(
                                        controller: _phoneController,
                                        context: context,
                                        hintText: "phone",
                                        messageForm: 'Please enter your phone',
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                      Row(
                                        children: [
                                          TextFieldWidght(
                                            widthC: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            controller: _addressController,
                                            context: context,
                                            hintText: "address",
                                            messageForm:
                                                'Please enter your address',
                                            keyboardType:
                                                TextInputType.streetAddress,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.019,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.080,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color0,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 0.0),
                                              child: TextFormField(
                                                controller: _dateController,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter your Date';
                                                  }
                                                  // تحقق من صيغة تاريخ الميلاد باستخدام تعبير منتظم
                                                  final dateRegex = RegExp(
                                                      r'^\d{4}-\d{1,2}-\d{1,2}$');
                                                  if (!dateRegex
                                                      .hasMatch(value)) {
                                                    return 'Please enter a valid date in the format (yyyy-MM-dd).';
                                                  }
                                                  return null;
                                                },
                                                keyboardType: TextInputType
                                                    .datetime, // تغيير نوع لوحة المفاتيح إلى التاريخ والوقت
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'Caveat',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color5,
                                                  ),
                                                  hintText:
                                                      "yyyy-MM-dd", // تغيير نص التلميح لصيغة تاريخ الميلاد
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                      text(
                                        title: "Gender",
                                        fontSize: 18,
                                        color: Color0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.70,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 100,
                                              // أو Flexible
                                              child: RadioListTile(
                                                contentPadding: EdgeInsets.zero,
                                                activeColor: Color0,
                                                // tileColor: Colors.red,

                                                title: text(
                                                  title: 'Male',
                                                  fontSize: 16,
                                                  color: Color4,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                value: 1,
                                                groupValue: cubit.selectedValue,
                                                onChanged: (int? value) {
                                                  cubit.chaingSelectValue(
                                                      value!);
                                                  cubit.SelectGender("Male");
                                                  // setState(() {
                                                  //   selectedValue = value as int;
                                                  // });
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              // أو Flexible
                                              child: RadioListTile(
                                                contentPadding: EdgeInsets.zero,
                                                activeColor: Color0,
                                                title: text(
                                                  title: 'Woman',
                                                  fontSize: 16,
                                                  color: Color4,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                value: 2,
                                                // contentPadding: EdgeInsets.zero,
                                                groupValue: cubit.selectedValue,
                                                onChanged: (value) {
                                                  cubit.chaingSelectValue(
                                                      value!);
                                                  cubit.SelectGender("Woman");
                                                  // setState(() {
                                                  //   selectedValue = value as int;
                                                  // });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.0010,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 30.0),
                                //   child: Row(
                                //     children: [
                                //       TextButton(
                                //         onPressed: () {},
                                //         child: text(
                                //             title: "Terms and Conditions",
                                //             textAlign: TextAlign.center,
                                //             color: Color0,
                                //             fontSize: 14,
                                //             fontWeight: FontWeight.w700),
                                //       ),
                                //       Spacer()
                                //     ],
                                //   ),
                                // ),
                                cubit.isload
                                    ? SpinkitWave()
                                    : ButtonStaic(
                                        context: context,
                                        onTap: () {
                                          // print(selectedImage!.path.toString() +
                                          //     "LLLLLLLLLLLLLLLLLLLLLLLl");
                                          if (keyForm.currentState!
                                              .validate()) {
                                            if (selectedImage != null) {
                                              cubit.chingLoading(true);
                                              cubit.postReister(
                                                  imageFile: selectedImage!,
                                                  LName: _lnameController.text,
                                                  address:
                                                      _addressController.text,
                                                  birth: _dateController.text,
                                                  gender: cubit.selectGender,
                                                  Email: _emailController.text,
                                                  Name: _nameController.text,
                                                  PassWord:
                                                      _passwordController.text,
                                                  Conf_PassWord:
                                                      _conf_passwordController
                                                          .text,
                                                  Phone: _phoneController.text,
                                                  context: context);
                                            }
                                          }
                                          // يتم تنفيذ هذا الكود عند النقر على الزر

                                          print('تم النقر على الزر!');
                                        },
                                        title: "Next",
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      text(
                                        title: "Already have an account?",
                                        color: Color2,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        LoginW(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(71, 181, 255,
                                                      1), // اللون الأصلي
                                                  Color.fromRGBO(199, 255, 255,
                                                      1), // اللون المتناسق
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: Center(
                                              child: text(
                                                title: "Sign in",
                                                color: Color3,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
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

  Stack imageProfile(RegisterCubit cubit) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 70.0,
          backgroundColor: Color.fromRGBO(108, 196, 255, 0.773),
          backgroundImage:
              cubit.imageFile1 != null ? FileImage(cubit.imageFile1!) : null,
        ),
        GestureDetector(
          onTap: () async {
            final picker = ImagePicker();
            final pickedImage =
                await picker.pickImage(source: ImageSource.gallery);

            if (pickedImage != null) {
              selectedImage = File(pickedImage.path);
              cubit.imagepath(selectedImage!);
            }

            // print(selectedImage.toString() + "kKKKKKKKKKKKKKKKKKKKKKKKKK");
            // _pickImage();
          },
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Color0,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}

class ImageRegister extends StatelessWidget {
  const ImageRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.28,
        child: Image.asset(
          'assets/images/Sign up-cuate.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
