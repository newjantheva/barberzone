import 'package:barbers_app/models/barber_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IBarberService {
  Future<List<Barber>> getBarbers();
  Barber? getBarberById(int id);
  Future<Barber> createBarber(String name, String description);
}

class BarberService implements IBarberService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  BarberService();
  final List<Barber> _barbers = [];

  @override
  Future<List<Barber>> getBarbers() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('barberzone')
          .doc('barbers')
          .collection('first-sample')
          .get();

      for (var doc in querySnapshot.docs) {
        Barber barber = Barber.fromMap(doc.data() as Map<String, dynamic>);
        _barbers.add(barber);
      }
    } catch (e) {}

    return _barbers;
  }

  @override
  Barber? getBarberById(int id) {
    return _barbers.firstWhere((barber) => barber.id == id);
  }

  @override
  Future<Barber> createBarber(String name, String description) async {
    int newId = _barbers.length + 1;
    Barber newBarber = Barber(id: newId, name: name, description: description);
    DocumentReference barbersDoc = FirebaseFirestore.instance.collection('barberzone').doc('barbers');
    CollectionReference barbersCollection = barbersDoc.collection('first-sample');
    await barbersCollection.add(newBarber.toMap());
    return newBarber;
  }
}
