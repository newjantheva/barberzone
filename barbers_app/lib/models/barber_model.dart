class Barber {
  final int id;
  String? name;
  String? description;
  //final bool isMobileCutAvailable;

  Barber({required this.id, required this.name, required this.description});

  factory Barber.fromMap(Map<String, dynamic> map) {
    return Barber(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description};
  }
}
