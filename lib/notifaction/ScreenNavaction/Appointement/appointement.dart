import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
 
import 'Details/details.dart';

class Appointement extends StatelessWidget {
  const Appointement({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool shimmer = false;
    return Scaffold(
      appBar: AppBar(
        title: text(
            title: "Appointement",
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
                          builder: (BuildContext context) => DatilsBookingNavaction(),
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
                                        "assets/images/Vetrinary-Specialty-Center-1-1-1-1-1.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                    title: "Godolphin Stables",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(3, 2, 3, 1)),
                                Expanded(
                                  child: Container(
                                    width: width * 0.5,
                                    child: text(
                                        title:
                                            "Godolphin StablesGodolphin StablesGodolphin StablesGodolphin StablesGodolphin StablesGodolphin StablesGodolphin Stables",
                                        fontSize: 16,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54),
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
    );
  }
}
