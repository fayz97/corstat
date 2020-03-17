import 'package:corstat/components/main_drawer.dart';
import 'package:flutter/material.dart';

class Deaths extends StatefulWidget {
  @override
  _DeathsState createState() => _DeathsState();
}

class _DeathsState extends State<Deaths> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deaths"),
      ),
      drawer: MainDrawer(currPage: 'deaths',),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text("Deaths Page"),
    );
  }
}