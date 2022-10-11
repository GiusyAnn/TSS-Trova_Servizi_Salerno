import 'package:flutter/material.dart';
import 'package:app_salerno/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:provider/provider.dart';
import 'package:app_salerno/Services/dbstrutture.dart';
import 'servizioWidget.dart';



class ListaServizi extends StatefulWidget {
  @override
  State<ListaServizi> createState() => _ListaServiziState();
}

class _ListaServiziState extends State<ListaServizi> {
  @override
  Widget build(BuildContext context) {
    final lista = Provider.of<List<Struttura>>(context);
    lista.forEach((x) { print(x.name); });
    lista.forEach((x) {
      print('For Struttura: struttura :'+x.name);

      switch(x.categoria) {
        case 'Servizio Sanitario': x.color = 0xFF7b1a02;
        break;
        case 'Forze dell\'Ordine': x.color = 0xFFf2d500;
        break;
        case 'Servizio Amministrativo': x.color = 0xFF388989 ;
        break;
        default: x.color = 0xFF6c402c;
        break;
      }
    });
    return ListView.builder(itemCount: lista.length,
    itemBuilder: (context, index){
      return ServizioWidget(struttura: lista[index]);
    });
  }
}
