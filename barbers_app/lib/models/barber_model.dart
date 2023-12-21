class Barber {
  final String id;
  final String name;
  final String description;

  Barber({required this.id, required this.name, required this.description});

  Barber.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        description = json['description'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
