import 'package:flutter/material.dart';
import 'package:thi/Reservations/Booking/Course/getCoursList.dart';
import 'package:thi/Reservations/Booking/Data.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class SeleectBooking extends StatelessWidget {
  const SeleectBooking(
      {Key? key,
      required this.Idtrinner,
      required this.Idclub,
      required this.IdServic})
      : super(key: key);

  final int Idclub;
  final int IdServic;
  final int Idtrinner;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                imageBackground,
              ),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonStaic(
              onTap: () {
                // يتم تنفيذ هذا الكود عند النقر على الزر

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => DataBooking(
                      Idclub: Idclub,
                      IdServic: IdServic,
                      Idtrinner: Idtrinner,
                    ),
                  ),
                );

                print('تم النقر على الزر!');
              },
              title: "Individual Booking",
              context: context),
          SizedBox(
            height: 20,
          ),
          ButtonStaic(
              onTap: () {
                // يتم تنفيذ هذا الكود عند النقر على الزر

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => GetCoursList(
                      Idclub: Idclub,
                      IdServic: IdServic,
                      Idtrinner: Idtrinner,
                    ),
                  ),
                );

                print('تم النقر على الزر!');
              },
              title: "Full Course",
              context: context),
        ],
      ),
    ));
  }
}
