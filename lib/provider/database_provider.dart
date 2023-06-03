import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    getData();
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  List deuData = [];

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
  await db.collection('deudores').add({"name": name, "phone": phone, "price": deuda});
  notifyListeners();


}
}


