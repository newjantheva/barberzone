import 'package:barbers_app/models/barber_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IBarberService {
  Future<List<Barber>> getBarbers();
  Barber? getBarberById(int id);
  void createBarber(String name, String description);
}

class BarberService implements IBarberService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  BarberService();
  final List<Barber> _barbers = [];

  @override
  Future<List<Barber>> getBarbers() async {
    final barbersData = await db.collection("barberzone").get();

    for (var barberData in barbersData.docs) {
      final barber = Barber.fromMap(barberData.data());
      _barbers.add(barber);
    }

    return _barbers;
  }

  @override
  Barber? getBarberById(int id) {
    return _barbers.firstWhere((barber) => barber.id == id);
  }

  @override
  void createBarber(String name, String description) {
    int newId = _barbers.length + 1;
    Barber newBarber = Barber(id: newId, name: name, description: description);
    _barbers.add(newBarber);
  }
}
