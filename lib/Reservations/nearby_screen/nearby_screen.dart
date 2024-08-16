import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Reservations/Filter/filters.dart';
import 'package:thi/Reservations/Details_Club/Home.dart';
import 'package:thi/Reservations/nearby_screen/cubit/neabry_screen_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/notifaction/noyifaction.dart';

// ignore: must_be_immutable
class NearbyScreen extends StatelessWidget {
  // ignore: unused_field
  final int IdCategoires;
  // ignore: unused_field
  int _page = 0;
  int selected_page = 0;
  TextEditingController SearchController = TextEditingController();
  bool selectService = false;

  NearbyScreen({super.key, required this.IdCategoires});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeabryScreenCubit()..getDateGaregories(IdCategoires),
      child: BlocConsumer<NeabryScreenCubit, NeabryScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = NeabryScreenCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(10),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: AppBarWidght(width: width),
                    ),
                    Divider(
                      color: Color3,
                      thickness: 2,
                    ),
                    // Loacation(),
                    // SizedBox(
                    //   height: height * 0.03,
                    // ),
                    // SearchWidght(
                    //     height: height, SearchController: SearchController),
                    // SizedBox(
                    //   height: height * 0.03,
                    // ),
                    // Topservices(),
                    // TopservicesWidghtCatagory(height: height, cubit: cubit),
                    // SizedBox(
                    //   height: height * 0.03,
                    // ),
                    // PopularStablesNearby(),
                    PopularStablesNearbyWidght(
                        height: height, width: width, cubit: cubit),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    // SpecialPackageOffers(),
                    // SizedBox(
                    //   height: height * 0.01,
                    // ),
                    // SpecialPackageOffersWidght(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SpecialPackageOffersWidght extends StatelessWidget {
  const SpecialPackageOffersWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
                color: Color(0x80BE8FFF), blurRadius: 8, offset: Offset(3, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/5098150942_edd833a6d7_b.jpg"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 185,
                      child: text(
                          title: "LOOK AWESOME & SAVE MORE DISCOUNT",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Spacer(),
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          text(
                            title: "Book Now",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(239, 191, 255, 1),
                          ),
                          text(
                            title: "250 AED",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    title: '5.0',
                    color: Colors.black,
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: text(
              title: "288 McClure Court, Arkansasgffrehhhheeeeee",
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialPackageOffers extends StatelessWidget {
  const SpecialPackageOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          title: "Special package & offers",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color0,
        ),
        TextButton(
          onPressed: () {},
          child: text(
            title: "View all",
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class PopularStablesNearbyWidght extends StatelessWidget {
  const PopularStablesNearbyWidght({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
  });

  final double height;
  final double width;
  final NeabryScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return cubit.clubIDCategoriesModel == null
        ? SpinkitWave()
        : Container(
            height: height * 0.780,
            child: cubit.clubIDCategoriesModel!.clubs == null
                ? Center(
                    child: text(title: "Not found Clubs"),
                  )
                : GridView.builder(
                    // scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // تحديد عدد الأعمدة هنا
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio:
                          0.8, // تحديد نسبة العرض إلى الارتفاع هنا
                    ),
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => Home(
                                  Id: int.parse(cubit
                                      .clubIDCategoriesModel!.clubs![i].id
                                      .toString())),
                            ),
                          );
                        },
                        child: Container(
                          // تعديل العرض والارتفاع هنا
                          width: width * 0.4,
                          height: height * 0.05,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(71, 181, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(40, 168, 253, 1),
                                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                                Color.fromRGBO(
                                    199, 255, 255, 1), // اللون المتناسق
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.6,
                                      height: height * 0.15,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            ImagesPath +
                                                cubit.clubIDCategoriesModel!
                                                    .clubs![i].profile
                                                    .toString(),
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        text(
                                          title: cubit.clubIDCategoriesModel!
                                              .clubs![i].name
                                              .toString(),
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        // TextButton.icon(
                                        //   onPressed: () {},
                                        //   icon: const Icon(
                                        //     Icons.star_rate,
                                        //     color: Colors.amber,
                                        //   ),
                                        //   label: text(
                                        //     title: '5.0',
                                        //     color: Colors.black,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: text(
                                        title: cubit.clubIDCategoriesModel!
                                            .clubs![i].description
                                            .toString(),
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        color: Colors.white60,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Positioned(
                              //   child: InkWell(
                              //     onTap: () {
                              //       Navigator.push<void>(
                              //         context,
                              //         MaterialPageRoute<void>(
                              //           builder: (BuildContext context) =>
                              //               BookingScreen(),
                              //         ),
                              //       );
                              //     },
                              //     child: Container(
                              //       padding: const EdgeInsets.symmetric(
                              //         vertical: 5,
                              //         horizontal: 10,
                              //       ),
                              //       decoration: BoxDecoration(
                              //         color: Colors.white,
                              //         border: Border.all(color: Colors.grey),
                              //         borderRadius: const BorderRadius.only(
                              //           bottomRight: Radius.circular(10),
                              //           topLeft: Radius.circular(10),
                              //         ),
                              //       ),
                              //       child: text(
                              //         title: "Book",
                              //         fontSize: 14,
                              //       ),
                              //     ),
                              //   ),
                              //   bottom: 0,
                              //   right: 0,
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.clubIDCategoriesModel!.clubs!.length,
                  ),
          );
  }
}

class PopularStablesNearby extends StatelessWidget {
  const PopularStablesNearby({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          title: "Popular Stables nearby",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color0,
        ),
        TextButton(
            onPressed: () {},
            child: text(
              title: "View all",
              fontSize: 14,
            )),
      ],
    );
  }
}

class TopservicesWidghtCatagory extends StatelessWidget {
  const TopservicesWidghtCatagory({
    super.key,
    required this.height,
    required this.cubit,
  });

  final double height;
  final NeabryScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return Container(
            // height: MediaQuery.of(context).size.height * 0.99,
            width: MediaQuery.of(context).size.width * 0.30,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Color0, blurRadius: 5, offset: Offset(0, 5))
                ]),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // setState(() {
                    //   print("LLLLLLLLLLLLLL");

                    //   // Navigator.push<void>(
                    //   //   context,
                    //   //   MaterialPageRoute<void>(
                    //   //     builder: (BuildContext context) =>
                    //   //         MainScreen(pagep: 10),
                    //   //   ),
                    //   // );
                    //   selectService = true;
                    // });
                  },
                  child: Image.asset(
                    cubit.category[i]['image'],
                    width: 40,
                    height: 40,
                  ),
                ),
                text(title: cubit.category[i]['text'], fontSize: 10)
              ],
            ),
          );
        },
        itemCount: cubit.category.length,
      ),
    );
  }
}

class Topservices extends StatelessWidget {
  const Topservices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          title: "Top services",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color0,
        ),
        TextButton(
          onPressed: () {},
          child: text(
            title: "View all",
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class SearchWidght extends StatelessWidget {
  const SearchWidght({
    super.key,
    required this.height,
    required this.SearchController,
  });

  final double height;
  final TextEditingController SearchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: SearchController,
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(5),

            fillColor: LinearGradientColor01,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
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
            // suffixIcon: const Icon(
            //   Icons.settings_voice_sharp,
            //   color: Colors.black,
            // ),
            hintText: "Search Stable",
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black)),
      ),
    );
  }
}

class Loacation extends StatelessWidget {
  const Loacation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}

class AppBarWidght extends StatelessWidget {
  const AppBarWidght({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          text(
              title: "Categories",
              fontSize: 20,
              color: Color0,
              fontWeight: FontWeight.w700),
          // Container(
          //   child: Row(
          //     children: [
          //       Container(
          //         width: width * 0.04,
          //         child: IconButton(
          //             onPressed: () {
          //               Navigator.push<void>(
          //                 context,
          //                 MaterialPageRoute<void>(
          //                   builder: (BuildContext context) => Notifaction(),
          //                 ),
          //               );
          //             },
          //             icon: Icon(
          //               Icons.notifications_none_outlined,
          //               color: Color0,
          //               size: 33,
          //             )),
          //       ),
          //       // CircleAvatar(
          //       //   radius: 7,
          //       //   backgroundColor: LinearGradientColor02,
          //       // ),
          //       // CircleAvatar(
          //       //   radius: 5,
          //       //   backgroundColor: Colors.red,
          //       // ),
          //       SizedBox(
          //         width: width * 0.05,
          //       ),
          //       IconButton(
          //           onPressed: () {
          //             Navigator.of(context)
          //                 .push(MaterialPageRoute(builder: (_) => Filters()));
          //           },
          //           icon: Icon(
          //             Icons.filter_alt,
          //             color: Color0,
          //             size: 32,
          //           ))
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
  // trenner
                    // selectService
                    //     ? Container(
                    //         height: 130,
                    //         child: ListView.builder(
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (_, i) {
                    //             return Container(
                    //               child: Column(
                    //                 children: [
                    //                   Container(
                    //                       height: 60,
                    //                       width: 60,
                    //                       padding: const EdgeInsets.all(3),
                    //                       margin: const EdgeInsets.symmetric(
                    //                           horizontal: 6, vertical: 15),
                    //                       decoration: BoxDecoration(
                    //                           color: Colors.white,
                    //                           shape: BoxShape.circle,
                    //                           border: Border.all(color: Colors.grey)),
                    //                       child: const CircleAvatar(
                    //                         backgroundImage: AssetImage(
                    //                             'assets/images/img_16.png'),
                    //                       )),
                    //                   Text(
                    //                     category[i]['text'],
                    //                     style: const TextStyle(fontSize: 13),
                    //                   )
                    //                 ],
                    //               ),
                    //             );
                    //           },
                    //           itemCount: category.length,
                    //         ),
                    //       )
                    //     : Container(),