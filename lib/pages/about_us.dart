import 'package:corstat/components/main_drawer.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildAboutUs();
  }

  Widget _buildAboutUs() {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      drawer: MainDrawer(currPage: 'about-us',),
      body: Container(
        child: Text(
          'Created By Faizal Ardian Putra',
        ),
      ),
    );
  }
}