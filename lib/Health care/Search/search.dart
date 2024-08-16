import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Health%20care/Search/cubit/search_cubit.dart';
import 'package:thi/Health%20care/deatils/deatils.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

import 'package:animated_search_bar/animated_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SearchCubit.getObject(context);

          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imageBackground))),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: text(title: "Search Health", color: Color4),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: height * 0.061,
                      // ),
                      // text(
                      //   title: "Find and book best services",
                      //   fontSize: 22,
                      //   fontWeight: FontWeight.w700,
                      //   color: Color(0xFF23002C),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedSearchBar(
                          // animationDuration: Duration(milliseconds: 33350),
                          // duration: Duration(milliseconds: 33300),
                          controller: cubit.SeachController,
                          label: "Find and book best services",
                          labelStyle: TextStyle(
                              fontFamily: 'Caveat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {
                            debugPrint('value on Change');
                            print(value.toString() + "OOOOOOOOOOOO");
                            setState(() {
                              // searchText = value;
                            });
                            print(value.toString());
                            cubit.getDataSearch(value.isEmpty ? "0" : value);
                          },
                          onFieldSubmitted: (value) {
                            print(value.toString() + "PPPPPPPPPPPPPPPPPPPPPPP");
                          },
                        ),
                      ),
                      // AnimatedSearchBar(
                      //   animationDuration: Duration(milliseconds: 33350),
                      //   duration: Duration(milliseconds: 33300),
                      //   label: 'Search Something Here',
                      //   controller: cubit.SeachController,
                      //   labelStyle: const TextStyle(fontSize: 16),
                      //   searchStyle: const TextStyle(color: Colors.white),
                      //   cursorColor: Colors.white,
                      //   textInputAction: TextInputAction.done,
                      //   searchDecoration: const InputDecoration(
                      //     hintText: 'Search',
                      //     alignLabelWithHint: true,
                      //     fillColor: Colors.white,
                      //     focusColor: Colors.white,
                      //     hintStyle: TextStyle(color: Colors.white70),
                      //     border: InputBorder.none,
                      //   ),
                      //   onChanged: (value) {
                      //     debugPrint('value on Change');
                      //     // setState(() {
                      //     //   searchText = value;
                      //     // });
                      //     print(value.toString());
                      //     cubit.getDataSearch(value.isEmpty ? "0" : value);
                      //   },
                      //   // onFieldSubmitted: (value) {
                      //   //   debugPrint('value on Field Submitted');
                      //   //   setState(() {
                      //   //     searchText = value;
                      //   //   });
                      //   // }
                      // ),
                      // SeachWidght(
                      //     height: height,
                      //     SeachController: cubit.SeachController,
                      //     cubit: cubit),
                      cubit.SeachController.text.isNotEmpty
                          ? cubit.istoggel
                              ? BestStablesSearchWidght(
                                  height: height,
                                  home1state: state,
                                  width: width,
                                  cubit: cubit)
                              : Container(
                                  height: height * 0.2,
                                  alignment: Alignment.center,
                                  child: text(
                                      title: "Not Found",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center),
                                )
                          : Container(
                              height: height * 0.2,
                              // color: Color0,
                              child: Center(child: SpinkitWave()),
                              // child: BestStablesWidght(
                              //     height: height, width: width, cubit: cubit),
                            ),
                    ],
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

class SeachWidght extends StatelessWidget {
  const SeachWidght({
    super.key,
    required this.height,
    required this.SeachController,
    required this.cubit,
  });

  final double height;
  final TextEditingController SeachController;
  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          Container(
            height: height * 0.07,
            // width: MediaQuery.of(context).size.width *
            //     0.99,
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Search(
              SeachController: SeachController,
              cubit: cubit,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              GestureDetector(
                onTap: () {
                  // cubit.chaingLoading(false);

                  print(SeachController.text +
                      "OOOOOOOOOOOOOOOOOOOOOOOOOOOPPPPPPPPPPPPPPPPPPPIIIIIIIIII");
                  cubit.getDataSearch(SeachController.text.isEmpty
                      ? '0'
                      : SeachController.text);
                  // SeachController.clear();
                  print("search");
                },
                child: cubit.isLoad
                    ? SpinkitWave()
                    : CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 30,
                        child: Icon(
                          Icons.search_rounded,
                          color: Color0,
                          size: 35,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.SeachController,
    required this.cubit,
  });

  final TextEditingController SeachController;
  final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: SeachController,
      onChanged: (value) {
        print(value.toString());
        cubit.getDataSearch(value.isEmpty ? "0" : value);
        // cubit.getDataSearch(search: value);
      },
      decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(5),
          fillColor: Color0,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: LinearGradientColor01),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color0)),
          // prefixIcon: Icon(
          //   Icons.search_rounded,
          //   color: Colors.black,
          // ),
          hintText: "    Search  Stable",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Caveat',
              fontWeight: FontWeight.w600)),
    );
  }
}

class BestStablesSearchWidght extends StatelessWidget {
  const BestStablesSearchWidght({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
    required this.home1state,
  });

  final double height;
  final double width;
  final SearchCubit cubit;
  final SearchState home1state;
  @override
  Widget build(BuildContext context) {
    return home1state is Searchloading
        ? Center(child: shimmerWidght(height, width))
        : Container(
            height: height * 0.80,
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                // reviewRaiting.add(false);
                // print(reviewRaiting.toString() +
                //     "((((((((((((((((((((((9999999999999))))))))))))))))))))))");
                // cubit.getDataGetAverageRevewModel(
                //     cubit.listClubsmodel!.data![i].id!);
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            HealthCenterDetailsScreen(
                          ID_helthCare:
                              cubit.getSearchModel!.healthCares![i].id!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: width * 0.55,
                    height: height * 0.1,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                          Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color0,
                          blurRadius: 5,
                          offset: Offset(3, 5),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      leading: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.17,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: NetworkImage(
                              ImagesPath +
                                  cubit.getSearchModel!.healthCares![i]
                                      .profileImage
                                      .toString(),
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      title: text(
                        title: cubit.getSearchModel!.healthCares![i].name
                            .toString(),
                        color: Color4,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        fontSize: 17,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: text(
                          title: cubit
                              .getSearchModel!.healthCares![i].description
                              .toString(),
                          fontSize: 12,
                          color: Color4,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: cubit.getSearchModel!.healthCares!.length,
            ),
          );
  }

  ///////////////////////////////////////////////////////////////////
  Container shimmerWidght(double width, double height) {
    return Container(
        width: width,
        height: height,
        child: ListView.builder(
          itemBuilder: (BuildContext, int) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ShimerWidght(
                  width: width * 0.2,
                  height: height * 0.3,
                  reduis: 10,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 6),
                  child: ShimerWidght(
                    width: width * 0.02,
                    height: height * 0.02,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 6),
                  child: ShimerWidght(
                    width: width * 0.02,
                    height: height * 0.03,
                  ),
                ),
                // trailing: ShimerWidght(
                //   width: width * 0.2,
                //   height: height * 0.05,
                //   reduis: 30,
                // ),
              ),
            );
          },
          itemCount: 10,
        ));
  }
}

// class BestStablesWidght extends StatelessWidget {
//   const BestStablesWidght({
//     super.key,
//     required this.height,
//     required this.width,
//     required this.cubit,
//   });

//   final double height;
//   final double width;
//   final SearchCubit cubit;

//   @override
//   Widget build(BuildContext context) {
//     return cubit.listClubsmodel == null
//         ? SpinkitWave()
//         : Container(
//             height: height * 0.25,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (_, i) {
//                 // reviewRaiting.add(false);
//                 // reviewRaiting.add(i)
//                 // reviewRaiting.addAll(i, false);
//                 // reviewRaiting[i] = false;
//                 reviewRaiting.addAll({i + 1: false});
//                 print(reviewRaiting.toString() +
//                     "((((((((((((((((((((((9999999999999))))))))))))))))))))))");
//                 // cubit.getDataGetAverageRevewModel(
//                 //     cubit.listClubsmodel!.data![i].id!);
//                 return GestureDetector(
//                   onTap: () {
//                     print(
//                         "999999999999999999999999999999999999999999999999999999");
//                     Navigator.push<void>(
//                       context,
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) => Home(
//                           Id: int.parse(
//                               cubit.listClubsmodel!.data![i].id.toString()),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     width: width * 0.25,
//                     height: height,
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Color0,
//                               blurRadius: 5,
//                               offset: Offset(3, 5))
//                         ]),
//                     child: Stack(
//                       children: [
//                         Container(
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push<void>(
//                                       context,
//                                       MaterialPageRoute<void>(
//                                         builder: (BuildContext context) => Home(
//                                             Id: int.parse(cubit
//                                                 .listClubsmodel!.data![i].id
//                                                 .toString())),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.17,
//                                     decoration: BoxDecoration(
//                                       color: Colors.orange,
//                                       image: DecorationImage(
//                                           image: NetworkImage(
//                                             ImagesPath +
//                                                 cubit.listClubsmodel!.data![i]
//                                                     .profile
//                                                     .toString(),
//                                           ),
//                                           fit: BoxFit.fill),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: text(
//                                             title: cubit
//                                                 .listClubsmodel!.data![i].name
//                                                 .toString(),
//                                             color: Color4,
//                                             fontWeight: FontWeight.bold,
//                                             //  "Al Jiyad Stables",
//                                             overflow: TextOverflow.ellipsis,
//                                             softWrap: true,
//                                             maxLines: 1,
//                                             fontSize: 17),
//                                       ),
//                                     ),
//                                     // TextButton.icon(
//                                     //     onPressed: () {},
//                                     //     icon: Icon(
//                                     //       Icons.star_rate,
//                                     //       color: Colors.amber,
//                                     //     ),
//                                     //     label: text(
//                                     //       title: cubit.getAverageRevewModel!
//                                     //           .averageRating
//                                     //           .toString(),
//                                     //       color: Colors.black,
//                                     //     ))
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: text(
//                                     title: cubit
//                                         .listClubsmodel!.data![i].description
//                                         .toString(),
//                                     // "288 McClure Court, Arkansasgffrehhhheeeeee",
//                                     fontSize: 12,
//                                     color: Color4,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     maxLines: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         // Positioned(
//                         //   child: InkWell(
//                         //     onTap: (() {
//                         //       Navigator.push<void>(
//                         //         context,
//                         //         MaterialPageRoute<void>(
//                         //           builder: (BuildContext context) =>
//                         //               BookingScreen(),
//                         //         ),
//                         //       );
//                         //     }),
//                         //     child: Container(
//                         //       padding: EdgeInsets.symmetric(
//                         //           vertical: 5, horizontal: 10),
//                         //       decoration: BoxDecoration(
//                         //           color: Colors.white,
//                         //           border: Border.all(color: Colors.grey),
//                         //           borderRadius: BorderRadius.only(
//                         //               bottomRight: Radius.circular(10),
//                         //               topLeft: Radius.circular(10))),
//                         //       child: text(
//                         //         title: "Book",
//                         //         fontSize: 14,
//                         //       ),
//                         //     ),
//                         //   ),
//                         //   bottom: 0,
//                         //   right: 0,
//                         // ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               itemCount: cubit.listClubsmodel!.data!.length,
//             ),
//           );
//   }
// }
