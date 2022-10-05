import 'package:app_salerno/Screens/insidehome.dart';
import 'package:flutter/material.dart';
import 'package:app_salerno/Screens/wrapper.dart';
import 'package:app_salerno/Beans/Utente.dart';
import 'package:app_salerno/Screens/main.dart';
import 'package:app_salerno/Screens/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Utente>(context);
    print('Questo è l\'utente '+user.uid.toString());
    if(user == null || user.uid == ''){
      return MyApp();
    } else {
      return InsideHomePage(title: 'Home');
    }
  }
}

