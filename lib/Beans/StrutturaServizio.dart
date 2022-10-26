class Struttura {
  String id;
  String name;
  double lat;
  double long;
  String city;
  String address;
  String phone;
  String categoria;
  String page;
  int color;


  Struttura(this.id, this.name, this.lat, this.long, this.city, this.address,
      this.phone, this.categoria, this.page, this.color);

  String getid() {
    return this.id;
  }

  String getname() {
    return this.name;
  }

  String getcity() {
    return this.city;
  }

  double getlat() {
    return this.lat;
  }

  double getlong() {
    return this.long;
  }

  String getaddress() {
    return this.address;
  }

  String getphone() {
    return this.phone;
  }

  String getcategory() {
    return this.categoria;
  }

  String getpage() {
    return this.page;
  }

  @override
  String toString() {
    return 'StrutturaPreview{_id: ' + this.id + '_name: ' + this.name +
        ' \n $lat $long \n _address: ' + this.address + '}';
  }
}


