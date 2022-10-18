import 'package:app_salerno/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:provider/provider.dart';
import 'package:app_salerno/Services/dbstrutture.dart';
import 'mappa.dart';
import 'package:app_salerno/Beans/Position.dart';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:app_salerno/Component/loading.dart';




class vistaMappa extends StatefulWidget {
  final Posizione position;
  vistaMappa({required this.position});

  var userLocation;



  @override
  State<vistaMappa> createState() => _vistaMappaState();
}



class _vistaMappaState extends State<vistaMappa> {

  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Struttura>>.value(
      value: DatabaseService().getStrutture,
      initialData: [],
      child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(FontAwesomeIcons.arrowLeft),
                onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Home()));},
              ),
              actions: <Widget>[
                TextButton.icon(
                    onPressed: ()  {
                      Posizione position = Loading().getLocation();
                      print('Aggiorno il valore della posizione con :'+position.lat.toString()+'   '+position.long.toString());
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> vistaMappa(position : position)));
                    },
                    icon: Icon(FontAwesomeIcons.locationDot, color: Colors.white), 
                    label: Text('Vicino a me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                    ),),
                ),
              ]
            ),
           body: Maps(position: widget.position)
        ),
    );
  }


  Future<Position> getLocation() async {
    var currentLocation;
    try {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }


}
