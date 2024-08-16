import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/Sorting/cubit/sort_by_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

// ignore: must_be_immutable
class SortBy extends StatelessWidget {
  int selectedValue = 1;

  bool f1 = false;

  bool f2 = false;
  bool f3 = false;
  bool f4 = false;
  bool f5 = false;
  bool f6 = false;
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  double rate = 0.0;
  List gender = ["Man", "Woman"];
  String currentGenger = "Man";
  String selectSort = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SortByCubit(),
      child: BlocConsumer<SortByCubit, SortByState>(
        listener: (context, state) {
         },
        builder: (context, state) {
          final cubit = SortByCubit.getObject(context);
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.10,
                        // height: double.infinity,
                        // padding: EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: text(
                                  title: "Cancel",
                                  textAlign: TextAlign.center,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            text(
                                title: "Sorting By",
                                fontSize: 24,
                                color: Color0,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),

                          ////////////////////////////////////
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          text(
                            title: "Sort by",
                            fontSize: 18,
                            color: Color0,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              cubit.chaingStringButton("s1");
                              print(cubit.selectSort);
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  text(
                                    title: "Most Popular",
                                    fontSize: 18,
                                    color: cubit.selectSort == "s1"
                                        ? Color0
                                        : Colors.black,
                                  ),
                                  cubit.selectSort == "s1"
                                      ? Icon(
                                          Icons.done,
                                          color: Color0,
                                        )
                                      : Container(),
                                ]),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              cubit.chaingStringButton('s3');
                              selectSort = "s3";
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  text(
                                    title: "Cost Low to High",
                                    fontSize: 18,
                                    color: cubit.selectSort == "s3"
                                        ? Color0
                                        : Colors.black,
                                  ),
                                  cubit.selectSort == "s3"
                                      ? Icon(
                                          Icons.done,
                                          color: Color0,
                                        )
                                      : Container(),
                                ]),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              cubit.chaingStringButton('s2');
                              selectSort = "s2";
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  text(
                                      title: "Cost High to Low",
                                      fontSize: 18,
                                      color: cubit.selectSort == "s2"
                                          ? Color0
                                          : Colors.black),
                                  cubit.selectSort == "s2"
                                      ? Icon(
                                          Icons.done,
                                          color: Color0,
                                        )
                                      : Container(),
                                ]),
                          ),
                          ///////////////////////////////////////////////////
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.80,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                    color: Color0,
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: text(
                                    title: 'Apply Filter',
                                    color: Colors.black,
                                    fontSize: 20)),
                          )
                        ],
                      ),
                    )
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
