// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  dynamic widget;
  CustomTextFiled({this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .77,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .020),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .020),
      decoration: BoxDecoration(boxShadow: [
        const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(-4, -4)),
        BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(4, 4)),
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: this.widget,
    );
  }
}
