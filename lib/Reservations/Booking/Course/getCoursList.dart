import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Reservations/Booking/Course/classTime.dart';
import 'package:thi/Reservations/Booking/Course/cubit/cours_booking_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class GetCoursList extends StatelessWidget {
  GetCoursList(
      {super.key,
      required this.Idclub,
      required this.IdServic,
      required this.Idtrinner});
  final int Idclub;
  final int IdServic;
  final int Idtrinner;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursBookingCubit()
        ..postCoursDataAddBookingModel(
            club_ID: Idclub, service_id: IdServic, trainer_id: Idtrinner),
      child: BlocConsumer<CoursBookingCubit, CoursBookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = CoursBookingCubit.getObject(context);
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imageBackground,
                    ),
                    fit: BoxFit.fill)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              // drawerScrimColor: Colors.amber,
              appBar: AppBar(
                backgroundColor: Colors.transparent,

                // foregroundColor: Colors.transparent,
                // backgroundColor: Color.fromRGBO(71, 181, 255, 0.5),
                title: text(
                    title: "Choose a course",
                    color: Color0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(top: 20),
                  child: cubit.getCourceModel == null
                      ? Center(child: SpinkitWave())
                      : ListView.separated(
                          itemCount: cubit.getCourceModel!.courses!.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  print("Cours");
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          ClassTime(
                                        Cours_id: cubit
                                            .getCourceModel!.courses![index].id,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                      color: Color0,
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            text(
                                                title: "description  :   ",
                                                color: Color3),
                                            text(
                                                title: cubit.getCourceModel!
                                                    .courses![index].description
                                                    .toString(),
                                                color: Color3),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Divider(
                                          color: Color4,
                                        ),
                                        Row(
                                          children: [
                                            text(
                                                title:
                                                    "Number of days of the course  :   ",
                                                color: Color3),
                                            text(
                                                title: cubit
                                                        .getCourceModel!
                                                        .courses![index]
                                                        .duration
                                                        .toString() +
                                                    " days",
                                                color: Color3),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Divider(
                                          color: Color4,
                                        ),
                                        Row(
                                          children: [
                                            text(
                                                title: "Start Date  :   ",
                                                color: Color3),
                                            text(
                                                title: cubit.getCourceModel!
                                                    .courses![index].begin
                                                    .toString(),
                                                color: Color3),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Divider(
                                          color: Color4,
                                        ),
                                        Row(
                                          children: [
                                            text(
                                                title: "End Date  :   ",
                                                color: Color3),
                                            text(
                                                title: cubit.getCourceModel!
                                                    .courses![index].end
                                                    .toString(),
                                                color: Color3),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Divider(
                                          color: Color4,
                                        ),
                                        Row(
                                          children: [
                                            text(
                                                title: " Days :   ",
                                                color: Color3),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: cubit
                                                      .getCourceModel!
                                                      .courses![index]
                                                      .days!
                                                      .length,
                                                  itemBuilder:
                                                      (context, indexdays) {
                                                    return text(
                                                        title: cubit
                                                                .getCourceModel!
                                                                .courses![index]
                                                                .days![
                                                                    indexdays]
                                                                .toString() +
                                                            "-",
                                                        color: Color3);
                                                  }),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Divider(
                                          color: Color4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
            ),
          );
        },
      ),
    );
  }
}
