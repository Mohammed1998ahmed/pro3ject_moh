// class Register extends StatefulWidget {
//   Register({Key? key}) : super(key: key);

//   @override
//   State<Register> createState() => _RegisterState();
// }

// ignore: must_be_immutable
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thi/Auction/AddAuctions/cubit/add_auctions_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:video_player/video_player.dart';

class AddAuctions extends StatefulWidget {
  @override
  State<AddAuctions> createState() => _AddAuctionsState();
}

class _AddAuctionsState extends State<AddAuctions> {
  // ignore: unused_field
  TextEditingController _categoryController = TextEditingController();

  // ignore: unused_field
  TextEditingController _nameController = TextEditingController();

  // ignore: unused_field
  TextEditingController _colorController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  // ignore: unused_field
  TextEditingController _dateController = TextEditingController();

  // ignore: unused_field
  TextEditingController _passwordController = TextEditingController();

  // ignore: unused_field
  TextEditingController _conf_passwordController = TextEditingController();

  TextEditingController _initaPriceController = TextEditingController();

  TextEditingController _descriptionController = TextEditingController();

  final String flag = '🇦🇪';

  final keyForm = GlobalKey<FormState>();

  final String callingCode = '+971';
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('');
  }

  String? _selectedVideoPath;

  Future<void> _selectVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'avi'], // الامتدادات المسموح بها
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      String path = file.path!;
      _selectedVideoPath = file.path!;
      _controller = VideoPlayerController.file(File(path));
      await _controller!.initialize();
      _isVideoPlaying = true;
      _isVideoSelected = true;

      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  bool _isVideoPlaying = false;
  bool _isVideoSelected = false;

  File? selectedImage;

  int selectedValue = 1;
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
  // Future<void> _pickImage() async {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AddAuctionsCubit();
      },
      child: BlocConsumer<AddAuctionsCubit, AddAuctionsState>(
        listener: (context, state) {
          ////////////////////////////////
          // if (state is RegisterSeccsfully) {
          //   Navigator.pushReplacement<void, void>(
          //     context,
          //     MaterialPageRoute<void>(
          //       builder: (BuildContext context) =>
          //           ForgotPasswordVerificationPage(
          //         email: _emailController.text,
          //       ),
          //     ),
          //   );
          // }
        },
        builder: (context, state) {
          final cubit = AddAuctionsCubit.getObject(context);
          // ignore: unused_local_variable
          File? imageFile;
          return SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color2,
                    ),
                  ),
                ),
                body: Container(
                  child: SingleChildScrollView(
                    child: Form(
                      key: keyForm,
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // ImageRegister(),
                                  text(
                                      title: "Add Auctions",
                                      color: Color6,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: text(
                                        title: "You are welcome",
                                        textAlign: TextAlign.center,
                                        color: Color2,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),

                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            ? Center(
                                                child: ElevatedButton(
                                                    onPressed: _pickImages,
                                                    child: text(
                                                        title: "Select Images",
                                                        color: Color0)),
                                              )
                                            : Expanded(
                                                child: Container(
                                                  // width: MediaQuery.of(context)
                                                  //         .size
                                                  //         .width *
                                                  //     0.5,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  child: GridView.builder(
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                    ),
                                                    itemCount:
                                                        selectedImages!.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (_) =>
                                                                  Dialog(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.5,
                                                                  child: Image
                                                                      .file(
                                                                    File(selectedImages![
                                                                            index]
                                                                        .path),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    image: DecorationImage(
                                                                        image: FileImage(
                                                                          File(selectedImages![index]
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
                                  Divider(),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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

                                        Center(
                                          child: _isVideoSelected
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Dialog(
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.9,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.7,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.97,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.6,
                                                                      child:
                                                                          AspectRatio(
                                                                        aspectRatio: _controller!
                                                                            .value
                                                                            .aspectRatio,
                                                                        child: VideoPlayer(
                                                                            _controller!),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.21,
                                                            child: AspectRatio(
                                                              aspectRatio:
                                                                  _controller!
                                                                      .value
                                                                      .aspectRatio,
                                                              child: VideoPlayer(
                                                                  _controller!),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              _isVideoPlaying
                                                                  ? Icons.pause
                                                                  : Icons
                                                                      .play_arrow,
                                                              size: 48.0,
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                _isVideoPlaying =
                                                                    !_isVideoPlaying;
                                                                _isVideoPlaying
                                                                    ? _controller!
                                                                        .play()
                                                                    : _controller!
                                                                        .pause();
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Center(
                                                  child: ElevatedButton(
                                                      onPressed: _selectVideo,
                                                      child: text(
                                                          title: "Select Vidoe",
                                                          color: Color0)),
                                                ),
                                        ),

                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ///////////////////////////////
                                        // Center(
                                        //   child: imageProfile(cubit),
                                        // ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        Row(
                                          children: [
                                            TextFieldWidght(
                                              widthC: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              controller: _nameController,
                                              context: context,
                                              hintText: "Name",
                                              messageForm:
                                                  'Please enter your Name',
                                              keyboardType: TextInputType.name,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.019,
                                            ),

                                            // TextFieldWidght(
                                            //   widthC: MediaQuery.of(context)
                                            //           .size
                                            //           .width *
                                            //       0.4,
                                            //   controller: _colorController,
                                            //   context: context,
                                            //   hintText: "Color",
                                            //   messageForm:
                                            //       'Please enter your Last Name',
                                            //   keyboardType: TextInputType.name,
                                            // ),
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(5.5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Color0)),
                                                child: DropdownButton<String>(
                                                  hint: text(
                                                      title: 'Select color',
                                                      color: Color4),
                                                  value: cubit.selectedColor,
                                                  onChanged:
                                                      (String? newValue) {
                                                    // Update the selected value when the choice changes
                                                    // selectedColor = newValue!;
                                                    cubit.chaingSelectColor(
                                                        color: newValue!);
                                                  },
                                                  items: cubit.horseColors
                                                      .map((String color) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: color,
                                                      child: text(
                                                          title: color,
                                                          color: Color4),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),

                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.90,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.080,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color0,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: _categoryController,

                                              keyboardType: TextInputType
                                                  .emailAddress, // تغيير نوع لوحة المفاتيح إلى البريد الإلكتروني
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Caveat',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color5,
                                                ),
                                                hintText:
                                                    "Category", // تغيير نص التلميح لصيغة البريد الإلكتروني
                                              ),
                                            ),
                                          ),
                                        ),
                                        // TextFieldWidght(
                                        //   controller: _emailController,
                                        //   context: context,
                                        //   hintText: "Email",
                                        //   messageForm: 'Please enter your Email',
                                        //   keyboardType: TextInputType.emailAddress,
                                        // ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                // width: MediaQuery.of(context)
                                                //         .size
                                                //         .width *
                                                //     0.5,
                                                decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[]),
                                                // margin: EdgeInsets.all(15),
                                                height: 50,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            shadowColor: Color0,
                                                            backgroundColor:
                                                                Color0,
                                                            minimumSize:
                                                                const Size(
                                                                    311, 44),
                                                            elevation: 1,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                              Radius.circular(
                                                                  10),
                                                            ))),
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        30),
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Select a Date'),
                                                              content:
                                                                  TableCalendar(
                                                                firstDay:
                                                                    DateTime.utc(
                                                                        2010,
                                                                        10,
                                                                        16),
                                                                lastDay:
                                                                    DateTime.utc(
                                                                        2030,
                                                                        3,
                                                                        14),
                                                                focusedDay:
                                                                    DateTime
                                                                        .now(),
                                                                calendarFormat:
                                                                    CalendarFormat
                                                                        .month,
                                                                selectedDayPredicate:
                                                                    (day) {
                                                                  return isSameDay(
                                                                      _selectedDay,
                                                                      day);
                                                                },
                                                                headerStyle:
                                                                    HeaderStyle(
                                                                  titleCentered:
                                                                      true,
                                                                  formatButtonVisible:
                                                                      false,
                                                                ),
                                                                headerVisible:
                                                                    true,
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
                                                                  CalendarFormat
                                                                      .month: '',
                                                                },
                                                                onDaySelected:
                                                                    (selectedDay,
                                                                        focusedDay) {
                                                                  setState(() {
                                                                    _selectedDay =
                                                                        selectedDay;
                                                                    String
                                                                        formattedDate =
                                                                        DateFormat('yyyy-MM-dd')
                                                                            .format(_selectedDay!);
                                                                    print(
                                                                        '$formattedDate');
                                                                    cubit.Data =
                                                                        formattedDate;
                                                                    Navigator.pop(
                                                                        context);
                                                                    if (cubit
                                                                            .Data !=
                                                                        null) {
                                                                      // cubit.getDataListTime(
                                                                      //     widget.Idtrinner, Data!);
                                                                    }
                                                                  });
                                                                },
                                                                onHeaderTapped:
                                                                    (focusedDay) {
                                                                  print(
                                                                      'رفع التقويم للأعلى');
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      print(
                                                          "Deta 1010010101010010100101010");
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: text(
                                                            title: cubit.Data ==
                                                                    null
                                                                ? "Start Auction "
                                                                : cubit.Data
                                                                    .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                            ),
                                            // Container(
                                            //   width: MediaQuery.of(context)
                                            //           .size
                                            //           .width *
                                            //       0.4,
                                            //   height: MediaQuery.of(context)
                                            //           .size
                                            //           .height *
                                            //       0.080,
                                            //   decoration: BoxDecoration(
                                            //     border: Border.all(
                                            //       color: Color0,
                                            //       width: 1.0,
                                            //     ),
                                            //     borderRadius:
                                            //         BorderRadius.circular(15.0),
                                            //   ),
                                            //   child: Padding(
                                            //     padding: const EdgeInsets.symmetric(
                                            //         horizontal: 10.0,
                                            //         vertical: 0.0),
                                            //     child: TextFormField(
                                            //       controller: _dateController,
                                            //       validator: (value) {
                                            //         if (value == null ||
                                            //             value.isEmpty) {
                                            //           return 'Please enter your Date';
                                            //         }
                                            //         // تحقق من صيغة تاريخ الميلاد باستخدام تعبير منتظم
                                            //         final dateRegex = RegExp(
                                            //             r'^\d{4}-\d{1,2}-\d{1,2}$');
                                            //         if (!dateRegex
                                            //             .hasMatch(value)) {
                                            //           return 'Please enter a valid date in the format (yyyy-MM-dd).';
                                            //         }
                                            //         return null;
                                            //       },
                                            //       keyboardType: TextInputType
                                            //           .datetime, // تغيير نوع لوحة المفاتيح إلى التاريخ والوقت
                                            //       decoration: InputDecoration(
                                            //         border: InputBorder.none,
                                            //         hintStyle: TextStyle(
                                            //           fontFamily: 'Caveat',
                                            //           fontSize: 16,
                                            //           fontWeight: FontWeight.w600,
                                            //           color: Color5,
                                            //         ),
                                            //         hintText:
                                            //             "Star Auctions", // تغيير نص التلميح لصيغة تاريخ الميلاد
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.019,
                                            ),
                                            Expanded(
                                              child: Container(
                                                // width: MediaQuery.of(context)
                                                //         .size
                                                //         .width *
                                                //     0.5,
                                                decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[]),
                                                // margin: EdgeInsets.all(15),
                                                height: 50,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            shadowColor: Color0,
                                                            backgroundColor:
                                                                Color0,
                                                            minimumSize:
                                                                const Size(
                                                                    311, 44),
                                                            elevation: 1,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                              Radius.circular(
                                                                  10),
                                                            ))),
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        30),
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Select a Date'),
                                                              content:
                                                                  TableCalendar(
                                                                firstDay:
                                                                    DateTime.utc(
                                                                        2010,
                                                                        10,
                                                                        16),
                                                                lastDay:
                                                                    DateTime.utc(
                                                                        2030,
                                                                        3,
                                                                        14),
                                                                focusedDay:
                                                                    DateTime
                                                                        .now(),
                                                                calendarFormat:
                                                                    CalendarFormat
                                                                        .month,
                                                                selectedDayPredicate:
                                                                    (day) {
                                                                  return isSameDay(
                                                                      _selectedDay,
                                                                      day);
                                                                },
                                                                headerStyle:
                                                                    HeaderStyle(
                                                                  titleCentered:
                                                                      true,
                                                                  formatButtonVisible:
                                                                      false,
                                                                ),
                                                                headerVisible:
                                                                    true,
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
                                                                  CalendarFormat
                                                                      .month: '',
                                                                },
                                                                onDaySelected:
                                                                    (selectedDay,
                                                                        focusedDay) {
                                                                  setState(() {
                                                                    _selectedDay =
                                                                        selectedDay;
                                                                    String
                                                                        formattedDate =
                                                                        DateFormat('yyyy-MM-dd')
                                                                            .format(_selectedDay!);
                                                                    print(
                                                                        '$formattedDate');
                                                                    cubit.Data1 =
                                                                        formattedDate;
                                                                    Navigator.pop(
                                                                        context);
                                                                    if (cubit
                                                                            .Data1 !=
                                                                        null) {
                                                                      // cubit.getDataListTime(
                                                                      //     widget.Idtrinner, Data!);
                                                                    }
                                                                  });
                                                                },
                                                                onHeaderTapped:
                                                                    (focusedDay) {
                                                                  print(
                                                                      'رفع التقويم للأعلى');
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      print(
                                                          "Deta 1010010101010010100101010");
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: text(
                                                            title: cubit.Data1 ==
                                                                    null
                                                                ? " End Auction "
                                                                : cubit.Data1
                                                                    .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                            ),
                                            // Expanded(
                                            //   child: Container(
                                            //     // width: MediaQuery.of(context)
                                            //     //         .size
                                            //     //         .width *
                                            //     //     0.4,
                                            //     height: MediaQuery.of(context)
                                            //             .size
                                            //             .height *
                                            //         0.080,
                                            //     decoration: BoxDecoration(
                                            //       border: Border.all(
                                            //         color: Color0,
                                            //         width: 1.0,
                                            //       ),
                                            //       borderRadius:
                                            //           BorderRadius.circular(15.0),
                                            //     ),
                                            //     child: Padding(
                                            //       padding:
                                            //           const EdgeInsets.symmetric(
                                            //               horizontal: 10.0,
                                            //               vertical: 0.0),
                                            //       child: TextFormField(
                                            //         controller: _dateController,
                                            //         validator: (value) {
                                            //           if (value == null ||
                                            //               value.isEmpty) {
                                            //             return 'Please enter your Date';
                                            //           }
                                            //           // تحقق من صيغة تاريخ الميلاد باستخدام تعبير منتظم
                                            //           final dateRegex = RegExp(
                                            //               r'^\d{4}-\d{1,2}-\d{1,2}$');
                                            //           if (!dateRegex
                                            //               .hasMatch(value)) {
                                            //             return 'Please enter a valid date in the format (yyyy-MM-dd).';
                                            //           }
                                            //           return null;
                                            //         },
                                            //         keyboardType: TextInputType
                                            //             .datetime, // تغيير نوع لوحة المفاتيح إلى التاريخ والوقت
                                            //         decoration: InputDecoration(
                                            //           border: InputBorder.none,
                                            //           hintStyle: TextStyle(
                                            //             fontFamily: 'Caveat',
                                            //             fontSize: 16,
                                            //             fontWeight: FontWeight.w600,
                                            //             color: Color5,
                                            //           ),
                                            //           hintText:
                                            //               "End Auctions", // تغيير نص التلميح لصيغة تاريخ الميلاد
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        TextFieldWidght(
                                          controller: _initaPriceController,
                                          context: context,
                                          hintText: "InitaPrice",
                                          messageForm:
                                              'Please enter your InitaPrice',
                                          keyboardType: TextInputType.number,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        TextFieldWidght(
                                          controller: _descriptionController,
                                          context: context,
                                          hintText: "Description",
                                          messageForm:
                                              'Please enter your Description',
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        Row(
                                          children: [
                                            TextFieldWidght(
                                              widthC: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              controller: _addressController,
                                              context: context,
                                              hintText: "address",
                                              messageForm:
                                                  'Please enter your address',
                                              keyboardType:
                                                  TextInputType.streetAddress,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.019,
                                            ),
                                            Expanded(
                                              child: Container(
                                                // width: MediaQuery.of(context)
                                                //         .size
                                                //         .width *
                                                //     0.5,
                                                decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[]),
                                                // margin: EdgeInsets.all(15),
                                                height: 50,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            shadowColor: Color0,
                                                            backgroundColor:
                                                                Color0,
                                                            minimumSize:
                                                                const Size(
                                                                    311, 44),
                                                            elevation: 1,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                              Radius.circular(
                                                                  10),
                                                            ))),
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        30),
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Select a Date'),
                                                              content:
                                                                  TableCalendar(
                                                                firstDay:
                                                                    DateTime.utc(
                                                                        2010,
                                                                        10,
                                                                        16),
                                                                lastDay:
                                                                    DateTime.utc(
                                                                        2030,
                                                                        3,
                                                                        14),
                                                                focusedDay:
                                                                    DateTime
                                                                        .now(),
                                                                calendarFormat:
                                                                    CalendarFormat
                                                                        .month,
                                                                selectedDayPredicate:
                                                                    (day) {
                                                                  return isSameDay(
                                                                      _selectedDay,
                                                                      day);
                                                                },
                                                                headerStyle:
                                                                    HeaderStyle(
                                                                  titleCentered:
                                                                      true,
                                                                  formatButtonVisible:
                                                                      false,
                                                                ),
                                                                headerVisible:
                                                                    true,
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
                                                                  CalendarFormat
                                                                      .month: '',
                                                                },
                                                                onDaySelected:
                                                                    (selectedDay,
                                                                        focusedDay) {
                                                                  setState(() {
                                                                    _selectedDay =
                                                                        selectedDay;
                                                                    String
                                                                        formattedDate =
                                                                        DateFormat('yyyy-MM-dd')
                                                                            .format(_selectedDay!);
                                                                    print(
                                                                        '$formattedDate');
                                                                    cubit.BirthData =
                                                                        formattedDate;
                                                                    Navigator.pop(
                                                                        context);
                                                                    if (cubit
                                                                            .BirthData !=
                                                                        null) {
                                                                      // cubit.getDataListTime(
                                                                      //     widget.Idtrinner, Data!);
                                                                    }
                                                                  });
                                                                },
                                                                onHeaderTapped:
                                                                    (focusedDay) {
                                                                  print(
                                                                      'رفع التقويم للأعلى');
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      print(
                                                          "Deta 1010010101010010100101010");
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: text(
                                                            title: cubit.BirthData ==
                                                                    null
                                                                ? " BirthData Hours"
                                                                : cubit.BirthData
                                                                    .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                            ),
                                            // Container(
                                            //   width: MediaQuery.of(context)
                                            //           .size
                                            //           .width *
                                            //       0.4,
                                            //   height: MediaQuery.of(context)
                                            //           .size
                                            //           .height *
                                            //       0.080,
                                            //   decoration: BoxDecoration(
                                            //     border: Border.all(
                                            //       color: Color0,
                                            //       width: 1.0,
                                            //     ),
                                            //     borderRadius:
                                            //         BorderRadius.circular(15.0),
                                            //   ),
                                            //   child: Padding(
                                            //     padding: const EdgeInsets.symmetric(
                                            //         horizontal: 10.0,
                                            //         vertical: 0.0),
                                            //     child: TextFormField(
                                            //       controller: _dateController,
                                            //       validator: (value) {
                                            //         if (value == null ||
                                            //             value.isEmpty) {
                                            //           return 'Please enter your Date';
                                            //         }
                                            //         // تحقق من صيغة تاريخ الميلاد باستخدام تعبير منتظم
                                            //         final dateRegex = RegExp(
                                            //             r'^\d{4}-\d{1,2}-\d{1,2}$');
                                            //         if (!dateRegex
                                            //             .hasMatch(value)) {
                                            //           return 'Please enter a valid date in the format (yyyy-MM-dd).';
                                            //         }
                                            //         return null;
                                            //       },
                                            //       keyboardType: TextInputType
                                            //           .datetime, // تغيير نوع لوحة المفاتيح إلى التاريخ والوقت
                                            //       decoration: InputDecoration(
                                            //         border: InputBorder.none,
                                            //         hintStyle: TextStyle(
                                            //           fontFamily: 'Caveat',
                                            //           fontSize: 16,
                                            //           fontWeight: FontWeight.w600,
                                            //           color: Color5,
                                            //         ),
                                            //         hintText:
                                            //             "yyyy-MM-dd", // تغيير نص التلميح لصيغة تاريخ الميلاد
                                            //       ),
                                            //     ),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        Container(
                                          child: text(
                                            title: "Gender",
                                            fontSize: 18,
                                            color: Color0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.70,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100,
                                                // أو Flexible
                                                child: RadioListTile(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  activeColor: Color0,
                                                  // tileColor: Colors.red,

                                                  title: text(
                                                    title: 'Male',
                                                    fontSize: 16,
                                                    color: Color4,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  value: 1,
                                                  groupValue:
                                                      cubit.selectedValue,
                                                  onChanged: (int? value) {
                                                    cubit.chaingSelectValue(
                                                        value!);
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
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  activeColor: Color0,
                                                  title: text(
                                                    title: 'Woman',
                                                    fontSize: 16,
                                                    color: Color4,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  value: 2,
                                                  // contentPadding: EdgeInsets.zero,
                                                  groupValue:
                                                      cubit.selectedValue,
                                                  onChanged: (value) {
                                                    cubit.chaingSelectValue(
                                                        value!);
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
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0010,
                                  ),

                                  // cubit.isload
                                  //     ? SpinkitWave()
                                  //     :
                                  state is AddAuctionsLoading
                                      ? SpinkitWave()
                                      : ButtonStaic(
                                          context: context,
                                          onTap: () {
                                            print("object");
                                            // print(selectedImage!.path.toString() +
                                            //     "LLLLLLLLLLLLLLLLLLLLLLLl");

                                            cubit.postAddAuctions(
                                                context: context,
                                                name: _nameController.text,
                                                Category:
                                                    _categoryController.text,
                                                Data1: cubit.Data1!,
                                                Data: cubit.Data!,
                                                addriess:
                                                    _addressController.text,
                                                berathData: cubit.BirthData!,
                                                color: cubit.selectedColor!,
                                                description:
                                                    _descriptionController.text,
                                                gender: cubit.selectGender,
                                                initaPrice:
                                                    _initaPriceController.text,
                                                selectedImages: selectedImages!,
                                                controller:
                                                    _selectedVideoPath!);

                                            if (keyForm.currentState!
                                                .validate()) {
                                              if (selectedImage != null) {
                                                // cubit.postAddAuctions(
                                                //     name: _nameController.text,
                                                //     Category: _categoryController.text,
                                                //     Data1: cubit.Data1!,
                                                //     Data: cubit.Data!,
                                                //     addriess: _addressController.text,
                                                //     berathData: cubit.BirthData!,
                                                //     color: cubit.selectedColor!,
                                                //     description: _dateController.text,
                                                //     gender: cubit.selectGender,
                                                //     initaPrice:
                                                //         _initaPriceController.text,
                                                //     selectedImages: selectedImages!);
                                                // cubit.chingLoading(true);
                                                // cubit.postReister(
                                                //     imageFile: selectedImage!,
                                                //     LName: _lnameController.text,
                                                //     address:
                                                //         _addressController.text,
                                                //     birth: _dateController.text,
                                                //     gender: cubit.selectGender,
                                                //     Email: _emailController.text,
                                                //     Name: _nameController.text,
                                                //     PassWord:
                                                //         _passwordController.text,
                                                //     Conf_PassWord:
                                                //         _conf_passwordController
                                                //             .text,
                                                //     Phone: _phoneController.text,
                                                //     context: context);
                                              }
                                            }
                                            // يتم تنفيذ هذا الكود عند النقر على الزر

                                            print('تم النقر على الزر!');
                                          },
                                          title: "Add Auctiond",
                                        ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
}

class ImageRegister extends StatelessWidget {
  const ImageRegister({
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
          'assets/images/Sign up-cuate.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Picker Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
           
//           ],
//         ),
//       ),
//     );
//   }
// }
