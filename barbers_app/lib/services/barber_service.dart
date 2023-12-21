import 'package:barbers_app/models/barber_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract interface class BarberService {
  Future<List<Barber>> getBarbers();
  Future<void> addBarber(Map<String, dynamic> barber);
  Future<void> updateBarber(String barberId, Map<String, dynamic> barber);
  Future<void> deleteBarber(String barberId);
  Future<Barber> getBarberById(String barberId);
}

class BarberServiceImpl implements BarberService {
  final CollectionReference _collection;
  late List<Barber> _barbers;

  FirebaseFirestore db = FirebaseFirestore.instance;

  BarberServiceImpl(String collectionName)
      : _collection = FirebaseFirestore.instance.collection(collectionName);

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
    // TODO: implement getBarberById
    throw UnimplementedError();
  }

  @override
  Future<List<Barber>> getBarbers() async {
    try {
      List<Barber> barbersList = []; // Create a list to store Barber objects

      // Get data from the Firestore collection
      await _collection.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          // Perform a null check on result.data()
          if (result.data() != null) {
            // Map the data to a Barber object using your Barber.fromJson constructor
            Barber barber =
                Barber.fromJson(result.data() as Map<String, dynamic>);

            // Add the Barber object to the list
            barbersList.add(barber);
          }
        }
      });

      // Return the list of Barbers as a stream
      return barbersList;
    } catch (e) {
      debugPrint("Error - $e");
      // Return the error as a stream error
      return [];
    }
  }

  @override
  Future<void> updateBarber(String barberId, Map<String, dynamic> barber) {
    return _collection.doc(barberId).update(barber);
  }

  // final List<Barber> _barbers = [];

  // @override
  // Future<List<Barber>> getBarbers() async {
  //   final barbersData = await db.collection("barberzone").get();

  //   for (var barberData in barbersData.docs) {
  //     final barber = Barber.fromMap(barberData.data());
  //     _barbers.add(barber);
  //   }

  //   return _barbers;
  // }

  // @override
  // Barber? getBarberById(int id) {
  //   return _barbers.firstWhere((barber) => barber.id == id);
  // }

  // @override
  // void createBarber(String name, String description) {
  //   int newId = _barbers.length + 1;
  //   Barber newBarber = Barber(id: newId, name: name, description: description);
  //   _barbers.add(newBarber);
  // }

  // @override
  // Future<void> addBarber(Map<String, dynamic> barber) {
  //   // TODO: implement addBarber
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> deleteBarber(String barberId) {
  //   // TODO: implement deleteBarber
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> updateBarber(String barberId, Map<String, dynamic> barber) {
  //   // TODO: implement updateBarber
  //   throw UnimplementedError();
  // }
}
