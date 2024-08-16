import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/notifaction/ScreenNavaction/HealthCare/Details/details.dart';

 
class HealthCare extends StatelessWidget {
  const HealthCare({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool shimmer = false;
    return Scaffold(
      appBar: AppBar(
        title: text(
            title: "HealthCare",
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
                              ConsultationResultsScreen(
                            animalName: 'Spirit',
                            animalType: 'Horse',
                            consultationDate: DateTime.now(),
                            consultationDetails:
                                'The horse is experiencing lameness in the right front leg and swelling in the fetlock joint.',
                            veterinaryDiagnosis: 'Suspicion of ligament injury',
                            prescribedTreatment:
                                'Resting the horse, applying cold compresses, and administering anti-inflammatory medication for two weeks.',
                          ),
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
                                borderRadius: BorderRadius.circular(500),
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
                                      title:
                                          'Dubai Veterinary Centre Dubai Veterinary Centre',
                                      color: Color0,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Dispatch Date : ',
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
                                              text: 'Reply Date : ',
                                              style: TextStyle(
                                                color: Color0,
                                                fontSize: 14,
                                                fontFamily: 'Caveat',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                            // TextSpan(
                                            //   text: '15000 AED',
                                            //   style: TextStyle(
                                            //     color: Colors.black,
                                            //     fontSize: 14,
                                            //     fontFamily: 'Caveat',
                                            //     fontWeight: FontWeight.w400,
                                            //     height: 0,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color0,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.30,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        child: text(
                                            title: "05/10/2020 10:50",
                                            color: Color3,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
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
