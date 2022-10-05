import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_geocoding/google_geocoding.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class vistaMappadue extends StatefulWidget {
  @override
  State<vistaMappadue> createState() => _vistaMappaState();
}

class _vistaMappaState extends State<vistaMappadue> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: (){},
        ),
        title: Text("Salerno"),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.searchengin))
        ],
      ),
      body: Stack(
        children: <Widget>[
          _googlemap(context),
         // _zoomminusfunction(),
         // _coomplusfunction(),
         // _buildcontainer(),
        ],
      ),
    );
  }

  Widget _googlemap(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }


}
