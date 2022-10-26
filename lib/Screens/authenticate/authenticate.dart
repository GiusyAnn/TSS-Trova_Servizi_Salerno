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


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

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
            child: Text("Accedi")
        ),
      ),

      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 250.0,horizontal: 50.0 ),
          child: Form(
             key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                      )
                  ),
                  validator: (val) => val == '' ? 'Inserire un email ' : null,
                onChanged: (val){
                  setState(() {email = val;});
                },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.lightBlueAccent.shade100, width: 2.0)
                    )
                  ),
                  obscureText: true,
                  validator: (val) =>  (val?.length)! < 6 ? 'Inserire una password maggiore di 6 caratteri ' : null,
                  onChanged: (val){
                    setState(() {password = val;});
                  },
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    minimumSize: Size(60, 40),
                  ),
                  child: Text(
                    'Accedi',
                        style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()){
                      print('CREDENZIALI VALIDE');
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _authService.singInWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() {
                          error = 'inserire delle credenziali valide!';
                          loading = false;
                        });
                      }else{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Home()));
                      }
                   }
                    print('Email: '+email);
                    print('Password: '+password);
                  },
                ),
              ],
            ),
          ),
          ),

      );

  }
}
