import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
 

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          imageBackground,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Color1,
              ),
            ),
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                Container(
                    alignment: Alignment.center,
                    child: text(
                        title: "Menu",
                        color: Color1,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  thickness: 1,
                  color: Color.fromRGBO(50, 52, 70, 1),
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonMenu(context: context, data: "Profile", image: "account"),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                    context: context,
                    data: "Terms & Conditions",
                    image: "fotor_2023-3-13_0_38_11"),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                    context: context,
                    data: "Account Settings",
                    image: "fotor_2023-3-13_0_50_19"),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                    context: context,
                    data: "Set Language",
                    image: "world-wide-web"),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                    context: context,
                    data: "Change Password",
                    image: "reset-password"),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Privacy Policy",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                    context: context,
                    data: "Frequently Asked Questions",
                    image: "fotor_2023-3-13_1_2_36"),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Share this app",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                    context: context, data: "Rate this app", image: "star"),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Contact US",
                  image: "fotor_2023-4-2_10_51_16",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                    context: context,
                    data: "Sign Out",
                    image: "fotor_2023-4-2_10_51_16",
                    onTap: () {
                      print("object");
                    }),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Watchlist",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Todays Auctions",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Payments",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Deposite",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Help Center",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "About US",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "Notifications",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonMenu(
                  context: context,
                  data: "General",
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
