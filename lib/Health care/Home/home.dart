import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Health%20care/Home/cubit/home_helth_care_cubit.dart';
import 'package:thi/Health%20care/Search/search.dart';
import 'package:thi/Health%20care/deatils/deatils.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class HealthCenter {
  final String name;
  final String location;
  final String imageUrl;
  final List<String>? reviews;
  HealthCenter({
    required this.name,
    required this.location,
    required this.imageUrl,
    this.reviews,
  });
}

class HomeHealth extends StatefulWidget {
  const HomeHealth({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeHealth> {
  final List<HealthCenter> healthCenters = [
    HealthCenter(
      name: 'Health Center 1',
      location: 'City 1',
      imageUrl: 'assets/images/08F30214-35C7-4649-87DC-CA789BD029E9.jpeg',
      reviews: ['Review 1', 'Review 2', 'Review 3'],
    ),
    HealthCenter(
      name: 'Health Center 2',
      location: 'City 2',
      imageUrl:
          'assets/images/49772470_1779640922140641_3989261213316939776_n.jpg',
      reviews: ['Review 1', 'Review 2', 'Review 3'],
    ),
    HealthCenter(
      name: 'Health Center 3',
      location: 'City 3',
      imageUrl: 'assets/images/5098150942_edd833a6d7_b.jpg',
      reviews: ['Review 1', 'Review 2', 'Review 3'],
    ),
    HealthCenter(
      name: 'Health Center 4',
      location: 'City 4',
      imageUrl: 'assets/images/clinic18.jpg',
      reviews: ['Review 1', 'Review 2', 'Review 3'],
    ),
    HealthCenter(
      name: 'Health Center 4',
      location: 'City 4',
      imageUrl: 'assets/images/clinic18.jpg',
      reviews: ['Review 1', 'Review 2', 'Review 3'],
    ),
    HealthCenter(
      name: 'Health Center 4',
      location: 'City 4',
      imageUrl: 'assets/images/clinic18.jpg',
      reviews: ['Review 1', 'Review 2', 'Review 3'],
    ),
    // You can add more health centers here
  ];

  int currentIndex = 0;
  final List<String> images = [
    'assets/images/clinic18.jpg',
    'assets/images/gp-bargersville-veterinary-hospital-storefront.png',
    'assets/images/08F30214-35C7-4649-87DC-CA789BD029E9.jpeg',
    'assets/images/49772470_1779640922140641_3989261213316939776_n.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => HomeHelthCareCubit()
        ..getHomeHelthCare()
        ..getHomeHelthOffers(),
      child: BlocConsumer<HomeHelthCareCubit, HomeHelthCareState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeHelthCareCubit.getObject(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title:
                      text(title: "Health Center", color: Color4, fontSize: 24),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => SearchPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.search))
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      cubit.alloffersModel == null
                          ? Container()
                          : cubit.alloffersModel!.offers == null
                              ? Container()
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.26,
                                  width: double.infinity,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      reverse: true,
                                      height: height * 0.29,
                                      autoPlay: true,
                                      aspectRatio: 3,
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndex = index;
                                          print(currentIndex.toString());
                                        });
                                      },
                                    ),
                                    items: cubit.alloffersModel!.offers!
                                        .map(
                                          (offer) => Stack(
                                            alignment: AlignmentDirectional
                                                .bottomStart,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                clipBehavior: Clip.antiAlias,
                                                child: Image.network(
                                                  ImagesPath +
                                                      offer.image.toString(),
                                                  height: height * 0.25,
                                                  width: double.infinity,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: height * 0.09,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: text(
                                                                title:
                                                                    "${offer.name}",
                                                                color: Color0,
                                                                fontSize: 20),
                                                          ),
                                                          Expanded(
                                                            child: text(
                                                                title:
                                                                    "${offer.offerValue}% OFF",
                                                                color: Color3,
                                                                fontSize: 15),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        text(
                                                            title: "  Begin: ",
                                                            color: Color0,
                                                            fontSize: 15),
                                                        Expanded(
                                                          child: text(
                                                              title:
                                                                  "${offer.begin}",
                                                              color: Color3,
                                                              fontSize: 15),
                                                        ),
                                                        text(
                                                            title: "  end: ",
                                                            color: Color0,
                                                            fontSize: 15),
                                                        Expanded(
                                                          child: text(
                                                              title:
                                                                  "${offer.end}",
                                                              color: Color3,
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    color:
                                                        Color4.withOpacity(0.5),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            bottomRight: Radius
                                                                .circular(
                                                                    15.0))),
                                              )
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Best Health Centers",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      cubit.healthCaresModel == null
                          ? CircularProgressIndicator()
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(16),
                              itemCount:
                                  cubit.healthCaresModel!.healthCares!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    // تنفيذ الإجراء المطلوب عند النقر على المركز الصحي
                                    // مثلاً، فتح صفحة تفاصيل المركز الصحي
                                    ////////////////////////////////////////////////////////////////////////////////////////
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HealthCenterDetailsScreen(
                                          ID_helthCare: cubit.healthCaresModel!
                                              .healthCares![index].id!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: NetworkImage(ImagesPath +
                                            cubit
                                                .healthCaresModel!
                                                .healthCares![index]
                                                .profileImage
                                                .toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 16,
                                          left: 16,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              cubit.healthCaresModel!
                                                  .healthCares![index].name
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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
