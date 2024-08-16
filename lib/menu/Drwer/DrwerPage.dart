import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/Home2/Homeee.dart';
import 'package:thi/Health%20care/mainScreen/mainscrenn.dart';
import 'package:thi/Reservations/Home/main_screen.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/menu/Drwer/cubit/drwer_cubit.dart';

class DrwerPage extends StatelessWidget {
  const DrwerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => DrwerCubit(),
      child: BlocConsumer<DrwerCubit, DrwerState>(
        listener: (context, state) {},
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = DrwerCubit.getObject(context);
          return Scaffold(
              body: Stack(
            children: [
              backgroundImage(),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    ImageSecreen(),
                    SizedBox(
                      height: Height * 0.02,
                    ),
                    text(
                        title: "CHOOSE YOUR SERVICE",
                        color: Color0,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetectorButton(
                            context: context,
                            Height: Height * 0.20,
                            Width: Width * 0.46,
                            title: "Appointment Horse",
                            ImageString: "assets/images/horse race-cuate.png",
                            builder: (BuildContext) {
                              return MainScreen();
                            }),
                        SizedBox(
                          height: Height * 0.010,
                        ),
                        GestureDetectorButton(
                            context: context,
                            Height: Height * 0.20,
                            Width: Width * 0.46,
                            title: "Auction",
                            ImageString:
                                "assets/images/Horseback riding-pana.png",
                            builder: (BuildContext) {
                              return MainScreen2();
                            }),
                      ],
                    ),
                    SizedBox(
                      height: Height * 0.010,
                    ),
                    GestureDetectorButton(
                        context: context,
                        Height: Height * 0.20,
                        Width: Width * 0.98,
                        title: " Healthcare ",
                        ImageString: "assets/images/Medical research-pana.png",
                        builder: (BuildContext) {
                          return MainScreenheLTH();
                        }),
                    SizedBox(
                      height: Height * 0.055,
                    ),
                    text(
                        title: "@ Melenuim 2023. All rights reserved.",
                        color: Color2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ]),
                ),
              )
            ],
          ));
        },
      ),
    );
  }

  GestureDetector GestureDetectorButton(
      {required BuildContext context,
      required double Width,
      required double Height,
      required String title,
      required String ImageString,
      required Widget Function(BuildContext) builder}) {
    return GestureDetector(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: builder,
          ),
        );
      },
      child: Container(
        width: Width,
        height: Height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color0,
            image: DecorationImage(image: AssetImage(ImageString))),
        alignment: Alignment.topCenter,
        child: text(
            title: title,
            textAlign: TextAlign.center,
            color: Color4,
            fontSize: 18,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

class backgroundImage extends StatelessWidget {
  const backgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageBackground,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}

class ImageSecreen extends StatelessWidget {
  const ImageSecreen({
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
          'assets/images/Choose-amico.png',
        ),
      ),
    );
  }
}
