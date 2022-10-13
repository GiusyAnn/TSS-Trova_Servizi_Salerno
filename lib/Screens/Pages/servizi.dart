import 'package:flutter/material.dart';
import 'package:app_salerno/Screens/Home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:provider/provider.dart';
import 'package:app_salerno/Services/dbstrutture.dart';

import 'listaServizi.dart';



class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
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
                child: Text("Servizi")
            ),
            actions: <Widget>[
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (builder) => _scegliCategoria(context));
                },
                icon: Icon(FontAwesomeIcons.search, color: Colors.white),
                label: Text(''),
              ),
            ],
          ),
          body: ListaServizi()
      ),
    );
  }

  Widget _scegliCategoria(BuildContext context) {

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Center(
          child: Column(
            children: <Widget>[
              //handing
              Container(
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Scegli Categoria',
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
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Icon(FontAwesomeIcons.houseChimney,
                                    color: Colors.blue, size: 35),
                              )),
                          //icon

                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: OverflowBar(children: <Widget>[
                                  Text('Categoria',
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
                    ), //Adderess//Page
                  ])), //title
            ],
          )),
    );
  }
}
