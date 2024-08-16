import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/DetlisHours/detailsHoroses.dart';
import 'package:thi/Auction/FaviorteSceen/cubit/favorite_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool shimmmer = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => FavoriteCubit()
        ..getFavorite()
        ..configurePusher1(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = FavoriteCubit.getObject(context);
          // cubit.getFavorite();
          return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                toolbarHeight: 70,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: text(
                    title: 'Favorite',
                    color: Color0,
                    fontSize: 22,
                    fontWeight: FontWeight.w900),
              ),
              body: cubit.getFavoriteModel == null
                  ? Container(
                      width: width,
                      height: height,
                      child: ListView.builder(
                        itemBuilder: (BuildContext, int) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimerWidght(
                                  width: width * 0.90,
                                  height: height * 0.2,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                ShimerWidght(
                                  width: width * 0.50,
                                  height: height * 0.028,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                ShimerWidght(
                                  width: width * 0.40,
                                  height: height * 0.028,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                ShimerWidght(
                                  width: width * 0.30,
                                  height: height * 0.028,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                ShimerWidght(
                                  width: width * 0.450,
                                  height: height * 0.028,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      ShimerWidght(
                                        width: width * 0.250,
                                        height: height * 0.028,
                                      ),
                                      Spacer(),
                                      ShimerWidght(
                                        width: width * 0.250,
                                        height: height * 0.03,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: 6,
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.84,
                      child: ListView.builder(
                        itemCount:
                            cubit.getFavoriteModel!.favoriteAuctions!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      DetailsHoeoses(
                                    IDActions: cubit
                                        .getFavoriteModel!
                                        .favoriteAuctions![index]
                                        .horses!
                                        .auctionId!,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.44,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Color0.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.21,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(ImagesPath +
                                              cubit
                                                  .getFavoriteModel!
                                                  .favoriteAuctions![index]
                                                  .horses!
                                                  .images![0]
                                                  .toString()),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text(
                                              title: cubit
                                                  .getFavoriteModel!
                                                  .favoriteAuctions![index]
                                                  .description
                                                  .toString(),
                                              color: Color0,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Name : ',
                                                  style: TextStyle(
                                                    color: Color0,
                                                    fontSize: 14,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: cubit
                                                      .getFavoriteModel!
                                                      .favoriteAuctions![index]
                                                      .horses!
                                                      .name
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Color : ',
                                                  style: TextStyle(
                                                    color: Color0,
                                                    fontSize: 14,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: cubit
                                                      .getFavoriteModel!
                                                      .favoriteAuctions![index]
                                                      .horses!
                                                      .color
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Gender : ',
                                                  style: TextStyle(
                                                    color: Color0,
                                                    fontSize: 14,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: cubit
                                                      .getFavoriteModel!
                                                      .favoriteAuctions![index]
                                                      .horses!
                                                      .gender
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Birth Date : ',
                                                  style: TextStyle(
                                                    color: Color0,
                                                    fontSize: 14,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: cubit
                                                      .getFavoriteModel!
                                                      .favoriteAuctions![index]
                                                      .horses!
                                                      .birth
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Row(
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Price : ',
                                                      style: TextStyle(
                                                        color: Color0,
                                                        fontSize: 14,
                                                        fontFamily: 'Caveat',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: cubit
                                                              .getFavoriteModel!
                                                              .favoriteAuctions![
                                                                  index]
                                                              .initialPrice
                                                              .toString() +
                                                          " AED",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontFamily: 'Caveat',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ));
        },
      ),
    );
  }
}
