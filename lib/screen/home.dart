import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final List<Map<String, dynamic>> spotData;

  HomeView({required this.spotData});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Kuliner'),
      ),
    );
  }
}
