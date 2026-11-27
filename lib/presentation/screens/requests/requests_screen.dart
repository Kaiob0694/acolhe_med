import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../data/models/patient_request.dart';
import '../../../data/repositories/request_repository.dart';
import '../../widgets/request_tile.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  // TODO: compartilhar o mesmo repositório da Home (Provider/get_it).
  final RequestRepository _repository = MockRequestRepository();
  late Future<List<PatientRequest>> _future;

  @override
  void initState() {
    super.initState();
    _future = _repository.getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.myRequests)),
      body: FutureBuilder<List<PatientRequest>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snapshot.data!;
          if (items.isEmpty) {
            return const Center(child: Text(AppStrings.noRequests));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, i) => RequestTile(request: items[i]),
          );
        },
      ),
    );
  }
}
