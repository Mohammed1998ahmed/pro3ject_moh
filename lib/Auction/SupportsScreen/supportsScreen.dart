import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/SupportsScreen/cubit/supports_cubit.dart';
import 'package:thi/Auction/SupportsScreen/responsed.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

// class SportScreen extends StatefulWidget {
//   const SportScreen({Key? key}) : super(key: key);

//   @override
//   State<SportScreen> createState() => _SportScreenState();
// }

class SportScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportsCubit(),
      child: BlocConsumer<SupportsCubit, SupportsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = SupportsCubit.getObject(context);
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  centerTitle: true,
                  // toolbarHeight: 80,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: text(
                      title: 'Supports',
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Color0),
                  actions: [
                    IconButton(
                        onPressed: () {
                          // ResponsSupports
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  ResponsSupports(),
                            ),
                          );
                        },
                        icon: Icon(Icons.notification_important))
                  ],
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Divider(
                          color: Color0,
                        ),
                        Center(
                          child: Container(
                            width: 270,
                            height: 273,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/img_18.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.080,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color0,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
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
                                suffixIcon: Icon(Icons.email),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontFamily: 'Caveat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color5,
                                ),
                                hintText:
                                    "example@example.com", // تغيير نص التلميح لصيغة البريد الإلكتروني
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.080,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color0,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone';
                                }
                                // تحقق من صيغة البريد الإلكتروني باستخدام تعبير منتظم
                                // final emailRegex = RegExp(
                                //     r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                // if (!emailRegex.hasMatch(value)) {
                                //   return "Please enter a valid email address.";
                                // }
                                return null;
                              },

                              keyboardType: TextInputType
                                  .phone, // تغيير نوع لوحة المفاتيح إلى البريد الإلكتروني
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.phone),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontFamily: 'Caveat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color5,
                                ),
                                hintText:
                                    "0999999999999", // تغيير نص التلميح لصيغة البريد الإلكتروني
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: text(
                            title: 'Write a message',
                            color: Color0,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                            margin: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: massageController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Massage';
                                }
                                // تحقق من صيغة البريد الإلكتروني باستخدام تعبير منتظم
                                // final emailRegex = RegExp(
                                //     r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                // if (!emailRegex.hasMatch(value)) {
                                //   return "Please enter a valid email address.";
                                // }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // labelText: "Ticket Form",

                                  hintText:
                                      'Please, can you help me??\nI have a problem to login into my account....',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Caveat',
                                    fontWeight: FontWeight.w600,
                                    // height: 0,
                                  ),
                                  fillColor: Colors.white,
                                  alignLabelWithHint: false,
                                  filled: true),
                              keyboardType: TextInputType.multiline,
                              maxLines: 6,
                              textInputAction: TextInputAction.done,
                            )),
                        cubit.isload
                            ? SpinkitWave()
                            : Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(311, 44),
                                        backgroundColor: Color0,
                                        elevation: 1,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ))),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        cubit.chingLoading(true);
                                        cubit.postSupport(
                                            email: emailController.text,
                                            phone: phoneController.text,
                                            massage: massageController.text);
                                        if (state is SupportsSueccessfluy) {
                                          emailController.clear();
                                          phoneController.clear();
                                          massageController.clear();
                                        }
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'Send ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Caveat',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
                // bottomNavigationBar: CurvedNavigationBar(
                //   index: 2,
                //   height: 75.0,
                //   items: <Widget>[
                //     const Icon(
                //       Icons.home_outlined,
                //       size: 30,
                //       color: Colors.grey,
                //     ),
                //     const Icon(
                //       Icons.location_on_outlined,
                //       size: 30,
                //       color: Colors.grey,
                //     ),
                //     const Icon(Icons.chat_rounded, size: 30, color: Colors.black),
                //     Image.asset(
                //       'assets/images/img_6.png',
                //       height: 25,
                //       width: 25,
                //     ),
                //     Image.asset(
                //       'assets/images/img_7.png',
                //       height: 25,
                //       width: 25,
                //     ),
                //   ],
                //   color: navBarColor,
                //   buttonBackgroundColor: secondaryColor,
                //   backgroundColor: Colors.white,
                //   animationCurve: Curves.easeInOut,
                //   animationDuration: const Duration(milliseconds: 600),
                //   onTap: (index) {
                //     setState(() {
                //       //  _page = index;
                //       print(index);
                //     });
                //   },
                //   letIndexChange: (index) => false,
                // ),
              ),
            ),
          );
        },
      ),
    );
  }
}
