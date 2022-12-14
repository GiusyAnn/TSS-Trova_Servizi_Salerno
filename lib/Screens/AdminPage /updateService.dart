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


class ModificaDatiServizio extends StatefulWidget {
  final Struttura struttura;
  ModificaDatiServizio({required this.struttura});

  @override
  State<ModificaDatiServizio> createState() => _ModificaDatiServizioState();
}

class _ModificaDatiServizioState extends State<ModificaDatiServizio> {

  final DatabaseService databaseService = DatabaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
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
            child: Text("Modifica Servizio")
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
                      hintText: widget.struttura.name,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un nome ' : null,
                onChanged: (val){
                  setState(() {
                    if(val!='' || val!=null){
                      widget.struttura.name = val;
                    }
                  });
                },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: widget.struttura.lat.toString(),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un latitudine ' : null,
                  onChanged: (val){
                    setState(() {
                      if(val!='' || val!=null){
                        widget.struttura.lat = double.parse(val);
                      }
                    });
                  },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: widget.struttura.long.toString(),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire una longitudine' : null,
                  onChanged: (val){
                    setState(() {
                      if(val!='' || val!=null){
                        widget.struttura.long = double.parse(val);
                      }
                    });
                  },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: widget.struttura.address,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un indirizzo ' : null,
                  onChanged: (val){
                    setState(() {
                      if(val!='' || val!=null){
                      widget.struttura.address = val;
                    }
                    });
                  },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      label: Text(widget.struttura.phone),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un numero di telefono ' : null,
                  onChanged: (val){
                    setState(() {if(val!='' || val!=null){
                      widget.struttura.phone = val;
                    }});
                  },
                ),
                SizedBox(height: 10.0,),


                TextFormField(
                  decoration: InputDecoration(
                      hintText: widget.struttura.page,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un sito Web ' : null,
                  onChanged: (val){
                    setState(() {if(val!='' || val!=null){
                      widget.struttura.page = val;
                    }});
                  },
                ),
                SizedBox(height: 10.0,),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: widget.struttura.city,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire una Citt?? ' : null,
                  onChanged: (val){
                    setState(() {if(val!='' || val!=null){
                      widget.struttura.city = val;
                    }});
                  },
                ),
                SizedBox(height: 10.0,),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 50.0 ),
                  child: DropdownButtonFormField<String>(
                    value: widget.struttura.categoria,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    items: categorie.map<DropdownMenuItem<String>>((String cat) {
                      return DropdownMenuItem<String>(
                        value: cat,
                        child: Text(cat),
                      );
                    }).toList(),
                    onChanged: (String? cat) {
                      setState(() {widget.struttura.categoria = cat!;});
                    },
                  ),
                ),

                SizedBox(height: 10.0,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    minimumSize: Size(60, 40),
                  ),
                  child: Text(
                    'Modifica',
                        style: TextStyle(color: Colors.white),
                  ),
                  onPressed: ()  {
                    print('INTERAZIONE PULSANTE MODIFICA! VOGLIAMO INSERIRE :'+widget.struttura.toString());
                    databaseService.updateStrutturaData(widget.struttura);
                    print(widget.struttura.toString());
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
