import 'package:corstat/components/main_drawer.dart';
import 'package:flutter/material.dart';

class Confirmed extends StatefulWidget {
  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmed"),
      ),
      drawer: MainDrawer(currPage: 'confirmed',),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text('Confimred Page'),
    );
  }
}