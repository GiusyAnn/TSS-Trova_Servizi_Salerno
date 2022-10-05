import 'package:app_salerno/Beans/Utente.dart';
import 'package:app_salerno/Screens/wrapper.dart';
import 'package:app_salerno/Services/auth.dart';
import 'package:app_salerno/vistaMappadue.dart';
import 'package:flutter/material.dart';
import 'package:app_salerno/Screens/vistaMappa.dart';
import 'package:app_salerno/Screens/authenticate/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_salerno/Beans/Utente.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider <Utente>.value(
      value: AuthService().user,
      initialData: Utente(uid: ''),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


