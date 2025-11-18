import 'package:cloud_firestore/cloud_firestore.dart';

class CrudService {
  final CollectionReference items = FirebaseFirestore.instance.collection(
    'items',
  );

  Future<void> addItems(String name, int quantity) {
    // Create item
    return items.add({
      'name': name,
      'quantity': quantity,
      'created_at': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getItems() {
    // Read items
    return items.orderBy('created_at', descending: true).snapshots();
  }

  Future<void> updateItem(String id, String name, int quantity) {
    return items.doc(id).update({'name': name, 'quantity': quantity});
  }

  Future<void> deleteItem(String id) {
    return items.doc(id).delete();
  }
}
