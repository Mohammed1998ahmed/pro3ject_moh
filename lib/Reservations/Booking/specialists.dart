import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/Reservations/Booking/cubit/booking_cubit.dart';
import 'package:thi/Reservations/Booking/seleectBooking.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

// class Specislists extends StatefulWidget {

//   @override
//   State<Specislists> createState() => _SpecislistsState();
// }

// ignore: must_be_immutable
class Specislists extends StatelessWidget {
  Specislists({
    super.key,
    required this.IdClub,
    required this.IdService,
  });
  // final HomeStableCubit cubit;
  final int IdClub;
  final int IdService;

  List category = [
    {
      "image": "assets/images/img_10.png",
      "text": "Ability &",
    },
    {"image": "assets/images/img_11.png", "text": "Flat race"},
    {"image": "assets/images/img_12.png", "text": "Show horse"},
    {"image": "assets/images/img_13.png", "text": "Pony"},
    {
      "image": "assets/images/img_14.png",
      "text": "Race",
    },
  ];
  // bool isclick = false;
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => BookingCubit()..getDataTrinner(IdService),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BookingCubit.getObject(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imageBackground,
                      ),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color0,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: text(
                      title: 'Book Appointment',
                      color: Color0,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    toolbarHeight: 30,
                  ),
                  SizedBox(
                    height: Height * 0.02,
                  ),
                  Center(
                    child: Container(
                      width: Width * 0.7,
                      height: Height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Service 24_7-amico.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: text(
                      title: 'Select specialist',
                      color: Color0,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cubit.getTrinnerClubModel == null
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: SpinkitWave(),
                        ))
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.44,
                          child: ListView.separated(
                            itemCount:
                                cubit.getTrinnerClubModel!.trainers!.length,
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            // قم بتعيين عدد عناصر القائمة الخاصة بك
                            itemBuilder: (context, i) {
                              // ignore: unused_local_variable
                              bool isChecked = (cubit.selectedItemId == i);
                              // bool isChecked = false; // تحديد حالة التحديد بقيمة افتراضية
                              // if (checkedItems.length < index + 1) {
                              //   checkedItems.add(
                              //       false); // إضافة قيمة افتراضية للتحديد إذا لم يتم تعريفها بعد
                              // }
                              return ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color0.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 10.0,
                                        offset: Offset(-1, 6),
                                      ),
                                    ],
                                    image: DecorationImage(
                                        scale: 1,
                                        image: NetworkImage(
                                          ImagesPath +
                                              cubit.getTrinnerClubModel!
                                                  .trainers![i].image
                                                  .toString(),
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: text(
                                  title: cubit
                                      .getTrinnerClubModel!.trainers![i].fName!,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Color0,
                                ),
                                subtitle: text(
                                  title: cubit.getTrinnerClubModel!.trainers![i]
                                      .qualifications!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(3, 2, 3, 1),
                                ),
                                trailing: Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    cubit.ChickBoxTrinner(
                                        value,
                                        i,
                                        cubit.getTrinnerClubModel!.trainers![i]
                                            .pivot!.trainerId!);
                                  },
                                ),
                                onTap: () {
                                  // تنفيذ الإجراء عند النقر على السطر
                                  print('تم النقر على السطر');
                                },
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: Height * 0.01,
                  ),
                  ButtonStaic(
                      onTap: () {
                        // يتم تنفيذ هذا الكود عند النقر على الزر

                        if (cubit.isclick1 ?? false) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => SeleectBooking(
                                Idclub: IdClub,
                                IdServic: IdService,
                                Idtrinner: cubit.idTrinner!,
                              ),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Select to move on to the next step",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        print('تم النقر على الزر!');
                      },
                      title: "Next",
                      context: context),
                  // Container(
                  //   height: Height * 0.480,
                  //   child: ListView.builder(
                  //     itemBuilder: (_, i) {
                  //       bool isChecked = (selectedItemId ==
                  //           i); // تحديد حالة التحديد بناءً على العنصر المحدد

                  //       return Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border: Border.all(color: Color0, width: 3),
                  //           ),
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 height: Height * 0.093,
                  //                 width: Width * 0.193,
                  //                 padding: const EdgeInsets.all(3),
                  //                 margin: const EdgeInsets.symmetric(
                  //                     horizontal: 6, vertical: 15),
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.white,
                  //                   shape: BoxShape.circle,
                  //                   border: Border.all(color: Color0),
                  //                 ),
                  //                 child: CircleAvatar(
                  //                   backgroundImage:
                  //                       AssetImage('assets/images/img_16.png'),
                  //                 ),
                  //               ),
                  //               text(
                  //                 title: category[i]['text'],
                  //                 fontSize: 13,
                  //               ),
                  //               Spacer(),
                  //               Checkbox(
                  //                 value: isChecked,
                  // onChanged: (bool? value) {
                  //   setState(() {
                  //     if (value != null && value) {
                  //       selectedItemId = i;
                  //       // تحديث العنصر المحدد إلى العنصر الحالي

                  //       Navigator.push<void>(
                  //         context,
                  //         MaterialPageRoute<void>(
                  //           builder: (BuildContext context) =>
                  //               DataBooking(),
                  //         ),
                  //       );
                  //     } else {
                  //       selectedItemId =
                  //           -1; // إلغاء تحديد العنصر إذا تم إلغاء تحديد الـ checkBox
                  //     }
                  //   });
                  // },
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     itemCount: category.length,
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
