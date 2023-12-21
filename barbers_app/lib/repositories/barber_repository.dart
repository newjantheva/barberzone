import 'package:barbers_app/models/barber_model.dart';
import 'package:barbers_app/services/barber_service.dart';

abstract interface class BarberRepository {
  Future<List<Barber>> fetchBarbers();
  // Barber? fetchBarberById(int id);
  // Future<List<Barber>> searchBarbers(String query);
  // void createBarber(String name, String description);
}

class BarberRepositoryImpl implements BarberRepository {
  final BarberService _service;

  BarberRepositoryImpl(this._service);

  @override
  Future<List<Barber>> fetchBarbers() async {
    return await _service.getBarbers();
  }

  // @override
  // Barber? fetchBarberById(int id) {
  //   return _service.getBarberById(id);
  // }

  // @override
  // Future<List<Barber>> searchBarbers(String query) async {
  //   List<Barber> results = [];

  //   final barbers = await fetchBarbers();

  //   if (query.isNotEmpty) {
  //     results = barbers
  //         .where((barber) =>
  //             barber.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   }

  //   return results;
  // }

  // @override
  // void createBarber(String name, String description) {
  //   _service.createBarber(name, description);
  // }
}
