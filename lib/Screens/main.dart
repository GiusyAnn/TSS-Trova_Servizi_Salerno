import 'package:app_salerno/Screens/testgeo.dart';
import 'package:app_salerno/vistaMappadue.dart';
import 'package:flutter/material.dart';
import 'package:app_salerno/Screens/vistaMappa.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
              padding: const EdgeInsets.all(30),
              child: Column (children: [
                SizedBox(height: 30),
                Image(
                    image:AssetImage('assets/logoSalerno.png'
                        ''),
                    height: 350,
                    width: 350
                ),

                SizedBox(height: 50),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      minimumSize: Size(290, 60),
                      side: BorderSide(width: 2.5, color:Color.fromRGBO(44, 77, 155, 1)),
                      primary: Color.fromRGBO(0, 169, 224, 1),
                    ),
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>testgeo()));},
                    child: Text('Login',
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
                      side: BorderSide(width: 2.5, color:Color.fromRGBO(44, 77, 155, 1)),
                      primary: Color.fromRGBO(0, 169, 224, 1),
                    ),
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>vistaMappa()));},
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

                SizedBox(height: 30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      minimumSize: Size(290, 60),
                      side: BorderSide(width: 2.5, color:Color.fromRGBO(44, 77, 155, 1)),
                      primary: Color.fromRGBO(0, 169, 224, 1),
                    ),
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>vistaMappadue()));},
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


              ]
              )
          ),
        )
    );

  }
}