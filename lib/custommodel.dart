import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomModel {
  String? title;
  String? subTitle;
  String? description;
  String? icon;
  Color? color;
  String? img;
  int? ind;

  CustomModel(
      {this.title,
      this.subTitle,
      this.description,
      this.icon,
      this.color,
      this.ind,
      this.img});
}

List<CustomModel> Mainlistitems = [
  CustomModel(
    title: "Bani table in list view",
  ),
  CustomModel(
    title: "line table display direct till 10680 order id",
  ),
];

List<CustomModel> ShortBanilistitems = [
  CustomModel(
    title: "Japji Sahib",
  ),
  CustomModel(
    title: "Anand Sahib",
  ),
];

List<CustomModel> amritvelaWakeUpCallScreenList = [
  CustomModel(
      title: "GSSG", subTitle: "title in hindi", description: "decription"),
  CustomModel(
      title: "DGSJ", subTitle: "title in hindi", description: "decription"),
      
];
