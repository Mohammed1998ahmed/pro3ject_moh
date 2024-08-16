import 'package:flutter/material.dart';
import 'package:thi/component/conset/Const.dart';

class ResponsSupports extends StatelessWidget {
  const ResponsSupports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageBackground), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
