import 'package:app_salerno/Screens/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'dart:developer';


class vistaMappa extends StatefulWidget {
  @override
  State<vistaMappa> createState() => _vistaMappaState();
}

 List<Struttura> _getstrutture() {
  Struttura st1 = new Struttura('Questura di Salerno', 40.67856, 14.75488, 'Salerno', 'Piazza Giovanni Amendola, 16, 84123 Salerno SA', 089613111, 'A','Nessun Sito Presente');
  log('Struttura 1 : '+st1.toString());
  Struttura st2 = new Struttura('Comune di Salerno', 40.66377, 14.79377, 'Salerno', 'Via Madonna di Fatima 50, 84129 Salerno', 089613111, 'B','Nessun Sito Presente');
  log('Struttura 2 : '+st2.toString());
  List<Struttura> list = <Struttura>[];
  list.add(st2);
  list.add(st1);
  return list;
}

class _vistaMappaState extends State<vistaMappa> {

  @override
  Widget build(BuildContext context) {

    List<Struttura> lst = _getstrutture();
    var marker = <Marker>[];

    for (int i = 0; i < lst.length; i++) {
      int val;
      if (lst[i].getcategory() == 'A'){
        val = 0xFF7b1a02;
      } else {
        val = 0xFF7b1FB2;
      }
      log('Inizio For I = $i \n Struttura = '+lst[i].toString());
      var mk =  Marker(width: 80.0, height: 80.0, point: LatLng(lst[i].getlat() , lst[i].getlong()),
            builder: (ctx) =>
                Container(
                  child: IconButton(
                      icon: Icon(FontAwesomeIcons.locationDot,
                          color: Color(val)), iconSize: 40.0,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) => _description(context, lst[i])
                        );
                      }
                  ),
                )
        );
      marker.add(mk);
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyApp()));},
          ),
          title: Center(
              child: Text("Salerno")
          ),
        ),
       body:Center(
           child: Container(
               alignment: Alignment.center,
               padding: const EdgeInsets.all(5),
               child: Column (
                   children: [
                     SizedBox(height:20),
                Flexible(child:FlutterMap(
                       options:
                         MapOptions(
                           center: LatLng(40.683334, 14.766667),
                           zoom: 14
                         ),
                       layers: [
                         TileLayerOptions(
                         urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                         subdomains:['a','b','c']),

                         MarkerLayerOptions(
                           markers: marker,
                         )

                       ],
                     )
                )]
           )
           )
       )
    );
  }

  Widget _description (BuildContext context, Struttura str){
    int val;
    if (str.getcategory() == 'A'){
      val = 0xFF7b1a02;
    } else {
      val = 0xFF7b1FB2;
    }

    return Container(
        color:Colors.white,
        alignment:  Alignment.center,
      child: Container(
        child: Column(children: <Widget>[
        //handing
        Container(
          child:Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            color: Color(val),
            child: Padding (
              padding: const EdgeInsets.all(15.0),
              child: Text(str.getname(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ), //handing

        //contenuto
        Container(
          child: Column(
              children: <Widget>[
                Container(
                  child: Row(children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child : Icon(FontAwesomeIcons.locationDot,
                            color: Color(val), size: 35),
                        )
                      ),
                     //icon

                      Flexible(

                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child : OverflowBar(
                            children: <Widget>[
                              Text(str.getaddress(),
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ]
                          )
                        ),
                    ), //text
                  ],),
                ), //Adderess
                Container(
                  child: Row(children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child : Icon(FontAwesomeIcons.phone,
                              color: Color(val), size: 35),
                        )
                    ),
                    //icon
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(0),
                          child : Text(str.getphone().toString(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                            ),
                          ) ),

                    ), //text
                  ],),
                ), //Phone
                Container(
                  child: Row(children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child : Icon(FontAwesomeIcons.houseChimney,
                              color: Color(val), size: 35),
                        )
                    ),
                    //icon
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(0),
                          child : Text(str.getcategory(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                            ),
                          ) ),

                    ), //text
                  ],),
                ),//Category
                Container(
                  child: Row(children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child : Icon(FontAwesomeIcons.globe,
                              color: Color(val), size: 35),
                        )
                    ),
                    //icon
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(0),
                          child : Text(str.getpage(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                            ),
                          ) ),

                    ), //text
                  ],),
                ), //Page


              ]
          )
        ), //title


      ],)
    ),
    );
  }

}
