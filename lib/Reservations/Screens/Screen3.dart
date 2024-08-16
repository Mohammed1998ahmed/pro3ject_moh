import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Reservations/Details_Club/cubit/home_stable_cubit.dart';
import 'package:thi/component/conset/Const.dart';

class Screen3 extends StatelessWidget {
  final HomeStableCubit cubit;

  Screen3({super.key, required this.cubit});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeStableCubit(),
      child: BlocConsumer<HomeStableCubit, HomeStableState>(
        listener: (context, state) {},
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Scaffold(
            body: Container(
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(71, 181, 255, 0.623), // اللون الأصلي
                    Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // يمنع التمرير العمودي

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عدد الأعمدة في الشبكة
                  ),
                  itemCount: cubit.clubIDModel!.images!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                height: height * 0.60,
                                child: Column(
                                  //mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: height * 0.60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                ImagesPath +
                                                    cubit.clubIDModel!
                                                        .images![index],
                                              ),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width * 0.3,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    ImagesPath +
                                        cubit.clubIDModel!.images![index],
                                  ),
                                  fit: BoxFit.cover)),
                          clipBehavior: Clip.antiAlias,

                          // child: Image.network(
                          //   ImagesPath +
                          //       cubit.clubProfileGetModel!.images![index],
                          //   fit: BoxFit.cover,
                          //   width: width * 0.3,
                          //   height: height * 0.1,
                          // ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
