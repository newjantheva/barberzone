import 'package:barbers_app/models/barber_model.dart';
import 'package:barbers_app/service/barber_service.dart';

abstract class IBarberRepository {
  Future<List<Barber>> fetchBarbers();
  Barber? fetchBarberById(int id);
  Future<List<Barber>> searchBarbers(String query);
  Future<Barber> createBarber(String name, String description);
}

class BarberRepository implements IBarberRepository {
  final IBarberService _service;

  BarberRepository(this._service);

  @override
  Future<List<Barber>> fetchBarbers() async {
    return await _service.getBarbers();
  }

  @override
  Barber? fetchBarberById(int id) {
    return _service.getBarberById(id);
  }

  @override
  Future<List<Barber>> searchBarbers(String query) async {
    List<Barber> results = [];

    final barbers = await fetchBarbers();

    if (query.isNotEmpty) {
      results = barbers
          .where((barber) =>
              barber.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return results;
  }

  @override
  Future<Barber> createBarber(String name, String description) {
    final barber = _service.createBarber(name, description);
    return barber;
  }
}
