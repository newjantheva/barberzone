class Barber {
  final int id;
  final String name;
  final String description;

  Barber({required this.id, required this.name, required this.description});

  factory Barber.fromMap(Map<String, dynamic> map) {
    return Barber(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
