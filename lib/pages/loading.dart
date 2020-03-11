import 'package:corstat/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    await Future.delayed(Duration(seconds: 5));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[800],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'CORSTAT',
                style: TextStyle(
                  fontFamily: 'ArchivoBlack',
                  fontWeight: FontWeight.w900,
                  fontSize: 40.0,
                  letterSpacing: 10.0,
                  color: Colors.white60,
                ),
              ),
              Text(
                'Coronavirus Statistics',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[200],
                  letterSpacing: 2.0,
                  fontSize: 15.0
                ),
              ),
              SizedBox(height: 20.0),
              SpinKitFoldingCube(
                color: Colors.blue[100],
              ),
            ],
          ),
        ),
      ),
    );
  }
}