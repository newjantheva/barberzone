import 'package:barbers_app/models/barber_model.dart';

abstract class IBarberService {
  List<Barber> getBarbers();
  Barber? getBarberById(int id);
  void createBarber(String name, String description);
}

class BarberService implements IBarberService {
  final List<Barber> _barbers = [
    Barber(id: 1, name: 'Elin Frisør', description: 'Varmeste Fade'),
    Barber(id: 2, name: 'Salon Eliten', description: 'Færdig ejer'),
    Barber(id: 3, name: 'Elias', description: 'Ligger den værste fade'),
    Barber(id: 4, name: 'Hørning Frisør', description: 'Fin nok')
  ];

  @override
  List<Barber> getBarbers() {
    return _barbers;
  }

  @override
  Barber? getBarberById(int id) {
    return _barbers.firstWhere((barber) => barber.id == id);
  }
}
