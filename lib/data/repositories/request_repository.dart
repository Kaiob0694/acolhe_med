import '../models/patient.dart';
import '../models/patient_request.dart';
import '../models/request_category.dart';

/// Contrato de acesso aos dados. Hoje usamos a versão mock;
/// depois é só criar uma implementação com API/Firebase.
abstract class RequestRepository {
  Future<Patient> getCurrentPatient();
  Future<List<PatientRequest>> getRequests();
  Future<PatientRequest> sendRequest({
    required RequestCategory category,
    required String description,
  });
  Future<PatientRequest> sendEmergency();
}

class MockRequestRepository implements RequestRepository {
  final List<PatientRequest> _requests = [
    PatientRequest(
      id: '1',
      category: RequestCategory.comodidade,
      description: 'Água solicitada',
      createdAt: DateTime.now().copyWith(hour: 9, minute: 15),
      status: RequestStatus.attended,
    ),
  ];

  @override
  Future<Patient> getCurrentPatient() async {
    return Patient(
      id: 'p1',
      name: 'Kaio',
      bed: '204-A',
      admissionDate: DateTime(2026, 11, 9),
    );
  }

  @override
  Future<List<PatientRequest>> getRequests() async {
    final list = [..._requests];
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }

  @override
  Future<PatientRequest> sendRequest({
    required RequestCategory category,
    required String description,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    final request = PatientRequest(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      category: category,
      description: description,
      createdAt: DateTime.now(),
    );
    _requests.add(request);
    return request;
  }

  @override
  Future<PatientRequest> sendEmergency() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final request = PatientRequest(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      isEmergency: true,
      description: 'Emergência acionada',
      createdAt: DateTime.now(),
    );
    _requests.add(request);
    return request;
  }
}
