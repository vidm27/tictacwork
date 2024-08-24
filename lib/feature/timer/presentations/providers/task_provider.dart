import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictac_work_app/feature/timer/data/repositories/task_repository.dart';
import 'package:tictac_work_app/feature/timer/presentations/providers/pocketbase_provider.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final pocketBase = ref.read(pocketBaseProvider);
  return TaskRepository(pocketBase);
});
