
import 'package:app_salerno/Beans/StrutturaServizio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  //collection reference
  final CollectionReference strutturecollezione = FirebaseFirestore.instance
      .collection('strutture-salerno');


  //Prendiamo un elenco di strutture dal nostro database
  Stream<List<Struttura>> get getStrutture {
    print('Sono in GetStrutture');
    return strutturecollezione.snapshots().map(
        (snapshot) => snapshot.docs.map((doc) {
          print('Esamino '+doc.get('name'));
          var lt = doc.get('lat');
          var lg = doc.get('long');
          Struttura test = Struttura('id', 'name', 40.680408, 14.77211, 'city', 'address', 'phone', 'categoria', 'page', 0);
          test.id = doc.id;
          test.name = doc.get('name');
          test.address = doc.get('address');
          test.phone = doc.get('phone');
          test.city = doc.get('city');
          test.categoria = doc.get('category');
          test.page = doc.get('page');
          test.long = lg;
          test.lat = lt;
          return test;
        }).toList()
    );
  }


  //modifica di una Struttura passando il suo id e la struttura da inserire all'itnerno
  Future updateStrutturaData(Struttura struttura) async {
    print('FUNZIONE MODIFICA!');
    print(struttura.toString());
     await strutturecollezione.doc(struttura.id).update({
      'name': struttura.name,
      'city': struttura.city,
      'lat': struttura.lat,
      'long': struttura.long,
      'address': struttura.address,
      'phone': struttura.phone,
      'page': struttura.page,
      'category': struttura.categoria
    });
     return true;
  }

  void deleteStruttura(Struttura struttura) async {
    await strutturecollezione.doc(struttura.id).delete();
  }

  //modifica di una Struttura passando il suo id e la struttura da inserire all'itnerno
  Future addStrutturaData(Struttura struttura) async {
     await strutturecollezione.add({
      'name': struttura.name,
      'city': struttura.city,
      'lat': struttura.lat,
      'long': struttura.long,
      'address': struttura.address,
      'phone': struttura.phone,
      'page': struttura.page,
      'category': struttura.categoria
    });
     return true;
  }


}