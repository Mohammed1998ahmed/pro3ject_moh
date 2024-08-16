import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/BookingandAppointment/cubit/booking_cubit.dart';
import 'package:thi/profile/BookingandAppointment/selectTepyBooking.dart';

class DatailsFullCours extends StatelessWidget {
  const DatailsFullCours({super.key, required this.id_Club});
  final int id_Club;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookingCubit()..getDatagetListCoursBooking(id_Club: id_Club),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is BookingDeleteCoursClubsSueccfuly) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => SelectTypeBooking(),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BookingCubit.getObject(context);

          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: cubit.getListCoursBooking == null
                  ? Center(child: SpinkitWave())
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.19,
                                decoration: BoxDecoration(
                                    color: Color0,
                                    borderRadius: BorderRadius.circular(15.0)),
                                alignment: Alignment.center,
                                child: text(
                                    title: "${index + 1}",
                                    color: Color3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                        title: cubit.getListCoursBooking!
                                            .reservations![index].clas
                                            .toString(),
                                        color: Color0,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    Row(
                                      children: [
                                        text(
                                            title: "number_of_people: ",
                                            color: Color4),
                                        text(
                                            title: cubit
                                                .getListCoursBooking!
                                                .reservations![index]
                                                .numberOfPeople
                                                .toString(),
                                            color: Color4),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.009,
                                    ),

                                    Row(
                                      children: [
                                        text(
                                            title: "begin Time: ",
                                            color: Color4),
                                        text(
                                            title: cubit
                                                .getListCoursBooking!
                                                .reservations![index]
                                                .course!
                                                .begin
                                                .toString(),
                                            color: Color4),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.005,
                                    ),

                                    Row(
                                      children: [
                                        text(
                                            title: "End Time: ", color: Color4),
                                        text(
                                            title: cubit
                                                .getListCoursBooking!
                                                .reservations![index]
                                                .course!
                                                .end
                                                .toString(),
                                            color: Color4),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.009,
                                    ),

                                    Row(
                                      children: [
                                        text(title: "Price: ", color: Color4),
                                        text(
                                            title: cubit.getListCoursBooking!
                                                .reservations![index].price
                                                .toString(),
                                            color: Color4),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Spacer(),
                                    //     text(
                                    //         title: cubit.getListCoursBooking!
                                    //             .reservations![index].price
                                    //             .toString(),
                                    //         color: Color4),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      barrierColor:
                                          Color.fromRGBO(71, 181, 255, 0.575),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Text('Delete Confirmation'),
                                          content: Text(
                                              'Are you sure you want to delete?'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              onPressed: () {
                                                // Perform delete operation here
                                                // Navigator.of(context).pop();
                                                cubit.DeletDatagetListCoursBooking(
                                                    context: context,
                                                    id_Cours: cubit
                                                        .getListCoursBooking!
                                                        .reservations![index]
                                                        .id!,
                                                    id_Club:
                                                        id_Club); // Add your delete logic here
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: text(title: "delete", color: Color0))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount:
                          cubit.getListCoursBooking!.reservations!.length),
            ),
          );
        },
      ),
    );
  }
}
