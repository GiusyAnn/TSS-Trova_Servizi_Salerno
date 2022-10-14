import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:app_salerno/Screens/AdminPage%20/modifiche.dart';
import 'package:app_salerno/Screens/Home/home.dart';
import 'package:app_salerno/Services/auth.dart';
import 'package:app_salerno/Beans/Utente.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Screens/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_salerno/Component/loading.dart';
import 'package:app_salerno/Services/dbstrutture.dart';


class AggiungiServizio extends StatefulWidget {
  const AggiungiServizio({Key? key}) : super(key: key);

  @override
  State<AggiungiServizio> createState() => _AggiungiServizioState();
}

class _AggiungiServizioState extends State<AggiungiServizio> {

  final DatabaseService databaseService = DatabaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  Struttura struttura = Struttura('id', 'name', 0, 0, 'city', 'address', 'phone', 'categoria', 'page', 0);
  String error = '';
  List <String> categorie = ['Servizio Amministrativo','Servizio Sanitario','Forze dell\'Ordine'];

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Home()));},
        ),
        title: Center(
            child: Text("Aggiungi Servizio")
        ),
      ),

      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 50.0 ),
          child: Form(
             key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Nome',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un nome ' : null,
                onChanged: (val){
                  setState(() {struttura.name = val;});
                },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'lat',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un latitudine ' : null,
                  onChanged: (val){
                    setState(() {struttura.lat = double.parse(val);});
                  },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Long',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire una longitudine' : null,
                  onChanged: (val){
                    setState(() {struttura.long = double.parse(val);});
                  },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Indirizzo',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un indirizzo ' : null,
                  onChanged: (val){
                    setState(() {struttura.address = val;});
                  },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Telefono',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un numero di telefono ' : null,
                  onChanged: (val){
                    setState(() {struttura.phone = val;});
                  },
                ),
                SizedBox(height: 10.0,),


                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Sito Web',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un sito Web ' : null,
                  onChanged: (val){
                    setState(() {struttura.page = val;});
                  },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Città',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire una Città ' : null,
                  onChanged: (val){
                    setState(() {struttura.city = val;});
                  },
                ),
                SizedBox(height: 10.0,),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 50.0 ),
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
                      setState(() {struttura.categoria = cat!;});
                    },
                  ),
                ),

                SizedBox(height: 10.0,),
                ElevatedButton(
                  child: Text(
                    'Aggiungi',
                        style: TextStyle(color: Colors.white),
                  ),
                  onPressed: ()  {
                    if (_formKey.currentState!.validate()){
                      print('Alcuni campi inseriti non sono validi');
                      setState(() {
                        loading = true;
                      });
                      var result = databaseService.addStrutturaData(struttura);
                      if(result == false){
                        setState(() {
                          error = 'inserire una struttura con dettagli validi';
                          loading = false;  });
                      }
                   }
                    print(struttura.toString());
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Modifiche(cat: 'Tutti')));
                  },
                ),
              ],
            ),
          ),
          ),

      );

  }
}
