import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  Map allData;

  Home({@required this.allData});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _buildHomePage();
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[300],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: <Widget>[
              _buildTableLatest(this.widget.allData['latest']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
        title: Text(
          'CORSTAT',
          style: TextStyle(
            fontFamily: 'ArchivoBlack',
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
            letterSpacing: 10.0,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
      );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
        ),
        child: SafeArea(
          child: Text('Drawer'),
        ),
      ),
    );
  }

  Widget _buildTableLatest(Map<String, dynamic> latestData) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Latest',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildLatestConfimed(latestData['confirmed']),
              _buildLatestDeaths(latestData['deaths']),
              _buildLatestRecovered(latestData['recovered']),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLatestDeaths(dynamic deaths) {
    return Column(
      children: <Widget>[
        Text(
          'Deaths',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
            color: Colors.redAccent[400],
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          deaths.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rubik',
            color: Colors.red[400],
          ),
        ),
      ],
    );
  }

  Widget _buildLatestRecovered(dynamic recovered) {
    return Column(
      children: <Widget>[
        Text(
          'Recovered',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
            color: Colors.green[500],
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          recovered.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rubik',
            color: Colors.green[500],
          ),
        ),
      ],
    );
  }

  Widget _buildLatestConfimed(dynamic confimed) {
    return Column(
      children: <Widget>[
        Text(
          'Confirmed',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
            color: Colors.amber[500],
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          confimed.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rubik',
            color: Colors.amber[500],
          ),
        ),
      ],
    );
  }
}