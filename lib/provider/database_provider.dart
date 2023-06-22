import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    getData();
    getMd();
    getCm();
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  List deuData = [];

  List md = [];

  List cm = [];
  

  


  //*Metodo para llamar datos de clientes
  Future<List> getData() async {
    CollectionReference collectionReference = db.collection('deudores');

    QuerySnapshot querySnapshot = await collectionReference.get();

    for (var element in querySnapshot.docs) {
      final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      final deu = {
        "id": element.id,
        "name": data['name'],
        "phone": data['phone'],
        "price": data['price']
      };
      deuData.add(deu);
    }

  
    notifyListeners();

    return deuData;
  }

  //*Metodo para añadir clientes
  Future<void> addClients(String name, String phone, String deuda) async {
    await db
        .collection('deudores')
        .add({"name": name, "phone": phone, "price": deuda});
    notifyListeners();
  }

  //*Metodo para actualizar pagos de clientes
  Future<void> updatepago(String id, String name, String phone, String newData  ) async {
    await db.collection('deudores').doc(id).set({
      "name": name,
      "phone": phone,
      "price": newData,
      
      });

      print(' nombre: ${name}');
      print(' phone: ${phone}');
      print(' precio: ${newData}');
      
  }

  //*Metodo para llamar a la mercancia disponible
  Future<List> getMd() async {
    CollectionReference collectionReference = db.collection('md');

    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var element in querySnapshot.docs) {
      final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      final mD = {
        "id": element.id,
        "product": data['product'],
        "price": data['price'],
        "amount": data['amount']
      };
      md.add(mD);
    }
    notifyListeners();
    return md;
  }

  Future<void> addItems(String product, String cantidad, String price) async {
    await db
        .collection('md')
        .add({"product": product, "amount": cantidad, "price": price});
  }

  //*Compra de mercancias
  Future<List> getCm() async {
    CollectionReference collectionReference = db.collection('cm');

    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var element in querySnapshot.docs) {
      final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      final cM = {
        "id": element.id,
        "amount": data['amount'],
        "price": data['price'],
        "product": data['product'],
        "purchase price": data['purchase price'],
        "place": data['place']
      };
      cm.add(cM);
    }
    notifyListeners();

    return cm;
  }

  Future<void> addcm(String product, String cantidad, String place,
      String priceCompra, String priceVenta) async {
    await db.collection('cm').add({
      "amount": cantidad,
      "product": product,
      "place": place,
      "purchase price": priceCompra,
      "price": priceVenta
    });
  }
}
