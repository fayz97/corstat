import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CorStat'),
      ),
      body: Text('Home Screen'),
      drawer: Drawer(
        child: SafeArea(
          child: Text('Drawer'),
        ),
      ),
    );
  }
}