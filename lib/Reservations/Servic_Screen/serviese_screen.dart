import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  import 'package:thi/Theme/app_them.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class ServieseScreen extends StatefulWidget {
  const ServieseScreen({Key? key}) : super(key: key);

  @override
  State<ServieseScreen> createState() => _ServieseScreenState();
}

class _ServieseScreenState extends State<ServieseScreen> {
  // ignore: unused_field
  int _page = 0;
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img.png'),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text(
                          title: "Hello, John Doe",
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notification_add_outlined,
                                  color: Color0,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.filter_alt,
                                  color: Color0,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                text(
                  title: "Your location",
                  fontSize: 12,
                  color: Color(0x66000000),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          label: text(
                            title: "Abu Dhabi",
                            fontSize: 12,
                            color: Colors.black,
                          )),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.arrow_up_right_diamond,
                            color: Colors.black,
                          ),
                          label: text(
                            title: "CHANGE",
                            fontSize: 12,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        // contentPadding: EdgeInsets.all(5),
                        fillColor: Color0,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Color0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Color0)),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                        ),
                        suffixIcon: const Icon(
                          Icons.settings_voice_sharp,
                          color: Colors.black,
                        ),
                        hintText: "Search Flat race, Pony and Stable",
                        hintStyle:
                            const TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                      title: 'Trainer specialists',
                      color: Color(0xFF5A0072),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    text(
                      title: "View all",
                      fontSize: 14,
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                padding: const EdgeInsets.all(3),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey)),
                                child: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/img_16.png'),
                                )),
                            text(
                              title: category[i]['text'],
                              fontSize: 13,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: category.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                      title: "Popular Stables nearby",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color0,
                    ),
                    text(
                      title: "View all",
                      fontSize: 14,
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return Container(
                        width: 230,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                  color: Color(0x80BE8FFF),
                                  blurRadius: 5,
                                  offset: Offset(3, 5))
                            ]),
                        child: Stack(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 230,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/img_15.png"),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      text(
                                        title: "Al Jiyad Stables",
                                        fontSize: 15,
                                      ),
                                      TextButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.star_rate,
                                          color: Colors.amber,
                                        ),
                                        label: text(
                                            title: '5.0', color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: text(
                                      title:
                                          "288 McClure Court, Arkansasgffrehhhheeeeee",
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push<void>(
                                  //   context,
                                  //   MaterialPageRoute<void>(
                                  //     builder: (BuildContext context) =>
                                  //         BookingScreen(),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(10))),
                                  child: text(
                                    title: "Book",
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              bottom: 0,
                              right: 0,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: category.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: const Drawer(),
        bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          height: 75.0,
          items: <Widget>[
            const Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.grey,
            ),
            const Icon(
              Icons.location_on_outlined,
              size: 30,
              color: Colors.grey,
            ),
            Image.asset(
              'assets/images/img_9.png',
              color: Colors.black,
              height: 35,
              width: 35,
            ),
            Image.asset(
              'assets/images/img_6.png',
              height: 25,
              width: 25,
            ),
            Image.asset(
              'assets/images/img_7.png',
              height: 25,
              width: 25,
            ),
          ],
          color: navBarColor,
          buttonBackgroundColor: Color0,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
              print(index);
            });
          },
          letIndexChange: (index) => false,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.map_outlined,
          ),
        ),
      ),
    );
  }
}
