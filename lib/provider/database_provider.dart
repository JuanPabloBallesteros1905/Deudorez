import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    getData();
    getMd();
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  List deuData = [];

  List md = [];

  //*Metodo para llamar datos de clientes
  Future<void> getData() async {
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
  }

  Future<void> addClients(String name, String phone, String deuda) async {
    await db
        .collection('deudores')
        .add({"name": name, "phone": phone, "price": deuda});
    notifyListeners();
  }

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
}
