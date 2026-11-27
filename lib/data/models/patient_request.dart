import 'request_category.dart';

enum RequestStatus {
  pending('Solicitação enviada'),
  inProgress('Em atendimento'),
  attended('Solicitação atendida');

  final String label;
  const RequestStatus(this.label);
}

class PatientRequest {
  final String id;
  final RequestCategory? category; // null = emergência
  final bool isEmergency;
  final String description;
  final DateTime createdAt;
  final RequestStatus status;

  const PatientRequest({
    required this.id,
    required this.description,
    required this.createdAt,
    this.category,
    this.isEmergency = false,
    this.status = RequestStatus.pending,
  });

  PatientRequest copyWith({RequestStatus? status}) => PatientRequest(
        id: id,
        category: category,
        isEmergency: isEmergency,
        description: description,
        createdAt: createdAt,
        status: status ?? this.status,
      );
}
