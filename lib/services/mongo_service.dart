// lib/services/mongo_service.dart
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static const String _uri = 'mongodb+srv://naveen:abcde12345@cluster0.otuck.mongodb.net/jobseeker?retryWrites=true&w=majority';
  static const String _collectionName = 'jobseeker'; // your collection name

  static late Db _db;
  static late DbCollection _collection;

  static Future<void> connect() async {
    _db = await Db.create(_uri);
    await _db.open();
    _collection = _db.collection(_collectionName);
  }

  static Future<void> insertLocation(String city) async {
    await _collection.insertOne({
      'city': city,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  static Future<void> close() async {
    await _db.close();
  }
}
