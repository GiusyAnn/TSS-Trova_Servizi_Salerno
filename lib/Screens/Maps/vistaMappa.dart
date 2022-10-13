import 'package:app_salerno/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:provider/provider.dart';
import 'package:app_salerno/Services/dbstrutture.dart';
import 'mappa.dart';
import 'package:app_salerno/Beans/Position.dart';



class vistaMappa extends StatefulWidget {
  final Position position;
  vistaMappa({required this.position});



  @override
  State<vistaMappa> createState() => _vistaMappaState();
}



class _vistaMappaState extends State<vistaMappa> {

  
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
              actions: <Widget>[
                TextButton.icon(
                    onPressed: (){
                      widget.position.lat = 40.778250;
                      widget.position.long = 14.781230;
                      print('Aggiorno il valore della posizione con :'+widget.position.lat.toString()+'   '+widget.position.long.toString());
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> vistaMappa(position : widget.position)));
                    },
                    icon: Icon(FontAwesomeIcons.locationDot, color: Colors.white), 
                    label: Text('Vicino a me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                    ),),
                ),
              ]
            ),
           body: Maps(position: widget.position)
        ),
    );
  }



}
