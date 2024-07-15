import 'package:barbers_app/models/barber_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class BarberService {
  Future<List<Barber>> getBarbers();
  Future<void> addBarber(Map<String, dynamic> barber);
  Future<void> updateBarber(String barberId, Map<String, dynamic> barber);
  Future<void> deleteBarber(String barberId);
  Future<Barber> getBarberById(String barberId);
}

class BarberServiceImpl implements BarberService {
  final List<Barber> _barbers = [];
  final CollectionReference _collection;

  FirebaseFirestore db = FirebaseFirestore.instance;

  BarberServiceImpl(String collectionName)
      : _collection = FirebaseFirestore.instance
            .collection(collectionName)
            .doc("barbers")
            .collection("first-sample");

  @override
  Future<void> addBarber(Map<String, dynamic> barber) {
    return _collection.add(barber);
  }

  @override
  Future<void> deleteBarber(String barberId) {
    return _collection.doc(barberId).delete();
  }

  @override
  Future<Barber> getBarberById(String barberId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Barber>> getBarbers() async {
    try {
      QuerySnapshot querySnapshot = await _collection.get();

      for (var doc in querySnapshot.docs) {
        Barber barber = Barber.fromJson(doc.data() as Map<String, dynamic>);
        _barbers.add(barber);
      }
    } catch (e) {}

    return _barbers;
  }

  @override
  Future<void> updateBarber(String barberId, Map<String, dynamic> barber) {
    return _collection.doc(barberId).update(barber);
  }
}
