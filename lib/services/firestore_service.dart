import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static FirestoreService _instance = FirestoreService._internal();

  static FirestoreService get instance => _instance;

  factory FirestoreService() => _instance;

  FirestoreService._internal() {
    _firestore = Firestore.instance;
  }

  Firestore _firestore;
}
