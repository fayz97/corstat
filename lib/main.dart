import 'package:corstat/pages/home.dart';
import 'package:corstat/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
  },
));
