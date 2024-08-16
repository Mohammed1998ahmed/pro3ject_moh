// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/favovoriteIstable/Istable/istable.dart';
import 'package:thi/profile/favovoriteIstable/cubit/favovrite_cubit.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

class FaovoaitrIstable extends StatelessWidget {
  FaovoaitrIstable({super.key});
  bool shimmer = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => FavovriteCubit()
        ..getDataFavoratie(CachShpreafapp.getdata(key: "UserID")),
      child: BlocConsumer<FavovriteCubit, FavovriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = FavovriteCubit.getObject(context);
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imageBackground))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: text(title: "Favovrite Istable", color: Color0),
              ),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.99,
                child: cubit.getFavoratieModle == null
                    ? ListView.builder(
                        itemBuilder: (BuildContext, int) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: ShimerWidght(
                                width: width * 0.2,
                                height: height * 0.2,
                                reduis: 10,
                              ),
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, bottom: 6),
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
                        itemCount: 4,
                      )
                    : ListView.separated(
                        itemCount:
                            cubit.getFavoratieModle!.favoriteClubs!.length,
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
                                  builder: (BuildContext context) => Istable(
                                    favovriteCubit: cubit,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: width,
                              height: height * 0.15,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Container(
                                    width: width * 0.40,
                                    height: height * 0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(ImagesPath +
                                                cubit
                                                    .getFavoratieModle!
                                                    .favoriteClubs![index]
                                                    .profile
                                                    .toString()),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        text(
                                            title: cubit.getFavoratieModle!
                                                .favoriteClubs![index].name!,
                                            //  "Godolphin Stables",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color0),
                                        Expanded(
                                          child: Container(
                                            width: width * 0.5,
                                            child: text(
                                                title: cubit
                                                    .getFavoratieModle!
                                                    .favoriteClubs![index]
                                                    .description!,
                                                // "Godolphin StablesGodolphin StablesGodolphin StablesGodolphin StablesGodolphin StablesGodolphin StablesGodolphin Stables",
                                                fontSize: 16,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    43, 3, 153, 0.678)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
