import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/hospetel/model/modelhospitle.dart';

class TreatmentPage extends StatelessWidget {
  const TreatmentPage(
      {super.key, this.getConsultationModel, required this.indexID});
  final GetConsultationModel? getConsultationModel;
  final int indexID;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imageBackground))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                          Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: text(title: "Treatment ", color: Color3),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: ListView.builder(
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(
                                      71, 181, 255, 1), // اللون الأصلي
                                  Color.fromRGBO(
                                      199, 255, 255, 1), // اللون المتناسق
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.grey,
                                          Colors.grey
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Center(
                                      child: text(
                                          title: getConsultationModel!
                                              .consultation![indexID]
                                              .details!
                                              .treatment![index]
                                              .details
                                              .toString(),
                                          color: Color3)),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.grey,
                                          Colors.white,
                                          Colors.grey,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Center(
                                      child: text(
                                          title: getConsultationModel!
                                              .consultation![indexID]
                                              .details!
                                              .treatment![index]
                                              .date
                                              .toString(),
                                          color: Colors.grey)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount:
                        getConsultationModel!.consultation![indexID].details ==
                                null
                            ? 0
                            : getConsultationModel!.consultation![indexID]
                                .details!.treatment!.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
