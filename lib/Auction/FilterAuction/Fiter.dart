import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int selectedValue = 1;

  bool f1 = false;

  bool f2 = false;
  bool f3 = false;
  bool f4 = false;
  bool f5 = false;
  bool f6 = false;
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  double rate = 0.0;
  List gender = ["Man", "Woman"];
  String currentGenger = "Man";
  String selectSort = "";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageBackground), fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: text(
                            title: "Cancel",
                            textAlign: TextAlign.center,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      text(
                          title: "Filters",
                          fontSize: 24,
                          color: Color0,
                          fontWeight: FontWeight.bold),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              // ignore: unused_local_variable
                              bool f1 = false;

                              f2 = false;
                              f3 = false;
                              f4 = false;
                              f5 = false;
                              f6 = false;
                              p1 = false;
                              p2 = false;
                              p3 = false;
                              rate = 0.0;
                              rating = 0.0;

                              currentGenger = "Man";
                              selectSort = "";
                            });
                          },
                          child: text(
                            title: 'Reset',
                            textAlign: TextAlign.center,
                            fontSize: 18,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        title: 'Services',
                        color: Color0,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ChoiceChip(
                                label: text(
                                    title: 'horse training',
                                    color: Color4,
                                    fontSize: 16),
                                onSelected: (bool selected) {
                                  setState(() {
                                    f1 = selected;
                                  });
                                },
                                selected: f1,
                                selectedColor: Color0,
                                disabledColor: LinearGradientColor03,
                                selectedShadowColor: LinearGradientColor02,
                                backgroundColor: LinearGradientColor03,
                                side: BorderSide(color: LinearGradientColor02),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * .0410,
                              ),
                              ChoiceChip(
                                label: text(title: 'Stable', color: Color4),
                                onSelected: (bool selected) {
                                  setState(() {
                                    f2 = selected;
                                  });
                                },
                                selected: f2,
                                selectedColor: Color0,
                                disabledColor: LinearGradientColor03,
                                selectedShadowColor: LinearGradientColor02,
                                backgroundColor: LinearGradientColor03,
                                side: BorderSide(color: LinearGradientColor02),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * .0410,
                              ),
                              ChoiceChip(
                                label: text(
                                    title: 'horse training 1', color: Color4),
                                onSelected: (bool selected) {
                                  setState(() {
                                    f3 = selected;
                                  });
                                },
                                selected: f3,
                                selectedColor: Color0,
                                disabledColor: LinearGradientColor03,
                                selectedShadowColor: LinearGradientColor02,
                                backgroundColor: LinearGradientColor03,
                                side: BorderSide(color: LinearGradientColor02),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ChoiceChip(
                                label: text(title: 'training', color: Color4),
                                onSelected: (bool selected) {
                                  setState(() {
                                    f4 = selected;
                                  });
                                },
                                selected: f4,
                                selectedColor: Color0,
                                disabledColor: LinearGradientColor03,
                                selectedShadowColor: LinearGradientColor02,
                                backgroundColor: LinearGradientColor03,
                                side: BorderSide(color: LinearGradientColor02),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * .0410,
                              ),
                              ChoiceChip(
                                label: text(
                                    title: 'horse training 1', color: Color4),
                                onSelected: (bool selected) {
                                  setState(() {
                                    f5 = selected;
                                  });
                                },
                                selected: f5,
                                selectedColor: Color0,
                                disabledColor: LinearGradientColor03,
                                selectedShadowColor: LinearGradientColor02,
                                backgroundColor: LinearGradientColor03,
                                side: BorderSide(color: LinearGradientColor02),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * .0410,
                              ),
                              ChoiceChip(
                                label: text(
                                    title: 'horse training 1', color: Color4),
                                onSelected: (bool selected) {
                                  setState(() {
                                    f6 = selected;
                                  });
                                },
                                selected: f6,
                                selectedColor: Color0,
                                disabledColor: LinearGradientColor03,
                                selectedShadowColor: LinearGradientColor02,
                                backgroundColor: LinearGradientColor03,
                                side: BorderSide(color: LinearGradientColor02),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      text(
                        title: "Rating",
                        fontSize: 18,
                        color: Color0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          // RatingBar(

                          //   ratingWidget: RatingWidget(
                          //       full: Icon(
                          //         Icons.star_sharp,
                          //         color: Colors.amber,
                          //       ),
                          //       empty: Icon(
                          //         Icons.star_border_purple500_sharp,
                          //         color: Colors.grey,
                          //       ),
                          //       half: Icon(
                          //         Icons.star_half_sharp,
                          //         color: Colors.amber,
                          //       )),
                          //   onRatingUpdate: (star) {
                          //     setState(() {
                          //       rate = star;
                          //     });
                          //   },
                          //   allowHalfRating: true,
                          //   itemCount: 5,
                          //   initialRating: rate,
                          //   glow: true,
                          //   itemSize:35,

                          // ),

                          SmoothStarRating(
                            borderColor: Color4,
                            color: LinearGradientColor01,
                            rating: rating,
                            // isReadOnly: false,
                            size: 30,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            starCount: 5,
                            allowHalfRating: true,
                            spacing: 2.0,
                            onRatingChanged: (v) {
                              setState(() {
                                rating = v;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          text(
                            title: rating.toString() + " Star",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                            fontSize: 17,
                            color: Colors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      text(
                        title: "Gender",
                        fontSize: 18,
                        color: Color0,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // text(
                            //     title: "Gender",
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w400,
                            //     color: Color.fromRGBO(0, 0, 0, 0.5)),
                            Container(
                              width: 100,
                              // أو Flexible
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                activeColor: LinearGradientColor02,
                                // tileColor: Colors.red,

                                title: text(
                                  title: 'Male',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                value: 1,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as int;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 110,
                              // أو Flexible
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                activeColor: LinearGradientColor02,
                                title: text(
                                  title: 'Woman',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                value: 2,
                                // contentPadding: EdgeInsets.zero,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as int;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.03),
                      // text(
                      //   title: "Sort by",
                      //   fontSize: 18,
                      //   color: Color0,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.02,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       selectSort = "s1";
                      //     });
                      //   },
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         text(
                      //           title: "Most Popular",
                      //           fontSize: 18,
                      //           color:
                      //               selectSort == "s1" ? Color0 : Colors.black,
                      //         ),
                      //         selectSort == "s1"
                      //             ? Icon(
                      //                 Icons.done,
                      //                 color: Color0,
                      //               )
                      //             : Container(),
                      //       ]),
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.02,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       selectSort = "s3";
                      //     });
                      //   },
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         text(
                      //           title: "Cost Low to High",
                      //           fontSize: 18,
                      //           color:
                      //               selectSort == "s3" ? Color0 : Colors.black,
                      //         ),
                      //         selectSort == "s3"
                      //             ? Icon(
                      //                 Icons.done,
                      //                 color: Color0,
                      //               )
                      //             : Container(),
                      //       ]),
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.02,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       selectSort = "s2";
                      //     });
                      //   },
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         text(
                      //             title: "Cost High to Low",
                      //             fontSize: 18,
                      //             color: selectSort == "s2"
                      //                 ? Color0
                      //                 : Colors.black),
                      //         selectSort == "s2"
                      //             ? Icon(
                      //                 Icons.done,
                      //                 color: Color0,
                      //               )
                      //             : Container(),
                      //       ]),
                      // ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      text(
                        title: "Price",
                        fontSize: 18,
                        color: Color0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: p1 ? Color0 : LinearGradientColor02,
                                    border: Border.all(
                                        color: LinearGradientColor03),
                                    boxShadow: [
                                      BoxShadow(
                                        color: p1
                                            ? LinearGradientColor02.withOpacity(
                                                0.5)
                                            : Colors.transparent,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Material(
                                      color:
                                          p1 ? Color0 : LinearGradientColor03,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            p1 = !p1;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              text(
                                                title: '10 AED',
                                                color: Color4,
                                                fontSize: 16,
                                              ),
                                              SizedBox(height: 5),
                                              Icon(
                                                Icons.check,
                                                color: p1
                                                    ? Color4
                                                    : Colors.transparent,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: p2 ? Color0 : LinearGradientColor02,
                                    border: Border.all(
                                        color: LinearGradientColor03),
                                    boxShadow: [
                                      BoxShadow(
                                        color: p2
                                            ? LinearGradientColor02.withOpacity(
                                                0.5)
                                            : Colors.transparent,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Material(
                                      color:
                                          p2 ? Color0 : LinearGradientColor03,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            p2 = !p2;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              text(
                                                title: '20 AED',
                                                color: Color4,
                                              ),
                                              SizedBox(height: 5),
                                              Icon(
                                                Icons.check,
                                                color: p2
                                                    ? Color4
                                                    : Colors.transparent,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: p3 ? Color0 : LinearGradientColor02,
                                    border: Border.all(
                                        color: LinearGradientColor03),
                                    boxShadow: [
                                      BoxShadow(
                                        color: p3
                                            ? LinearGradientColor02.withOpacity(
                                                0.5)
                                            : Colors.transparent,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Material(
                                      color:
                                          p3 ? Color0 : LinearGradientColor03,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            p3 = !p3;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              text(
                                                title: '30 AED',
                                                color: Color4,
                                              ),
                                              SizedBox(height: 5),
                                              Icon(
                                                Icons.check,
                                                color: p3
                                                    ? Color4
                                                    : Colors.transparent,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                                color: Color0,
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.center,
                            child: text(
                                title: 'Apply Filter',
                                color: Colors.black,
                                fontSize: 20)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
