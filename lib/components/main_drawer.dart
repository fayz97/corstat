import 'package:corstat/pages/about_us.dart';
import 'package:corstat/pages/group_by_type/confirmed.dart';
import 'package:corstat/pages/group_by_type/deaths.dart';
import 'package:corstat/pages/group_by_type/recovered.dart';
import 'package:corstat/pages/home.dart';
import 'package:corstat/services/coronavirus_tracker.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  String currPage;

  MainDrawer({this.currPage});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return _buildDrawer();
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildDrawerAccountSection(),
            _buildDrawerListMenu(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerListMenu() {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            title: Text('Home'),
            onTap: () {
              if (this.widget.currPage == 'home') {
                 Navigator.of(context).pop();
              }
              else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(
                )));
              }
            },
          ),
          ListTile(
            title: Text('About Us'),
            onTap: () {
              if (this.widget.currPage == 'about-us') {
                Navigator.of(context).pop();
              }
              else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutUs()));
              }
            },
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Group By Type',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: Text('Confirmed'),
            onTap: () {
              if (this.widget.currPage == 'confirmed') {
                Navigator.of(context).pop();
              }
              else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Confirmed()));
              }
            },
          ),
          ListTile(
            title: Text('Deaths'),
            onTap: () {
              if (this.widget.currPage == 'deaths') {
                Navigator.of(context).pop();
              }
              else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Deaths()));
              }              
            },
          ),
          ListTile(
            title: Text('Recovered'),
            onTap: () {
              if (this.widget.currPage == 'recovered') {
                Navigator.of(context).pop();
              }
              else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Recovered()));
              }              
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerAccountSection() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.white54,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/default_avatar.png'),
                  radius: 50.0,
                ),
                Text(
                  'Faizal Ardian Putra',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}