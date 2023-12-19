import 'package:barbers_app/models/barber_model.dart';
import 'package:barbers_app/service/barber_service.dart';

abstract class IBarberRepository {
  List<Barber> fetchBarbers();
  Barber? fetchBarberById(int id);
  void createBarber(String name, String description);
}

class BarberRepository implements IBarberRepository {
  final IBarberService _service;

  BarberRepository(this._service);

  @override
  List<Barber> fetchBarbers() {
    return _service.getBarbers();
  }

  @override
  Barber? fetchBarberById(int id) {
    return _service.getBarberById(id);
  }

  @override
  void createBarber(String name, String description) {
    _service.createBarber(name, description);
  }
}