import 'package:corstat/pages/home.dart';
import 'package:corstat/services/coronavirus_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  bool isError = false;

  void getData() async {
    // Map data = await CoronaVirusTracker.getAll(); 
    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(
    )));
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Widget _buildLoadingPage() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[800],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildCorstatTitleText(),
              _buildCorstatDescText(),
              SizedBox(height: 20.0),
              _buildLoadingSpinner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCorstatTitleText() {
    return Text(
      'CORSTAT',
      style: TextStyle(
        fontFamily: 'ArchivoBlack',
        fontWeight: FontWeight.w900,
        fontSize: 40.0,
        letterSpacing: 10.0,
        color: Colors.white60,
      ),
    );
  }

  Widget _buildCorstatDescText() {
    return Text(
      'Coronavirus Statistics',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue[200],
        letterSpacing: 2.0,
        fontSize: 15.0
      ),
    );
  }

  Widget _buildLoadingSpinner() {
    return SpinKitFoldingCube(
        color: Colors.blue[100],
      );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoadingPage();
  }
}