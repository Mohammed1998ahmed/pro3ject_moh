import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

 
class AuctionUsers extends StatelessWidget {
  final List<String> images = [
    'assets/images/image 112.png',
    'assets/images/image 112.png',
    'assets/images/image 112.png',
    'assets/images/image 112.png',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: text(
            title: 'View information',
            color: Color0,
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ),
      body: GestureDetector(
        onTap: () {
          // Navigator.push<void>(
          //   context,
          //   MaterialPageRoute<void>(
          //     builder: (BuildContext context) => AuctionShare(),
          //   ),
          // );
        },
        child: Container(
          width: width * 0.98,
          height: height * 0.2,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: width * 0.35,
                height: height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/image 112.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Column(
                children: [
                  text(
                      title: 'Fayrouza Bent Mashhoure',
                      color: Color0,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                  Container(
                    width: width * 0.5,
                    height: height * 0.03,
                    // color: Color0,
                    child: text(
                        title: "Persons participating in the auction",
                        color: Color4),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Container(
                    width: width * 0.55,
                    height: height * 0.09,
                    // color: Color0,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/images/Farley-Jason-300x300.jpg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/images/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/Person.jpg'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
