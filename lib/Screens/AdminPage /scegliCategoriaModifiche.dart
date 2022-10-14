import 'package:app_salerno/Screens/AdminPage%20/modifiche.dart';
import 'package:app_salerno/Screens/Pages/Servizi.dart';
import 'package:app_salerno/Screens/Pages/listaServizi.dart';
import 'package:flutter/material.dart';

class ScegliCategoriaModifiche extends StatefulWidget {
  late final String cat;

  @override
  State<ScegliCategoriaModifiche> createState() => _ScegliCategoriaModificheState();
}

class _ScegliCategoriaModificheState extends State<ScegliCategoriaModifiche> {

  final _fromkey = GlobalKey<FormState>();
  List<String> categorie = ['Tutti','Servizio Amministrativo','Servizio Sanitario','Forze dell\'Ordine'];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromkey,
      child: Column(
        children: <Widget>[
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
              )),

          SizedBox(height: 20.0,),

          //DropDown
          Container(
          padding: EdgeInsets.symmetric(vertical: 100.0,horizontal: 50.0 ),
          child: DropdownButtonFormField<String>(
            value: categorie.first,
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            items: categorie.map<DropdownMenuItem<String>>((String cat) {
              return DropdownMenuItem<String>(
              value: cat,
              child: Text(cat),
              );
            }).toList(),
            onChanged: (String? cat) {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Modifiche(cat: cat.toString())));
              });
            },
          ),
          ),

          SizedBox(height: 20.0,),

          //Bottone Check
          ElevatedButton(
            child: Text(
              'Filtra',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print('Effettuo la ricerca!!');
            },
          ),

        ],)

    );
  }
}
