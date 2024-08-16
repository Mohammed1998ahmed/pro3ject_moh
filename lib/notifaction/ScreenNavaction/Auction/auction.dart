import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

 import 'Details/details.dart';

class AuctionNav extends StatelessWidget {
  const AuctionNav({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool shimmer = false;
    return Scaffold(
      appBar: AppBar(
        title: text(
            title: "AuctionNav",
            color: Color0,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.99,
        child: shimmer == true
            ? ListView.builder(
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
                          height: height * 0.03,
                        ),
                      ),
                      trailing: ShimerWidght(
                        width: width * 0.2,
                        height: height * 0.05,
                        reduis: 30,
                      ),
                    ),
                  );
                },
                itemCount: 10,
              )
            : ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                // قم بتعيين عدد عناصر القائمة الخاصة بك
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              DetailsHoeosesNav(),
                        ),
                      );
                    },
                    child: Container(
                      width: width,
                      height: height * 0.2,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.40,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/image 112.png"),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              width: width * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                      title: 'Fayrouza Bent Mashhoure',
                                      color: Color0,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  SizedBox(
                                    height: height * 0.02,
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
                                          text: '05/10/2020',
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
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '15000 AED',
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
                                      Spacer(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color0,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: text(
                                        title: "1d 18h 50m",
                                        color: Color3,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
