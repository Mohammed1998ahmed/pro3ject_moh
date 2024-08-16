import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/Reservations/Booking/cubit/booking_cubit.dart';
import 'package:thi/Reservations/Booking/specialists.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

// class Service extends StatefulWidget {

//   @override
//   State<Service> createState() => _ServiceState();
// }

class Service extends StatelessWidget {
  Service({super.key, required this.Idcubit});
  final int? Idcubit;
  @override
  Widget build(BuildContext context) {
    print(Idcubit.toString() + "MMMMMMMMMMMMMMMMMM");
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => BookingCubit()..getDataServic(Idcubit!),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BookingCubit.getObject(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.fill),
                // borderRadius: BorderRadius.circular(10),
              ),
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
                  SizedBox(
                    height: Height * 0.01,
                  ),
                  text(title: "Select Service", color: Color0),
                  cubit.getServicClubModel == null
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
                                cubit.getServicClubModel!.services!.length,
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            // قم بتعيين عدد عناصر القائمة الخاصة بك
                            itemBuilder: (context, index) {
                              // ignore: unused_local_variable
                              bool isChecked =
                                  false; // تحديد حالة التحديد بقيمة افتراضية
                              if (cubit.checkedItems.length < index + 1) {
                                cubit.checkedItems.add(
                                    false); // إضافة قيمة افتراضية للتحديد إذا لم يتم تعريفها بعد
                              }
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
                                              cubit.getServicClubModel!
                                                  .services![index].image!,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: text(
                                  title: cubit.getServicClubModel!
                                      .services![index].name!,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Color0,
                                ),
                                subtitle: text(
                                  title: cubit.getServicClubModel!
                                      .services![index].description!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(3, 2, 3, 1),
                                ),
                                trailing: Checkbox(
                                  value: cubit.checkedItems[index],
                                  onChanged: (bool? value) {
                                    cubit.chaingcheckedItems(
                                        value,
                                        index,
                                        cubit.getServicClubModel!
                                            .services![index].id!);
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

                        if (cubit.isclick ?? false) {
                          print(cubit.idServic.toString() +
                              "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Specislists(
                                IdClub: Idcubit!,
                                IdService: cubit.idServic!,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
