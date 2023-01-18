import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_ag/app/infrastructure/theme/theme.dart';
import 'package:get/get.dart';

class BaseLayout extends StatelessWidget {
  List<Widget> children;

  BaseLayout({required this.children});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [MainTheme.primaryColor, MainTheme.secodaryColor])),
            child: ListView(children: [Column(children: children)])));
  }
}
