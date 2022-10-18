import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app_salerno/Beans/Position.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitCircle(
          color: Colors.lightBlue,
          size: 70.0,
        ),
      ),
    );
  }




























  Posizione getLocation(){
    Posizione pos= Posizione(40.774464,14.789729);
    return pos;
  }
}