import 'dart:convert';

import 'package:corstat/components/main_drawer.dart';
import 'package:corstat/services/coronavirus_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

  bool isLoaded = false;
  Map locationsData;
  List locations;
  final formatter = new NumberFormat("#,###");

    Future<void> _setWidgetLocationsData() async {
    this.locationsData = await _getDataLocations();
    this.locations = this.locationsData['locations'].toList();
    this.locations.sort((a,b) => a['country'].compareTo(b['country']));
    setState(() {
      this.isLoaded = true;
    });
  }

  Future<Map> _getDataLocations() async {
    return await CoronaVirusTracker.getConfirmed();
  }

  @override
  Widget build(BuildContext context) {
    if (this.locationsData == null) {
      _setWidgetLocationsData();
    }

    if (this.locationsData == null) {
      return _buildLoadingPage();
    }
    else {
      return _buildPage();
    }

  }

  Widget _buildPage() {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: MainDrawer(currPage: 'locations',),
      body: _buildBody(),
    );
  }

  Widget _buildLoadingPage() {
    return Scaffold(
      appBar: _buildAppBar(),
      // drawer: MainDrawer(),
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
              _buildMainTextLocations(this.locationsData['latest']),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
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
                                      title: Text(
                                        "${this.locations[index]['country']} ${this.locations[index]['province']}",
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

  Widget _buildMainTextLocations(locations) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Locations',
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                  color: Colors.green[500],
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
          'LOCATIONS',
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