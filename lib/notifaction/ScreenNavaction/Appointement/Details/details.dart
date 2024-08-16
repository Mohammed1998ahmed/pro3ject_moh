import 'package:flutter/material.dart';
 import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class DatilsBookingNavaction extends StatelessWidget {
  const DatilsBookingNavaction({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: text(title: "Datils Booking", color: Color0),
        actions: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: text(title: "Confirmation"),
                    content: text(
                        title: "Are you sure you want to cancel the booking?"),
                    actions: [
                      TextButton(
                        child: text(title: "Yes", color: Colors.brown),
                        onPressed: () {
                          // Perform the cancellation of booking here
                          Navigator.of(context)
                              .pop(); // Close the dialog after pressing "Yes"
                        },
                      ),
                      TextButton(
                        child: text(title: "No", color: Colors.green),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Close the dialog after pressing "No"
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: text(title: "Cancellation of Booking"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Vetrinary-Specialty-Center-1-1-1-1-1.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: text(
                            title: 'Godophin Stables',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_rate,
                          color: Colors.amber,
                          size: 15,
                        ),
                        label: text(
                            title: '4.0', fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                  Container(
                    width: width * 0.50,
                    // color: Colors.red,
                    child: text(
                        title: '288 McQlure Court, Arkansas',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 15,
                      ),
                      label: text(
                          title: '1.2 Km', fontSize: 15, color: Colors.black)),
                  text(
                      title: 'Services: Water,juice and Break 10 munit',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  text(
                      title: 'Total : 450 AED',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                  SizedBox(
                    height: height * 0.015,
                  ),
                ],
              ),
            ),
            Divider(
              color: Color4,
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                text(
                    title: "Coach",
                    color: Color0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                ListTile(
                  leading: Container(
                    width: 70,
                    // height: 100,
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
                          // scale: 30,
                          image: AssetImage(
                            'assets/images/james-person-1.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text(
                      title: "Mohammed",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(3, 2, 3, 1),
                    ),
                  ),
                  onTap: () {
                    // تنفيذ الإجراء عند النقر على السطر
                    print('تم النقر على السطر');
                  },
                ),
              ],
            ),
            Divider(
              color: Color4,
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                text(
                    title: "Servic",
                    color: Color0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                ListTile(
                  leading: Container(
                    width: 70,
                    // height: 100,
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
                          // scale: 30,
                          image: AssetImage(
                            'assets/images/paralympic equestrian-cuate.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text(
                      title: "jumping",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(3, 2, 3, 1),
                    ),
                  ),
                  onTap: () {
                    // تنفيذ الإجراء عند النقر على السطر
                    print('تم النقر على السطر');
                  },
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Divider(
              color: Color4,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            text(
                title: "Booking history",
                color: Color0,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            Container(
              width: width,
              height: height * 0.6,
              child: ListView.separated(
                  shrinkWrap: false,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext, int) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width,
                        height: height * 0.1239,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                // onPressed: () {},
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.date_range, color: Colors.white),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    text(
                                        title:
                                            'Friday, 25 August 2023 @ 8:30 AM',
                                        fontSize: 18,
                                        color: Colors.white),
                                  ],
                                ),
                                // style: ElevatedButton.styleFrom(

                                //     // backgroundColor: secondaryColor,
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(25)),
                                //     padding:
                                //         EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                              ),
                            ),
                            Row(
                              children: [
                                Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: text(title: "Confirmation"),
                                            content: text(
                                                title:
                                                    "Are you sure you want to cancel the booking?"),
                                            actions: [
                                              TextButton(
                                                child: text(
                                                    title: "Yes",
                                                    color: Colors.brown),
                                                onPressed: () {
                                                  // Perform the cancellation of booking here
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog after pressing "Yes"
                                                },
                                              ),
                                              TextButton(
                                                child: text(
                                                    title: "No",
                                                    color: Colors.green),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog after pressing "No"
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: text(title: "Cancel"))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext, int) {
                    return Divider();
                  },
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
