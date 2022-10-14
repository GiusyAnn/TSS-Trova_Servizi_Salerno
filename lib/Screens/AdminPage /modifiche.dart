import 'package:app_salerno/Screens/AdminPage%20/modifichelist.dart';
import 'package:app_salerno/Screens/AdminPage%20/scegliCategoriaModifiche.dart';
import 'package:flutter/material.dart';
import 'package:app_salerno/Screens/Home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:provider/provider.dart';
import 'package:app_salerno/Services/dbstrutture.dart';
import 'package:app_salerno/Screens/Pages/scegliCategoria.dart';
import 'modifichelist.dart';



class Modifiche extends StatefulWidget {
  final String cat;
  Modifiche({required this.cat});

  @override
  State<Modifiche> createState() => _ModificheState();
}

class _ModificheState extends State<Modifiche> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Struttura>>.value(
      value: DatabaseService().getStrutture,
      initialData: [],
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));},
            ),
            title: Center(
                child: Text("Servizi")
            ),
            actions: <Widget>[
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (builder) => ScegliCategoriaModifiche()
                  );
                },
                icon: Icon(FontAwesomeIcons.search, color: Colors.white),
                label: Text(''),
              ),
            ],
          ),
          body: ModificheList(cat: widget.cat)
      ),
    );
  }

}
