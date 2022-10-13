import 'package:flutter/material.dart';

class ScegliCategoria extends StatefulWidget {
  const ScegliCategoria({Key? key}) : super(key: key);

  @override
  State<ScegliCategoria> createState() => _ScegliCategoriaState();
}

class _ScegliCategoriaState extends State<ScegliCategoria> {

  final _fromkey = GlobalKey<FormState>();
  final List<String> categorie = ['Tutti','Servizio Amministrativo','Servizio Sanitario','Forze dell\'Ordine'];
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

          ),

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
