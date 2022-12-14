import 'package:app_salerno/Beans/Utente.dart';
import 'package:app_salerno/Screens/AdminPage%20/modifiche.dart';
import 'package:app_salerno/Screens/Home/home.dart';
import 'package:app_salerno/Screens/Home/wrapper.dart';
import 'package:app_salerno/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:app_salerno/Screens/Maps/vistaMappa.dart';
import 'package:app_salerno/Screens/authenticate/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_salerno/Beans/Position.dart';
import 'package:app_salerno/Screens/Pages/servizi.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(InsideHome());
}

class InsideHome extends StatelessWidget {
  const InsideHome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InsideHomePage(title: 'Flutter Home Page'),
    );

  }
}

class InsideHomePage extends StatefulWidget {
  const InsideHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<InsideHomePage> createState() => _InsideHomePageState();
}

class _InsideHomePageState extends State<InsideHomePage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Container(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            //decoration: BoxDecoration(
            //  image: DecorationImage(
            //    image: AssetImage("assets/wallp.png"),
            //    fit: BoxFit.cover,
            //  ),
            //),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(25),
              child: Column (children: [
                SizedBox(height: 20),
                Image(
                    image:AssetImage('assets/logoSalerno.png'
                        ''),
                    height: 350,
                    width: 350
                ),

                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      minimumSize: Size(290, 60),
                    ),
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Modifiche(cat: 'Tutti')));},
                    child: Text('Modifica',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),
                    )
                ),



                SizedBox(height: 30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      minimumSize: Size(290, 60),
                    ),
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>vistaMappa(position: Posizione(40.683334, 14.766667),)));},
                    child: Text('Mappa',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),
                    )
                ),

                SizedBox(height:30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      minimumSize: Size(290, 60),
                    ),
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceList(cat:'Tutti')));},
                    child: Text('Servizi',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),
                    )
                ),

                SizedBox(height: 35),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      minimumSize: Size(150, 40),
                    ),
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                    },
                    child: Text('Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),
                    )
                ),


              ]
              )
          ),
        )
    );

  }
}