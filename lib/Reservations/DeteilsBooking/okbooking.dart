import 'package:flutter/material.dart';
import 'package:thi/Reservations/Home/main_screen.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class OkBooking extends StatefulWidget {
  const OkBooking({super.key});

  @override
  State<OkBooking> createState() => _OkBookingState();
}

class _OkBookingState extends State<OkBooking> {
  @override
  Widget build(BuildContext context) {
    double Heith = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageBackground), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Color0,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: text(title: 
                'Book Appointment',
                
                  color: Color0,
                  fontSize: 20,
       
                  fontWeight: FontWeight.w700,
              
              ),
              toolbarHeight: 30,
            ),
            SizedBox(
              height: Heith * 0.02,
            ),
            Center(
              child: Container(
                width: Width * 0.7,
                height: Heith * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Service 24_7-amico.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Heith * 0.30,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  countinueApp();
                },
                child: Container(
                  height: Heith * 0.06,
                  width: 311,
                  // onPressed: () {
                  //   countinueApp();
                  // },
                  decoration: BoxDecoration(
                      color: Color0, borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: text(title: 'Continue with Credit Card',
                        textAlign: TextAlign.center,
                      
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //     // backgroundColor: secondaryColor,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25)),
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  countinueApp() {
    var d = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.60,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Color0.withOpacity(0.5),
              child: Icon(
                Icons.done_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            text(title: 
              "Your appointment booking \n is successfully",
              
                  fontSize: 20, color: Color0, fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            text(title: 
              "You can view the appointment booking info \n in the \"Appointment\" Section",
              fontSize: 15, color: Colors.grey,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => MainScreen(),
                  ),
                );
              },
              child: Container(
                width: 280,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0), color: Color0),
                // onPressed: () {},
                child: text(title: 'Countinue Booking',
                    
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                // style: ElevatedButton.styleFrom(
                //     backgroundColor: secondaryColor,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(25)),
                //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            text(title: 
              "Go to appointment",
         fontSize: 15, color: Colors.black54,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    showDialog(context: context, builder: (_) => d);
  }
}
