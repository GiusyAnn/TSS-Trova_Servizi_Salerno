import 'package:app_salerno/Screens/Home/home.dart';
import 'package:app_salerno/Utils/Geolocalizzazione.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:app_salerno/Services/dbstrutture.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mappa.dart';



class vistaMappa extends StatefulWidget {
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
              title: Center(
                  child: Text("Salerno")
              ),
            ),
           body: Maps()
        ),
    );
  }



}
