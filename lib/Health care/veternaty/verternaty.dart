import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thi/Health%20care/veternaty/cubit/verternaty_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class VeterinaryConsultationScreen extends StatefulWidget {
  final int id_HelthCare;

  const VeterinaryConsultationScreen({super.key, required this.id_HelthCare});

  @override
  _VeterinaryConsultationScreenState createState() =>
      _VeterinaryConsultationScreenState();
}

class _VeterinaryConsultationScreenState
    extends State<VeterinaryConsultationScreen> {
  final TextEditingController horseNameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController coatColorController = TextEditingController();
  final TextEditingController currentSymptomsController =
      TextEditingController();
  final TextEditingController questionsController = TextEditingController();
  List<TextEditingController> textControllers = [];
  List<TextEditingController> vaccinationControllers = [];
  List<TextEditingController> TreatmentControllers = [];

  List<TextEditingController> MedicalControllers = [];
  // final TextEditingController vaccinationController = TextEditingController();
  /////////////
  final List<Widget> rows = [];
  final List<TextEditingController> controllers = [];
  DateTime? selectedDate;
  List<DateTime> listSelectedDay = [];
  List<String> Datas = [];
  List<String> DatasT = [];
  List<String> DatasM = [];
  List<Map<String, String>> VaccinationsApi = [];
  List<Map<String, dynamic>> TreamentApi = [];
  List<Map<String, dynamic>> MedicalApi = [];
  final _formKey = GlobalKey<FormState>();

  ////////////////////////
  List<XFile>? selectedImages;
  Future<void> _pickImages() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        selectedImages = images;
      });
    }
  }

  DateTime? _selectedDay;
  String Data = "2024-05-26";
  String DataT = "2024-05-26";
  String DataM = "2024-05-26";

  @override
  void initState() {
    super.initState();
    vaccinationControllers.add(TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in vaccinationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addTextField() {
    setState(() {
      vaccinationControllers.add(TextEditingController());
    });
  }

  void addTextFieldT() {
    setState(() {
      TreatmentControllers.add(TextEditingController());
    });
  }

  void addTextFieldM() {
    setState(() {
      MedicalControllers.add(TextEditingController());
    });
  }

  void addDatas() {
    setState(() {
      Datas.add(Data);
    });
  }

  void addDatasT() {
    setState(() {
      DatasT.add(DataT);
    });
  }

  void addDatasM() {
    setState(() {
      DatasM.add(DataM);
    });
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < Datas.length; i++) {
      print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR" +
          Datas[i].toString() +
          "${Datas.length}(55555555555555555555555555555555555555555555555)");
    }
    for (var i = 0; i < vaccinationControllers.length; i++) {
      print(vaccinationControllers[i].text.toString() + "(999999999999999999)");
    }
    for (var i = 0; i < listSelectedDay.length; i++) {
      print("PPPPPPP" +
          listSelectedDay[i].toString() +
          "${listSelectedDay.length}(8888888888888888888888888888888)");
    }

    for (var i = 0; i < Datas.length; i++) {
      print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR" +
          Datas[i].toString() +
          "${Datas.length}(55555555555555555555555555555555555555555555555)");
    }
    return BlocProvider(
      create: (context) => VerternatyCubit(),
      child: BlocConsumer<VerternatyCubit, VerternatyState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = VerternatyCubit.getObject(context);
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imageBackground))),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'Veterinary Consultation',
                  ),
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: horseNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // تعيين حاشية مستديرة
                            ),
                            labelText: 'Horse Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a horse name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: TextFormField(
                                controller: ageController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // تعيين حاشية مستديرة
                                  ),
                                  labelText: 'Age',
                                ),
                                keyboardType: TextInputType
                                    .number, // تغيير نمط الإدخال إلى رقم

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter an age';
                                  }
                                  // يمكنك إضافة التحققات الإضافية هنا، مثل التحقق من صحة العمر المدخل بشكل رقمي
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.black, // لون الحاشية
                                  width: 1.0, // عرض الحاشية
                                ),
                              ),
                              child: DropdownButton<String>(
                                hint:
                                    text(title: 'Select color', color: Color4),
                                value: cubit.selectedColor,
                                onChanged: (String? newValue) {
                                  // Update the selected value when the choice changes
                                  // selectedColor = newValue!;
                                  cubit.chaingSelectColor(color: newValue!);
                                },
                                items: cubit.horseColors.map((String color) {
                                  return DropdownMenuItem<String>(
                                    value: color,
                                    child: text(title: color, color: Color4),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Container(
                              //   width: MediaQuery.of(context).size.width *
                              //       0.4,
                              //   height:
                              //       MediaQuery.of(context).size.height *
                              //           0.3,
                              //   color: Color0,
                              // ),
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width *
                              //       0.01,
                              // ),
                              selectedImages == null
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Colors.black, // لون الحاشية
                                          width: 1.0, // عرض الحاشية
                                        ),
                                      ),
                                      child: Center(
                                        child: ElevatedButton(
                                            onPressed: _pickImages,
                                            child: text(
                                                title: "Select Images",
                                                color: Color0)),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        // width: MediaQuery.of(context)
                                        //         .size
                                        //         .width *
                                        //     0.5,

                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Colors.black, // لون الحاشية
                                            width: 1.0, // عرض الحاشية
                                          ),
                                        ),
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                          ),
                                          itemCount: selectedImages!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) => Dialog(
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        child: Image.file(
                                                          File(selectedImages![
                                                                  index]
                                                              .path),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      image: DecorationImage(
                                                          image: FileImage(
                                                            File(
                                                                selectedImages![
                                                                        index]
                                                                    .path),
                                                          ),
                                                          fit: BoxFit.cover)),
                                                  // child: Image.file(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        text(
                          title: "Gender",
                          fontSize: 18,
                          color: Color4,
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    fontWeight: FontWeight.w400,
                                  ),
                                  value: 1,
                                  groupValue: cubit.selectedValue,
                                  onChanged: (int? value) {
                                    cubit.chaingSelectValue(value!);
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
                                    fontWeight: FontWeight.w400,
                                  ),
                                  value: 2,
                                  // contentPadding: EdgeInsets.zero,
                                  groupValue: cubit.selectedValue,
                                  onChanged: (value) {
                                    cubit.chaingSelectValue(value!);
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
                        SizedBox(height: 16.0),
                        SizedBox(height: 16.0),
                        Text(
                          'Vaccination History',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        /////////////////////////////////////
                        // Container(
                        //   height: 100,
                        //   width: 500,
                        //   child: SingleChildScrollView(
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Container(
                        //               width: 150,
                        //               child: TextFormField(
                        //                 controller: vaccinationController,
                        //                 decoration: InputDecoration(
                        //                   labelText: 'Vaccination',
                        //                   border:
                        //                       OutlineInputBorder(), // إضافة الحدود هنا
                        //                 ),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               width: 15,
                        //             ),
                        //             Expanded(
                        //               child: Container(
                        //                 // width: MediaQuery.of(context)
                        //                 //         .size
                        //                 //         .width *
                        //                 //     0.5,
                        //                 decoration:
                        //                     BoxDecoration(boxShadow: <BoxShadow>[]),
                        //                 // margin: EdgeInsets.all(15),
                        //                 height: 65,
                        //                 // width: 100,
                        //                 child: ElevatedButton(
                        //                     style: ElevatedButton.styleFrom(
                        //                         shadowColor: Color0,
                        //                         backgroundColor:
                        //                             LinearGradientColor01,
                        //                         minimumSize: const Size(311, 44),
                        //                         elevation: 1,
                        //                         shape: const RoundedRectangleBorder(
                        //                             borderRadius: BorderRadius.all(
                        //                           Radius.circular(10),
                        //                         ))),
                        //                     onPressed: () {
                        //                       showDialog(
                        //                         context: context,
                        //                         builder: (context) {
                        //                           return Container(
                        //                             padding: EdgeInsets.symmetric(
                        //                                 vertical: 30),
                        //                             child: AlertDialog(
                        //                               title: Text('Select a Date'),
                        //                               content: TableCalendar(
                        //                                 firstDay: DateTime.utc(
                        //                                     2010, 10, 16),
                        //                                 lastDay:
                        //                                     DateTime.utc(2030, 3, 14),
                        //                                 focusedDay: DateTime.now(),
                        //                                 calendarFormat:
                        //                                     CalendarFormat.month,
                        //                                 selectedDayPredicate: (day) {
                        //                                   return isSameDay(
                        //                                       _selectedDay, day);
                        //                                 },
                        //                                 headerStyle: HeaderStyle(
                        //                                   titleCentered: true,
                        //                                   formatButtonVisible: false,
                        //                                 ),
                        //                                 headerVisible: true,
                        //                                 // headerTitleBuilder: (context, focusedDay) {
                        //                                 //   final monthName =
                        //                                 //       DateFormat.MMMM().format(focusedDay);
                        //                                 //   final year =
                        //                                 //       DateFormat.y().format(focusedDay);
                        //                                 //   return Text(
                        //                                 //     '$monthName $year',
                        //                                 //     style: TextStyle(
                        //                                 //       fontSize: 20,
                        //                                 //       fontWeight: FontWeight.bold,
                        //                                 //     ),
                        //                                 //   );
                        //                                 // },
                        //                                 availableCalendarFormats: const {
                        //                                   CalendarFormat.month: '',
                        //                                 },
                        //                                 onDaySelected: (selectedDay,
                        //                                     focusedDay) {
                        //                                   setState(() {
                        //                                     _selectedDay =
                        //                                         selectedDay;
                        //                                     String formattedDate =
                        //                                         DateFormat(
                        //                                                 'yyyy-MM-dd')
                        //                                             .format(
                        //                                                 _selectedDay!);
                        //                                     print('$formattedDate');
                        //                                     Data = formattedDate;
                        //                                     Navigator.pop(context);
                        //                                     // if (Data != null) {
                        //                                     //   // cubit.getDataListTime(
                        //                                     //   //     widget.Idtrinner, Data!);
                        //                                     // }
                        //                                   });
                        //                                 },
                        //                                 onHeaderTapped: (focusedDay) {
                        //                                   print('رفع التقويم للأعلى');
                        //                                 },
                        //                               ),
                        //                             ),
                        //                           );
                        //                         },
                        //                       );

                        //                       print("Deta 1010010101010010100101010");
                        //                     },
                        //                     child: Row(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.center,
                        //                       children: [
                        //                         Expanded(
                        //                           flex: 3,
                        //                           child: text(
                        //                             title: Data == null
                        //                                 ? " BirthData Hours"
                        //                                 : Data.toString(),
                        //                             textAlign: TextAlign.center,
                        //                             color: Colors.white,
                        //                             fontSize: 15,
                        //                             fontWeight: FontWeight.w400,
                        //                           ),
                        //                         ),
                        //                         // Spacer(),
                        //                         Expanded(
                        //                           child: Icon(
                        //                             Icons.date_range,
                        //                             color: Colors.white,
                        //                             size: 25,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     )),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Column(
                        //   children: rows,
                        // ),
                        // SizedBox(height: 16.0),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     setState(() {
                        //       addRow();
                        //     });
                        //   },
                        //   child: Text('Add Row'),
                        // ),
                        // SizedBox(height: 16.0),
                        // Container(
                        //   // width: MediaQuery.of(context)
                        //   //         .size
                        //   //         .width *
                        //   //     0.5,
                        //   decoration: BoxDecoration(boxShadow: <BoxShadow>[]),
                        //   // margin: EdgeInsets.all(15),
                        //   height: 65,
                        //   // width: 100,
                        //   child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //           shadowColor: Color0,
                        //           backgroundColor: LinearGradientColor01,
                        //           minimumSize: const Size(311, 44),
                        //           elevation: 1,
                        //           shape: const RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.all(
                        //             Radius.circular(10),
                        //           ))),
                        //       onPressed: () {
                        //         showDialog(
                        //           context: context,
                        //           builder: (context) {
                        //             return Container(
                        //               padding: EdgeInsets.symmetric(vertical: 30),
                        //               child: AlertDialog(
                        //                 title: Text('Select a Date'),
                        //                 content: TableCalendar(
                        //                   firstDay: DateTime.utc(2010, 10, 16),
                        //                   lastDay: DateTime.utc(2030, 3, 14),
                        //                   focusedDay: DateTime.now(),
                        //                   calendarFormat: CalendarFormat.month,
                        //                   selectedDayPredicate: (day) {
                        //                     return isSameDay(_selectedDay, day);
                        //                   },
                        //                   headerStyle: HeaderStyle(
                        //                     titleCentered: true,
                        //                     formatButtonVisible: false,
                        //                   ),
                        //                   headerVisible: true,
                        //                   // headerTitleBuilder: (context, focusedDay) {
                        //                   //   final monthName =
                        //                   //       DateFormat.MMMM().format(focusedDay);
                        //                   //   final year =
                        //                   //       DateFormat.y().format(focusedDay);
                        //                   //   return Text(
                        //                   //     '$monthName $year',
                        //                   //     style: TextStyle(
                        //                   //       fontSize: 20,
                        //                   //       fontWeight: FontWeight.bold,
                        //                   //     ),
                        //                   //   );
                        //                   // },
                        //                   availableCalendarFormats: const {
                        //                     CalendarFormat.month: '',
                        //                   },
                        //                   onDaySelected: (selectedDay, focusedDay) {
                        //                     setState(() {
                        //                       _selectedDay = selectedDay;
                        //                       String formattedDate =
                        //                           DateFormat('yyyy-MM-dd')
                        //                               .format(_selectedDay!);
                        //                       print('$formattedDate');
                        //                       Data = formattedDate;
                        //                       Navigator.pop(context);
                        //                       if (Data != null) {
                        //                         // cubit.getDataListTime(
                        //                         //     widget.Idtrinner, Data!);
                        //                       }
                        //                     });
                        //                   },
                        //                   onHeaderTapped: (focusedDay) {
                        //                     print('رفع التقويم للأعلى');
                        //                   },
                        //                 ),
                        //               ),
                        //             );
                        //           },
                        //         );

                        //         print("Deta 1010010101010010100101010");
                        //       },
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         children: [
                        //           Expanded(
                        //             flex: 3,
                        //             child: text(
                        //               title: Data == null
                        //                   ? " BirthData Hours"
                        //                   : Data.toString(),
                        //               textAlign: TextAlign.center,
                        //               color: Colors.white,
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w400,
                        //             ),
                        //           ),
                        //           // Spacer(),
                        //           Expanded(
                        //             child: Icon(
                        //               Icons.date_range,
                        //               color: Colors.white,
                        //               size: 25,
                        //             ),
                        //           ),
                        //         ],
                        //       )),
                        // ),
                        for (int i = 0, j = 0;
                            i < Datas.length &&
                                j < vaccinationControllers.length;
                            i++, j++)
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextFormField(
                                  controller: vaccinationControllers[j],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // تعيين حاشية مستديرة
                                    ),
                                    labelText: 'Vaccination ${j + 1}',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a vaccination';
                                    }
                                    // يمكنك إضافة التحققات الإضافية هنا
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration:
                                    BoxDecoration(boxShadow: <BoxShadow>[]),
                                // margin: EdgeInsets.all(15),
                                height: 65,
                                // width: 100,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shadowColor: Color0,
                                        backgroundColor: Color0,
                                        minimumSize: const Size(311, 44),
                                        elevation: 1,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ))),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 30),
                                            child: AlertDialog(
                                              title: Text('Select a Date'),
                                              content: TableCalendar(
                                                firstDay:
                                                    DateTime.utc(2010, 10, 16),
                                                lastDay:
                                                    DateTime.utc(2030, 3, 14),
                                                focusedDay: DateTime.now(),
                                                calendarFormat:
                                                    CalendarFormat.month,
                                                selectedDayPredicate: (day) {
                                                  return isSameDay(
                                                      _selectedDay, day);
                                                },
                                                headerStyle: HeaderStyle(
                                                  titleCentered: true,
                                                  formatButtonVisible: false,
                                                ),
                                                headerVisible: true,
                                                // headerTitleBuilder: (context, focusedDay) {
                                                //   final monthName =
                                                //       DateFormat.MMMM().format(focusedDay);
                                                //   final year =
                                                //       DateFormat.y().format(focusedDay);
                                                //   return Text(
                                                //     '$monthName $year',
                                                //     style: TextStyle(
                                                //       fontSize: 20,
                                                //       fontWeight: FontWeight.bold,
                                                //     ),
                                                //   );
                                                // },
                                                availableCalendarFormats: const {
                                                  CalendarFormat.month: '',
                                                },
                                                onDaySelected:
                                                    (selectedDay, focusedDay) {
                                                  setState(() {
                                                    _selectedDay = selectedDay;
                                                    String formattedDate =
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(
                                                                selectedDay);
                                                    print(formattedDate);

                                                    setState(() {
                                                      Data = formattedDate;
                                                      // ignore: unnecessary_null_comparison
                                                      if (Datas[i] != null) {
                                                        Datas[i] = Data;
                                                      } else
                                                        Datas.add(Data);
                                                    });

                                                    print(formattedDate +
                                                        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
                                                    listSelectedDay.add(
                                                        _selectedDay!); // إضافة الوقت المحدد إلى القائمة
                                                    Navigator.pop(context);
                                                  });
                                                  // setState(() {
                                                  //   _selectedDay = selectedDay;
                                                  //   String formattedDate =
                                                  //       DateFormat('yyyy-MM-dd')
                                                  //           .format(_selectedDay!);
                                                  //   print('$formattedDate');
                                                  //   Data = formattedDate;
                                                  //   Navigator.pop(context);
                                                  //   if (Data != null) {
                                                  //     // cubit.getDataListTime(
                                                  //     //     widget.Idtrinner, Data!);
                                                  //   }
                                                  // });
                                                },
                                                onHeaderTapped: (focusedDay) {
                                                  print('رفع التقويم للأعلى');
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      print("Deta 1010010101010010100101010");
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: text(
                                            // ignore: unnecessary_null_comparison
                                            title: Datas[i] == null
                                                ? "Data Hours"
                                                : Datas[i].toString(),
                                            textAlign: TextAlign.center,
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        // Spacer(),
                                        Expanded(
                                          child: Icon(
                                            Icons.date_range,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            ElevatedButton(
                                onPressed: () {
                                  addTextField();
                                  addDatas();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color0,

                                  // primary: Colors.blue, // تعيين لون الزر
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 24), // تعيين حجم الزر
                                ),
                                child: Text("Add Vaccination History")),
                          ],
                        ),
                        Text(
                          'Treatment History',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        for (int i = 0, j = 0;
                            i < DatasT.length &&
                                j < TreatmentControllers.length;
                            i++, j++)
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                child: TextFormField(
                                  controller: TreatmentControllers[j],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // تعيين حاشية مستديرة
                                    ),
                                    labelText: 'Treatment ${j + 1}',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a Treatment';
                                    }
                                    // يمكنك إضافة التحققات الإضافية هنا
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration:
                                    BoxDecoration(boxShadow: <BoxShadow>[]),
                                // margin: EdgeInsets.all(15),
                                height: 65,
                                // width: 100,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shadowColor: Color0,
                                        backgroundColor: Color0,
                                        minimumSize: const Size(311, 44),
                                        elevation: 1,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ))),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 30),
                                            child: AlertDialog(
                                              title: Text('Select a Date'),
                                              content: TableCalendar(
                                                firstDay:
                                                    DateTime.utc(2010, 10, 16),
                                                lastDay:
                                                    DateTime.utc(2030, 3, 14),
                                                focusedDay: DateTime.now(),
                                                calendarFormat:
                                                    CalendarFormat.month,
                                                selectedDayPredicate: (day) {
                                                  return isSameDay(
                                                      _selectedDay, day);
                                                },
                                                headerStyle: HeaderStyle(
                                                  titleCentered: true,
                                                  formatButtonVisible: false,
                                                ),
                                                headerVisible: true,
                                                // headerTitleBuilder: (context, focusedDay) {
                                                //   final monthName =
                                                //       DateFormat.MMMM().format(focusedDay);
                                                //   final year =
                                                //       DateFormat.y().format(focusedDay);
                                                //   return Text(
                                                //     '$monthName $year',
                                                //     style: TextStyle(
                                                //       fontSize: 20,
                                                //       fontWeight: FontWeight.bold,
                                                //     ),
                                                //   );
                                                // },
                                                availableCalendarFormats: const {
                                                  CalendarFormat.month: '',
                                                },
                                                onDaySelected:
                                                    (selectedDay, focusedDay) {
                                                  setState(() {
                                                    _selectedDay = selectedDay;
                                                    String formattedDate =
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(
                                                                selectedDay);
                                                    print(formattedDate);

                                                    setState(() {
                                                      DataT = formattedDate;
                                                      // ignore: unnecessary_null_comparison
                                                      if (DatasT[i] != null) {
                                                        DatasT[i] = DataT;
                                                      } else
                                                        DatasT.add(DataT);
                                                    });

                                                    print(formattedDate +
                                                        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
                                                    listSelectedDay.add(
                                                        _selectedDay!); // إضافة الوقت المحدد إلى القائمة
                                                    Navigator.pop(context);
                                                  });
                                                  // setState(() {
                                                  //   _selectedDay = selectedDay;
                                                  //   String formattedDate =
                                                  //       DateFormat('yyyy-MM-dd')
                                                  //           .format(_selectedDay!);
                                                  //   print('$formattedDate');
                                                  //   Data = formattedDate;
                                                  //   Navigator.pop(context);
                                                  //   if (Data != null) {
                                                  //     // cubit.getDataListTime(
                                                  //     //     widget.Idtrinner, Data!);
                                                  //   }
                                                  // });
                                                },
                                                onHeaderTapped: (focusedDay) {
                                                  print('رفع التقويم للأعلى');
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      print("Deta 1010010101010010100101010");
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: text(
                                            // ignore: unnecessary_null_comparison
                                            title: DatasT[i] == null
                                                ? "Data Hours"
                                                : DatasT[i].toString(),
                                            textAlign: TextAlign.center,
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        // Spacer(),
                                        Expanded(
                                          child: Icon(
                                            Icons.date_range,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            ElevatedButton(
                                onPressed: () {
                                  addTextFieldT();
                                  addDatasT();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color0,

                                  // primary: Colors.blue, // تعيين لون الزر
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 24), // تعيين حجم الزر
                                ),
                                child: Text("Add Treatment History")),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Medical History',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        for (int i = 0, j = 0;
                            i < DatasM.length && j < MedicalControllers.length;
                            i++, j++)
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                child: TextFormField(
                                  controller: MedicalControllers[j],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // تعيين حاشية مستديرة
                                    ),
                                    labelText: 'Medical ${j + 1}',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a Medical';
                                    }
                                    // يمكنك إضافة التحققات الإضافية هنا
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration:
                                    BoxDecoration(boxShadow: <BoxShadow>[]),
                                // margin: EdgeInsets.all(15),
                                height: 65,
                                // width: 100,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shadowColor: Color0,
                                        backgroundColor: Color0,
                                        minimumSize: const Size(311, 44),
                                        elevation: 1,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ))),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 30),
                                            child: AlertDialog(
                                              title: Text('Select a Date'),
                                              content: TableCalendar(
                                                firstDay:
                                                    DateTime.utc(2010, 10, 16),
                                                lastDay:
                                                    DateTime.utc(2030, 3, 14),
                                                focusedDay: DateTime.now(),
                                                calendarFormat:
                                                    CalendarFormat.month,
                                                selectedDayPredicate: (day) {
                                                  return isSameDay(
                                                      _selectedDay, day);
                                                },
                                                headerStyle: HeaderStyle(
                                                  titleCentered: true,
                                                  formatButtonVisible: false,
                                                ),
                                                headerVisible: true,
                                                // headerTitleBuilder: (context, focusedDay) {
                                                //   final monthName =
                                                //       DateFormat.MMMM().format(focusedDay);
                                                //   final year =
                                                //       DateFormat.y().format(focusedDay);
                                                //   return Text(
                                                //     '$monthName $year',
                                                //     style: TextStyle(
                                                //       fontSize: 20,
                                                //       fontWeight: FontWeight.bold,
                                                //     ),
                                                //   );
                                                // },
                                                availableCalendarFormats: const {
                                                  CalendarFormat.month: '',
                                                },
                                                onDaySelected:
                                                    (selectedDay, focusedDay) {
                                                  setState(() {
                                                    _selectedDay = selectedDay;
                                                    String formattedDate =
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(
                                                                selectedDay);
                                                    print(formattedDate);

                                                    setState(() {
                                                      DataM = formattedDate;
                                                      // ignore: unnecessary_null_comparison
                                                      if (DatasM[i] != null) {
                                                        DatasM[i] = DataM;
                                                      } else
                                                        DatasM.add(DataM);
                                                    });

                                                    print(formattedDate +
                                                        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
                                                    listSelectedDay.add(
                                                        _selectedDay!); // إضافة الوقت المحدد إلى القائمة
                                                    Navigator.pop(context);
                                                  });
                                                  // setState(() {
                                                  //   _selectedDay = selectedDay;
                                                  //   String formattedDate =
                                                  //       DateFormat('yyyy-MM-dd')
                                                  //           .format(_selectedDay!);
                                                  //   print('$formattedDate');
                                                  //   Data = formattedDate;
                                                  //   Navigator.pop(context);
                                                  //   if (Data != null) {
                                                  //     // cubit.getDataListTime(
                                                  //     //     widget.Idtrinner, Data!);
                                                  //   }
                                                  // });
                                                },
                                                onHeaderTapped: (focusedDay) {
                                                  print('رفع التقويم للأعلى');
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      print("Deta 1010010101010010100101010");
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: text(
                                            // ignore: unnecessary_null_comparison
                                            title: DatasM[i] == null
                                                ? "Data Hours"
                                                : DatasM[i].toString(),
                                            textAlign: TextAlign.center,
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        // Spacer(),
                                        Expanded(
                                          child: Icon(
                                            Icons.date_range,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            ElevatedButton(
                                onPressed: () {
                                  addTextFieldM();
                                  addDatasM();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color0,

                                  // primary: Colors.blue, // تعيين لون الزر
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 24), // تعيين حجم الزر
                                ),
                                child: Text("Add Medical History")),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: currentSymptomsController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // تعيين حاشية مستديرة
                            ),
                            labelText: 'Current Symptoms',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Current Symptoms';
                            }
                            // يمكنك إضافة التحققات الإضافية هنا
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),

                        TextFormField(
                          controller: questionsController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // تعيين حاشية مستديرة
                            ),
                            labelText: 'Questions/Inquiries',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Questions/Inquiries';
                            }
                            // يمكنك إضافة التحققات الإضافية هنا
                            return null;
                          },
                        ),

                        // SizedBox(height: 16.0),
                        // GestureDetector(
                        //   onTap: () {
                        //     for (int i = 0, j = 0;
                        //         i < Datas.length && j < vaccinationControllers.length;
                        //         i++, j++) {
                        //       VaccinationsApi.add({
                        //         "details": vaccinationControllers[i].text.toString(),
                        //         "date": Datas[i].toString()
                        //       });
                        //     }
                        //     for (int i = 0, j = 0;
                        //         i < DatasT.length && j < TreatmentControllers.length;
                        //         i++, j++) {
                        //       TreamentApi.add({
                        //         "details": TreatmentControllers[i].text.toString(),
                        //         "date": DatasT[i].toString()
                        //       });
                        //     }
                        //     for (int i = 0, j = 0;
                        //         i < DatasM.length && j < MedicalControllers.length;
                        //         i++, j++) {
                        //       MedicalApi.add({
                        //         "details": MedicalControllers[i].text.toString(),
                        //         "date": DatasM[i].toString()
                        //       });
                        //     }
                        //     // print(VaccinationsApi.toString());
                        //     // print(TreamentApi.toString() + "TreamentApi");
                        //     // print(MedicalApi.toString() + "MedicalApi");
                        //     print(horseNameController.text + "LLL");
                        //     print(ageController.text + "LLdddL");
                        //     print(cubit.selectedColor.toString() + "LLdssssssddL");
                        //     print(selectedImages!.length.toString() + "LLdssssssddL");
                        //     print(cubit.selectGender.toString() +
                        //         "LLdssssssdddddddddddddL");
                        //     print(questionsController.text.toString() +
                        //         "LLdssssssddddwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwdddddddddL");
                        //     cubit.postCreateConsultation(
                        //         health_care_id: widget.id_HelthCare,
                        //         selectedImages: selectedImages!,
                        //         hoursName: horseNameController.text,
                        //         age: ageController.text,
                        //         hoursColor: cubit.selectedColor.toString(),
                        //         gender: cubit.selectGender.toString(),
                        //         vaccinations: VaccinationsApi,
                        //         treatment: TreamentApi,
                        //         medical: MedicalApi,
                        //         questions: questionsController.toString());
                        //     // Handle submit button action
                        //   },
                        //   child: Text('Submit'),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        cubit.isload
                            ? SpinkitWave()
                            : ElevatedButton(
                                onPressed: () {
                                  for (int i = 0, j = 0;
                                      i < Datas.length &&
                                          j < vaccinationControllers.length;
                                      i++, j++) {
                                    VaccinationsApi.add({
                                      "details": vaccinationControllers[i]
                                          .text
                                          .toString(),
                                      "date": Datas[i].toString()
                                    });
                                  }
                                  for (int i = 0, j = 0;
                                      i < DatasT.length &&
                                          j < TreatmentControllers.length;
                                      i++, j++) {
                                    TreamentApi.add({
                                      "details": TreatmentControllers[i]
                                          .text
                                          .toString(),
                                      "date": DatasT[i].toString()
                                    });
                                  }
                                  for (int i = 0, j = 0;
                                      i < DatasM.length &&
                                          j < MedicalControllers.length;
                                      i++, j++) {
                                    MedicalApi.add({
                                      "details":
                                          MedicalControllers[i].text.toString(),
                                      "date": DatasM[i].toString()
                                    });
                                  }
                                  // print(VaccinationsApi.toString());
                                  // print(TreamentApi.toString() + "TreamentApi");
                                  // print(MedicalApi.toString() + "MedicalApi");
                                  print(horseNameController.text + "LLL");
                                  print(ageController.text + "LLdddL");
                                  print(cubit.selectedColor.toString() +
                                      "LLdssssssddL");
                                  // print(selectedImages!.length.toString() +
                                  // "LLdssssssddL");
                                  print(cubit.selectGender.toString() +
                                      "LLdssssssdddddddddddddL");
                                  print(questionsController.text.toString() +
                                      "LLdssssssddddwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwdddddddddL");
                                  if (_formKey.currentState!.validate() &&
                                      cubit.selectedColor != null &&
                                      selectedImages != null &&
                                      // ignore: unnecessary_null_comparison
                                      cubit.selectGender != null) {
                                    cubit.chingLoading(true);

                                    cubit.postCreateConsultation(
                                        context: context,
                                        health_care_id: widget.id_HelthCare,
                                        selectedImages: selectedImages!,
                                        hoursName: horseNameController.text,
                                        age: ageController.text,
                                        hoursColor:
                                            cubit.selectedColor.toString(),
                                        gender: cubit.selectGender.toString(),
                                        vaccinations: VaccinationsApi,
                                        treatment: TreamentApi,
                                        medical: MedicalApi,
                                        symptoms:
                                            currentSymptomsController.text,
                                        questions: questionsController.text);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Make sure to fill out all fields",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 5,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color0,

                                  // primary: Colors.blue, // تعيين لون الزر
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 24), // تعيين حجم الزر
                                ),
                                child: Text("Send")),
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

  // void addRow() {
  //   final TextEditingController controller = TextEditingController();
  //   controllers.add(controller);
  //   String? DataData;
  //   // Datas.add(DataData);
  //   // final DateTime selectedDay = DateTime(2017, 9, 7, 17, 30);

  //   // listSelectedDay.add(selectedDay);
  //   final Widget row = Row(
  //     children: [
  //       SingleChildScrollView(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 Container(
  //                   width: 120,
  //                   child: TextFormField(
  //                     controller: controller,
  //                     decoration: InputDecoration(
  //                       labelText: 'Vaccination',
  //                       border: OutlineInputBorder(), // إضافة الحدود هنا
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 15,
  //                 ),
  //                 Container(
  //                   width: MediaQuery.of(context).size.width * 0.4,
  //                   decoration: BoxDecoration(boxShadow: <BoxShadow>[]),
  //                   // margin: EdgeInsets.all(15),
  //                   height: 65,
  //                   // width: 100,
  //                   child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                           shadowColor: Color0,
  //                           backgroundColor: LinearGradientColor01,
  //                           minimumSize: const Size(311, 44),
  //                           elevation: 1,
  //                           shape: const RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.all(
  //                             Radius.circular(10),
  //                           ))),
  //                       onPressed: () {
  //                         showDialog(
  //                           context: context,
  //                           builder: (context) {
  //                             return Container(
  //                               padding: EdgeInsets.symmetric(vertical: 30),
  //                               child: AlertDialog(
  //                                 title: Text('Select a Date'),
  //                                 content: TableCalendar(
  //                                   firstDay: DateTime.utc(2010, 10, 16),
  //                                   lastDay: DateTime.utc(2030, 3, 14),
  //                                   focusedDay: DateTime.now(),
  //                                   calendarFormat: CalendarFormat.month,
  //                                   selectedDayPredicate: (day) {
  //                                     return isSameDay(_selectedDay, day);
  //                                   },
  //                                   headerStyle: HeaderStyle(
  //                                     titleCentered: true,
  //                                     formatButtonVisible: false,
  //                                   ),
  //                                   headerVisible: true,
  //                                   // headerTitleBuilder: (context, focusedDay) {
  //                                   //   final monthName =
  //                                   //       DateFormat.MMMM().format(focusedDay);
  //                                   //   final year =
  //                                   //       DateFormat.y().format(focusedDay);
  //                                   //   return Text(
  //                                   //     '$monthName $year',
  //                                   //     style: TextStyle(
  //                                   //       fontSize: 20,
  //                                   //       fontWeight: FontWeight.bold,
  //                                   //     ),
  //                                   //   );
  //                                   // },
  //                                   availableCalendarFormats: const {
  //                                     CalendarFormat.month: '',
  //                                   },
  //                                   onDaySelected: (selectedDay, focusedDay) {
  //                                     setState(() {
  //                                       _selectedDay = selectedDay;
  //                                       String formattedDate =
  //                                           DateFormat('yyyy-MM-dd')
  //                                               .format(selectedDay);
  //                                       print(formattedDate);

  //                                       setState(() {
  //                                         DataData = formattedDate;
  //                                         Datas.add(DataData!);
  //                                       });

  //                                       print(formattedDate +
  //                                           "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
  //                                       listSelectedDay.add(
  //                                           _selectedDay!); // إضافة الوقت المحدد إلى القائمة
  //                                       Navigator.pop(context);
  //                                     });
  //                                     // setState(() {
  //                                     //   selectedDay = selectedDay;
  //                                     //   String formattedDate =
  //                                     //       DateFormat('yyyy-MM-dd')
  //                                     //           .format(selectedDay!);
  //                                     //   print('$formattedDate' +
  //                                     //       "oooooooooooooooooooooooooooooooooooooooooooo");
  //                                     //   DataData = formattedDate;
  //                                     //   Navigator.pop(context);
  //                                     //   if (DataData != null) {
  //                                     //     setState(() {});
  //                                     //     // cubit.getDataListTime(
  //                                     //     //     widget.Idtrinner, Data!);
  //                                     //   }
  //                                     // });
  //                                   },
  //                                   onHeaderTapped: (focusedDay) {
  //                                     print('رفع التقويم للأعلى');
  //                                   },
  //                                 ),
  //                               ),
  //                             );
  //                           },
  //                         );

  //                         print("Deta 1010010101010010100101010");
  //                       },
  //                       child: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           for (int i = 0; i < Datas.length; i++)
  //                             Expanded(
  //                               flex: 3,
  //                               child: text(
  //                                 title: Datas[i].toString(),
  //                                 textAlign: TextAlign.center,
  //                                 color: Colors.white,
  //                                 fontSize: 15,
  //                                 fontWeight: FontWeight.w400,
  //                               ),
  //                             ),
  //                           // Spacer(),
  //                           Expanded(
  //                             child: Icon(
  //                               Icons.date_range,
  //                               color: Colors.white,
  //                               size: 25,
  //                             ),
  //                           ),
  //                         ],
  //                       )),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );

  //   rows.add(row);
  // }
}
