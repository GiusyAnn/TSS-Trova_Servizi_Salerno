import 'package:flutter/material.dart';
import 'package:app_salerno/Screens/Home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:provider/provider.dart';
import 'package:app_salerno/Services/dbstrutture.dart';
import 'package:app_salerno/Screens/Pages/scegliCategoria.dart';
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
                      builder: (builder) => ScegliCategoria()
                  );
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

}
