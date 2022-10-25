import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Services/dbstrutture.dart';
import 'modifiche.dart';
import 'updateService.dart';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ModificheWidget extends StatelessWidget {

  final Struttura struttura;
  ModificheWidget({required this.struttura});

  final DatabaseService databaseService = DatabaseService();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Color(struttura.color),
          ),
          title: Text(struttura.name),
          subtitle: Text(struttura.address),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) => _decision(context, struttura));},
        ),
      ),
    );
  }
  Widget _decision(BuildContext context, Struttura str) {

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
                        str.name,
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
                                    str.address,
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
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: OverflowBar(children: <Widget>[
                                  Text(
                                    str.phone,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ])),
                          ),  //text
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
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: OverflowBar(children: <Widget>[
                                  Text(
                                    str.categoria,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ])),
                          ),  //text
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
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: new InkWell(
    child: new Text('Sito Web',
    style: TextStyle(
    color: Colors.blueAccent,
    fontSize: 18,
    fontWeight: FontWeight.normal),
    ),
    onTap: () => launch(str.page)
    )),
                          ),  //text
                        ],
                      ),
                    ),

                    SizedBox(height: 7.0,),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 25.0 ),
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                              minimumSize: Size(150, 50),
                            ),
                            child: Text(
                              'Modifica',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: ()  {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ModificaDatiServizio(struttura : struttura)));
                            },
                          ),

                          SizedBox(width: 5.0,),
                          //icon
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                              minimumSize: Size(150, 50),
                              backgroundColor: Colors.red[300],
                            ),
                            child: Text(
                              'Rimuovi',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: ()  {
                              final dialogContextCompleter = Completer<BuildContext>();
                              showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext dialogContext) {
                                  if(!dialogContextCompleter.isCompleted) {
                                    dialogContextCompleter.complete(dialogContext);
                                  }
                                  return AlertDialog(
                                    content: Text('Sicuro di voler cancellare la struttura'),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                          minimumSize: Size(60, 40),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(dialogContext,false);
                                        },
                                        child: Text('Annulla Cancellazione'),
                                      ),

                                      SizedBox(height: 10.0, width: 10.0,),

                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                          minimumSize: Size(60, 40),
                                          backgroundColor: Colors.red[300],
                                        ),
                                        onPressed: () {
                                          databaseService.deleteStruttura(struttura);
                                          Navigator.pop(dialogContext,false);
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Modifiche(cat: 'Tutti')));
                                        },
                                        child: Text('Conferma Cancellazione'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              },
                          ),//text
                        ],
                      ),
                    ),//Page
                  ])), //title
            ],
          )),
    );
  }

}
