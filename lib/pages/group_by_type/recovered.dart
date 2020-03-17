import 'package:corstat/components/main_drawer.dart';
import 'package:flutter/material.dart';

class Recovered extends StatefulWidget {
  @override
  _RecoveredState createState() => _RecoveredState();
}

class _RecoveredState extends State<Recovered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recovered"),
      ),
      drawer: MainDrawer(currPage: 'recovered',),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text('Recovered Page'),
    );
  }
}