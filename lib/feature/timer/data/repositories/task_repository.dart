import 'package:pocketbase/pocketbase.dart';
import 'package:tictac_work_app/feature/timer/data/data.dart';

class TaskRepository {
  final PocketBase _pocketBase;

  TaskRepository(this._pocketBase);

  Future<void> login() async {
    if (_pocketBase.authStore.isValid == false) {
      await _pocketBase.admins
          .authWithPassword("davidmoran464@gmail.com", "Scorpion1527");
    }
  }

  Future<void> updateTask(Task task) async {}

  Future<void> deleteTask(Task task) async {}
  Future<void> createTask(Task task) async {
    if (_pocketBase.authStore.isValid) {
      final data = {
        "title": task.title,
        "duration": task.duration,
        "moment_start": task.momentStart.toIso8601String(),
        "moment_end": task.momentEnd.toIso8601String(),
      };

      await _pocketBase.collection("tasks").create(body: data);
    } else {
      await login();
      final data = {
        "title": task.title,
        "duration": task.duration,
        "moment_start": task.momentStart.toIso8601String(),
        "moment_end": task.momentEnd.toIso8601String(),
      };

      await _pocketBase.collection("tasks").create(body: data);
    }
  }

  Future<List<Task>> getTasks() async {
    await login();
    final records = await _pocketBase.collection("tasks").getFullList();
    return records.map((item ) {
      final task = Task(
        title: item.data["title"],
        duration: item.data["duration"],
        momentStart: DateTime.parse(item.data["moment_start"]),
        momentEnd: DateTime.parse(item.data["moment_end"]),
      );
      return task;
    }).toList();
  }
}
