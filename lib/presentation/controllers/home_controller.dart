import 'package:flutter/foundation.dart';

import '../../data/models/patient.dart';
import '../../data/models/patient_request.dart';
import '../../data/models/request_category.dart';
import '../../data/repositories/request_repository.dart';

/// Controller simples com ChangeNotifier (sem pacotes externos).
/// Quando o projeto crescer, dá para trocar por Provider/Riverpod/Bloc.
class HomeController extends ChangeNotifier {
  HomeController({RequestRepository? repository})
      : _repository = repository ?? MockRequestRepository();

  final RequestRepository _repository;

  Patient? patient;
  List<PatientRequest> requests = [];
  bool loading = true;
  int unreadNotifications = 1;

  Future<void> load() async {
    loading = true;
    notifyListeners();
    patient = await _repository.getCurrentPatient();
    requests = await _repository.getRequests();
    loading = false;
    notifyListeners();
  }

  Future<void> sendRequest(RequestCategory category, String description) async {
    await _repository.sendRequest(category: category, description: description);
    requests = await _repository.getRequests();
    notifyListeners();
  }

  Future<void> sendEmergency() async {
    await _repository.sendEmergency();
    requests = await _repository.getRequests();
    notifyListeners();
  }

  void clearNotifications() {
    unreadNotifications = 0;
    notifyListeners();
  }
}
