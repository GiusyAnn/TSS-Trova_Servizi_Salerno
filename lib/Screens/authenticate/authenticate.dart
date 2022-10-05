import 'package:app_salerno/Services/auth.dart';
import 'package:app_salerno/Beans/Utente.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_salerno/Screens/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyApp()));},
        ),
        title: Center(
            child: Text("Accesso")
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0 ),
          child: ElevatedButton(
            onPressed: () async{
              dynamic result = await _authService.signInAnon();
              if(result == null){
                print('Errore nell\'autetiazione' );
              } else {
                print ('Accesso effetuato con successo');
                print(result.uid);
              }
            },
            child: Text('Entra in Anonimo'),
          ),
        ),

      )
    );
  }
}
