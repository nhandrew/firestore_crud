import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/models/product.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Future<void> saveProduct(Product product){
    return _db.collection('products').document(product.productId).setData(product.toMap());
  }

  Stream<List<Product>> getProducts(){
    return _db.collection('products').snapshots().map((snapshot) => snapshot.documents.map((document) => Product.fromFirestore(document.data)).toList());
  }

  Future<void> removeProduct(String productId){
    return _db.collection('products').document(productId).delete();
  }


}