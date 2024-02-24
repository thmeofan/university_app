class UniversityInfo {
  String name;
  String address;
  String description;
  int rating;
  List<String> pros;
  List<String> cons;
  List<Specialty> specialties;

  UniversityInfo({
    required this.name,
    required this.address,
    required this.description,
    this.rating = 0,
    this.pros = const [],
    this.cons = const [],
    this.specialties = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'description': description,
      'rating': rating,
      'pros': pros,
      'cons': cons,
      'specialties':
          specialties.map((specialty) => specialty.toJson()).toList(),
    };
  }

  static UniversityInfo fromJson(Map<String, dynamic> json) {
    return UniversityInfo(
      name: json['name'],
      address: json['address'],
      description: json['description'],
      rating: json['rating'],
      pros: List<String>.from(json['pros']),
      cons: List<String>.from(json['cons']),
      specialties: (json['specialties'] as List)
          .map((specialtyJson) => Specialty.fromJson(specialtyJson))
          .toList(),
    );
  }
}

class Specialty {
  String name;
  int priority;

  Specialty({required this.name, this.priority = 0});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'priority': priority,
    };
  }

  static Specialty fromJson(Map<String, dynamic> json) {
    return Specialty(
      name: json['name'],
      priority: json['priority'],
    );
  }
}
