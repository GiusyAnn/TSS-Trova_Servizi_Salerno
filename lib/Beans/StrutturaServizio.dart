import 'dart:convert';

// import 'package:json_annotation/json_annotation.dart';

//@JsonSerializable()
class Struttura {
  String name;
  double lat;
  double long;
  String city;
  String address;
  int phone;
  String categoria;
  String page;


  Struttura(this.name, this.lat, this.long, this.city, this.address,
      this.phone, this.categoria, this.page);

  String getname(){ return this.name; }
  String getcity(){ return this.city;}
  double getlat(){ return this.lat;}
  double getlong(){return this.long;}
  String getaddress(){return this.address;}
  int getphone(){return this.phone;}
  String getcategory(){ return this.categoria;}
  String getpage() {return this.page;}

  @override
  String toString() {
    return 'StrutturaPreview{_name: '+this.name+' \n $lat $long \n _address: '+this.address+'}';
  }


 /*  Locale.convertFromJson(Map<String, dynamic> json)
      : this.name = json['nome'],
        this.address=json['indirizzo'],
        this.city=json['citta'],
        this.iva=json['partitaiva'],
        this.rate=json['recensione'],
        this.phone=json['telefono'],
        this.n_rates=json['n_recensioni'],
        this.isAllowed =  (json['is_allowed'].toString().toLowerCase() == "true") ? true : false,
        this.piattiCategoria = Locale.createListOfPiattiCategoria(json['categorie_piatti']);

  static List<PiattoCategoria> createListOfPiattiCategoria(List<dynamic> tmpDishJson){

    if(tmpDishJson == null)  return new List();
    List<PiattoCategoria> listaPiattiCategoria = new List();
    tmpDishJson.forEach((element) {
      listaPiattiCategoria.add(PiattoCategoria.convertFromJson(element));
    });

    return listaPiattiCategoria;
  }

  static Locale createLocaleFromJson(Map<String, dynamic> json) {
  Locale u = Locale.convertFromJson(json);
    return u;
  }


  static Map<String, dynamic> createJsonFromUser(Locale u) {
        return {
        'nome': u.name,
        'indirizzo': u.address,
        'citta': u.city,
        'partitaiva': u.iva,
        'recensione': u.rate,
        'telefono': u.phone,
        'n_recensioni': u.n_rates,
        'is_allowed' : u.isAllowed,
        'categorie_piatti': createJsonListaPiattiCategoria(u.piattiCategoria)
        };
  }

  static String createJsonListaPiattiCategoria(List<PiattoCategoria> piattiCategoria) {
    String piattiCategoriaJson = "[";
    int index = 0;

    for (PiattoCategoria pc in piattiCategoria) {
      piattiCategoriaJson +=
          PiattoCategoria.createJsonFromPiattoCategoria(pc).toString();

      index++;
      if (index < piattiCategoria.length) piattiCategoriaJson += ",";
    }

    return piattiCategoriaJson;
  } */
}
/*
@JsonSerializable()
class LocalePreview {
  String _name;
  double _rate;
  String _city;
  bool _isAllowed;


  LocalePreview(this._name, this._rate, this._city);

  String getName(){
    return _name;
  }

  int getRate() {
    return _rate.round();
  }


  String get city => _city;

  bool get isAllowed => _isAllowed;

  LocalePreview.convertFromJson(Map<String, dynamic> json)
      : this._name = json['nome'],
        this._city = json['citta'],
        this._rate = double.parse(json['recensione']),
        this._isAllowed = (json['is_allowed'].toString().toLowerCase() == "true") ? true : false;

  static LocalePreview createLocalePreviewFromJson(Map<String, dynamic> json) {
    LocalePreview u = LocalePreview.convertFromJson(json);
    return u;
  }

  static List<LocalePreview> createListLocaliPreviewFromJson(String listJson){
    List<LocalePreview> l = new List();
    List<dynamic> myMap = json.decode(listJson);
    print(myMap);

    myMap.forEach((element) {
      l.add(LocalePreview.convertFromJson(element));
    });

    return l;
  }

  @override
  String toString() {
    return 'LocalePreview{_name: $_name, _rate: $_rate, _city: $_city, , _isAllowed: $_isAllowed}';
  }

  static Map<String, dynamic> createJsonFromUser(LocalePreview u) {
    return {
      'nome': u._name,
      'recensione': u._rate,
      'citta': u._city,
      'is_allowed': u._isAllowed
    };
  }
}

 */



