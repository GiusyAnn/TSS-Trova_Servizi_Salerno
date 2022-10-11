import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  @override
  Widget build(BuildContext context) {
    final lst = Provider.of<List<Struttura>>(context);


    print('Sono in Mappa \n Ho ottenuto: '+lst.toString());
    lst.forEach((x) {
      print('For Struttura: struttura :'+x.name);

      switch(x.categoria) {
        case 'Servizio Sanitario': x.color = 0xFF7b1a02;
          break;
        case 'Forze dell\'Ordine': x.color = 0xFFf2d500;
          break;
        case 'Servizio Amministrativo': x.color = 0xFF388989 ;
          break;
        default: x.color = 0xFF6c402c;
        break;
      }
    });


    var marker = <Marker>[];

    for (Struttura x in lst) {
      log(' \n Struttura = ' + x.toString());
      var mk = Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(x.lat, x.long),
          builder: (ctx) => Container(
                child: IconButton(
                    icon: Icon(FontAwesomeIcons.locationDot, color: Color(x.color)),
                    iconSize: 40.0,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) => _description(context, x));
                    }),
              ));
      marker.add(mk);
    }

    return Center(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            child: Column(children: [
              SizedBox(height: 20),
              Flexible(
                  child: FlutterMap(
                options:
                    MapOptions(center: LatLng(40.683334, 14.766667), zoom: 14),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: marker,
                  )
                ],
              ))
            ])));
  }

  Widget _description(BuildContext context, Struttura str) {

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
          child: Column(
        children: <Widget>[
          //handing
          Container(
              child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            color: Color(str.color),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                str.getname(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )), //handing

          //contenuto
          Container(
              child: Column(children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(FontAwesomeIcons.locationDot,
                            color: Color(str.color), size: 35),
                      )),
                  //icon

                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: OverflowBar(children: <Widget>[
                          Text(
                            str.getaddress(),
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                          ),
                        ])),
                  ), //text
                ],
              ),
            ), //Adderess
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(FontAwesomeIcons.phone,
                            color: Color(str.color), size: 35),
                      )),
                  //icon
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          str.getphone().toString(),
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )),
                  ), //text
                ],
              ),
            ), //Phone
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(FontAwesomeIcons.houseChimney,
                            color: Color(str.color), size: 35),
                      )),
                  //icon
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          str.getcategory(),
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )),
                  ), //text
                ],
              ),
            ), //Category
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(FontAwesomeIcons.globe,
                            color: Color(str.color), size: 35),
                      )),
                  //icon
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          str.getpage(),
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )),
                  ), //text
                ],
              ),
            ), //Page
          ])), //title
        ],
      )),
    );
  }
}
