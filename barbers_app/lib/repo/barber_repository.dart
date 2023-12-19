import 'package:barbers_app/models/barber_model.dart';
import 'package:barbers_app/service/barber_service.dart';
import 'package:flutter/material.dart';

abstract class IBarberRepository {
  List<Barber> fetchBarbers();
  Barber? fetchBarberById(int id);
  List<Barber> searchBarbers(String query);
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
  List<Barber> searchBarbers(String query) {
    List<Barber> results = [];

    final barbers = fetchBarbers();

    if (query.isNotEmpty) {
      results = barbers
          .where((barber) =>
              barber.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return results;
  }
}
