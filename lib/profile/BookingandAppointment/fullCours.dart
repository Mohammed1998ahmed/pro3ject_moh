// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/auth/Login/login.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/BookingandAppointment/Datails/DatailsfullCours.dart';

import 'cubit/booking_cubit.dart';

class FullCoursBooking extends StatelessWidget {
  FullCoursBooking({super.key});
  bool shimmer = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => BookingCubit()..getDataListCoursBooking(),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BookingCubit.getObject(context);
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imageBackground))),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Color0),
                  backgroundColor: Colors.transparent,
                  title: text(title: "Group booking", color: Color0),
                ),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.99,
                  child: cubit.getCoursClubs == null
                      ? ListView.builder(
                          itemBuilder: (BuildContext, int) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: ShimerWidght(
                                  width: width * 0.2,
                                  height: height * 0.3,
                                  reduis: 10,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30, bottom: 6),
                                  child: ShimerWidght(
                                    width: width * 0.02,
                                    height: height * 0.03,
                                  ),
                                ),
                                trailing: ShimerWidght(
                                  width: width * 0.2,
                                  height: height * 0.05,
                                  reduis: 30,
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        )
                      : cubit.getCoursClubs!.clubs == null
                          ? Container()
                          : ListView.separated(
                              itemCount: cubit.getCoursClubs!.clubs!.length,
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              // قم بتعيين عدد عناصر القائمة الخاصة بك
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            LoginW(),
                                      ),
                                    );
                                    print("objectvvvv");
                                  },
                                  child: ListTile(
                                    leading: Container(
                                      width: 70,
                                      // height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color0.withOpacity(0.5),
                                            spreadRadius: 2.0,
                                            blurRadius: 10.0,
                                            offset: Offset(-1, 6),
                                          ),
                                        ],
                                        image: DecorationImage(
                                            // scale: 30,
                                            image: NetworkImage(
                                              ImagesPath +
                                                  cubit.getCoursClubs!
                                                      .clubs![index].profile
                                                      .toString(),
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: text(
                                        title: cubit
                                            .getCoursClubs!.clubs![index].name
                                            .toString(),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(3, 2, 3, 1),
                                      ),
                                    ),
                                    trailing: Container(
                                      // width: 50,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        DatailsFullCours(
                                                  id_Club: cubit.getCoursClubs!
                                                      .clubs![index].id!,
                                                ),
                                              ),
                                            );
                                            print("object");
                                          },
                                          child: text(
                                              title: "details", color: Color0)),
                                    ),
                                    onTap: () {
                                      // تنفيذ الإجراء عند النقر على السطر
                                      print('تم النقر على السطر');
                                    },
                                  ),
                                );
                              },
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
