class Patient {
  final String id;
  final String name;
  final String bed;
  final DateTime admissionDate;

  const Patient({
    required this.id,
    required this.name,
    required this.bed,
    required this.admissionDate,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json['id'] as String,
        name: json['name'] as String,
        bed: json['bed'] as String,
        admissionDate: DateTime.parse(json['admission_date'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'bed': bed,
        'admission_date': admissionDate.toIso8601String(),
      };
}
