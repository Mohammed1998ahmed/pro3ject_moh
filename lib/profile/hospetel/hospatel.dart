import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/hospetel/cubit/hospatel_cubit.dart';
import 'package:thi/profile/hospetel/details/details.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

class Hostitel extends StatelessWidget {
  const Hostitel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospatelCubit()
        ..getConsultations(
            ID_Profile: CachShpreafapp.getdata(key: "ProfileID")),
      child: BlocConsumer<HospatelCubit, HospatelState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = HospatelCubit.getObject(context);
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imageBackground))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Color3),
                title: text(title: "Consultation HealthCare", color: Color0),
              ),
              body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  // color: Color0,
                  child: cubit.getConsultationModel == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Color0),
                                  child: Center(
                                      child: text(
                                          title: "${index + 1}",
                                          color: Color3)),
                                ), // أيقونة في الجزء الأيسر من العنصر
                                title: text(
                                    title: cubit.getConsultationModel!
                                        .consultation![index].name
                                        .toString(),
                                    color: Color0), // عنوان العنصر
                                subtitle: text(
                                    title: cubit.getConsultationModel!
                                        .consultation![index].sentAt
                                        .toString(),
                                    color: Color.fromRGBO(43, 3, 153, 0.192)),
                                trailing: Icon(Icons
                                    .arrow_forward), // أيقونة في الجزء الأيمن من العنصر
                                onTap: () {
                                  // DetailsHospitel
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          DetailsHospitel(
                                        getConsultationModel:
                                            cubit.getConsultationModel,
                                        indexID: index,
                                      ),
                                    ),
                                  ); // التعامل مع النقر على العنصر
                                  print('تم النقر على العنصر ${index + 1}');
                                },
                              ),
                            );
                          },
                          itemCount: cubit.getConsultationModel == null
                              ? 0
                              : cubit.getConsultationModel!.consultation == null
                                  ? 0
                                  : cubit.getConsultationModel!.consultation!
                                      .length,
                        )),
            ),
          );
        },
      ),
    );
  }
}
