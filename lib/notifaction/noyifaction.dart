import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
 
import 'ScreenNavaction/Appointement/appointement.dart';
import 'ScreenNavaction/Auction/auction.dart';
import 'ScreenNavaction/HealthCare/healthCare.dart';

class Notifaction extends StatefulWidget {
  const Notifaction({super.key});

  @override
  State<Notifaction> createState() => _NotifactionState();
}

class _NotifactionState extends State<Notifaction> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageBackground), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: text(
              title: "Notifications",
              color: Color0,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ButtonNvaaction(
            //     height: height,
            //     width: width,
            //     title: "FaovoaitrIstable Profile",
            //     titleNumber: "20",
            //     onPressed: () {
            //       Navigator.push<void>(
            //         context,
            //         MaterialPageRoute<void>(
            //           builder: (BuildContext context) => FaovoaitrIstable(),
            //         ),
            //       );
            //     }),
            // ButtonNvaaction(
            //     height: height,
            //     width: width,
            //     title: "Edit Profile",
            //     titleNumber: "20",
            //     onPressed: () {
            //       Navigator.push<void>(
            //         context,
            //         MaterialPageRoute<void>(
            //           builder: (BuildContext context) => EditProfile(),
            //         ),
            //       );
            //     }),
            // ButtonNvaaction(
            //     height: height,
            //     width: width,
            //     title: "Cahnge PassWord",
            //     titleNumber: "20",
            //     onPressed: () {
            //       Navigator.push<void>(
            //         context,
            //         MaterialPageRoute<void>(
            //           builder: (BuildContext context) =>
            //               ChangPasswordProfileApp(),
            //         ),
            //       );
            //     }),
            ButtonNvaaction(
                height: height,
                width: width,
                title: "Appointment Horse",
                titleNumber: "20",
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Appointement(),
                    ),
                  );
                }),
            ButtonNvaaction(
              height: height,
              width: width,
              title: "Auction",
              titleNumber: "2",
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AuctionNav(),
                  ),
                );
              },
            ),
            ButtonNvaaction(
              height: height,
              width: width,
              title: "Healthcare",
              titleNumber: "5",
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HealthCare(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  // "Auction"
  //  " Healthcare "// "Appointment Horse"
  Container ButtonNvaaction(
      {required double height,
      required double width,
      required String title,
      required String titleNumber,
      required void Function()? onPressed}) {
    return Container(
      height: height * 0.08,
      width: width,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * 0.7, height * 0.055),
                  backgroundColor: Color0),
              child: text(title: title, color: Color3)),
          Column(
            children: [
              Container(
                width: width * 0.1,
                height: height * 0.04,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Color4),
                child: text(title: titleNumber, color: Color3),
              ),
              SizedBox(
                height: height * 0.03,
              )
            ],
          )
        ],
      ),
    );
  }
}
