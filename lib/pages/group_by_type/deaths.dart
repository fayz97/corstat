import 'dart:convert';

import 'package:corstat/components/main_drawer.dart';
import 'package:corstat/services/coronavirus_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Deaths extends StatefulWidget {
  @override
  _DeathsState createState() => _DeathsState();
}

class _DeathsState extends State<Deaths> {

  bool isLoaded = false;
  Map deathsData;
  List locations;
  final formatter = new NumberFormat("#,###");

    Future<void> _setWidgetDeathsData() async {
    this.deathsData = await _getDataDeaths();
    this.locations = this.deathsData['locations'].toList();
    this.locations.sort((a,b) => b['latest'].compareTo(a['latest']));
    setState(() {
      this.isLoaded = true;
    });
  }

  Future<Map> _getDataDeaths() async {
    return await CoronaVirusTracker.getDeaths();
  }

  @override
  Widget build(BuildContext context) {
    if (this.deathsData == null) {
      _setWidgetDeathsData();
    }

    if (this.deathsData == null) {
      return _buildLoadingPage();
    }
    else {
      return _buildPage();
    }

  }

  Widget _buildPage() {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: MainDrawer(currPage: 'deaths',),
      body: _buildBody(),
    );
  }

  Widget _buildLoadingPage() {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: MainDrawer(),
      body: Container(
        child: Center(
          child: SpinKitHourGlass(
            color: Colors.blue[900],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[300],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              _buildMainTextDeaths(this.deathsData['latest']),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('Countries'),
                          SizedBox(height: 20.0,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: this.locations.length,
                                itemBuilder: (context, index) {
                                  // return Text('tes');
                                  return Card(
                                    child: ListTile(
                                      leading: Text((index + 1).toString()),
                                      title: Text(
                                        "${this.locations[index]['country']} ${this.locations[index]['province']} ${formatter.format(this.locations[index]['latest']).toString()}",
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
      ),
    ));
  }

  Widget _buildMainTextDeaths(deaths) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Deaths',
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                  color: Colors.redAccent[400],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                formatter.format(deaths).toString(),
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                  color: Colors.redAccent[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
        title: Text(
          'DEATHS',
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
}