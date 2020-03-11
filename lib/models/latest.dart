import 'package:flutter/material.dart';

class Latest {
  String name;
  int domain;
  num count;
  Color pieChartColor;

  Latest({
    this.name,
    this.domain = 1,
    this.count,
    this.pieChartColor
  });
}