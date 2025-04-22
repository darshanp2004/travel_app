import 'package:flutter/material.dart';
import 'package:travel_app/utils/string.dart';

class travelScreen extends StatefulWidget{
  @override
  State<travelScreen> createState() => _travelScreenState();
}

class _travelScreenState extends State<travelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text( bookTrip,style: TextStyle(fontSize:20,))),
    );
}
}