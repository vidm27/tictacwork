// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictac_work_app/feature/timer/data/data.dart';
import 'package:tictac_work_app/feature/timer/data/repositories/task_repository.dart';
import 'package:tictac_work_app/feature/timer/presentations/providers/task_provider.dart';

final countTimerProvider = StateProvider((ref) => '00:00:00');
final secondsProvider = StateProvider((ref) => 0);



class TimerState {
  final int time;
  final bool isActivateTime;
  final List<Task> tasks;

  TimerState(
      {required this.time, required this.isActivateTime, required this.tasks});

  TimerState copyWith({
    int? time,
    bool? isActivateTime,
    List<Task>? tasks,
  }) {
    return TimerState(
      time: time ?? this.time,
      isActivateTime: isActivateTime ?? this.isActivateTime,
      tasks: tasks ?? this.tasks,
    );
  }

  int get totalTime{
    int total = 0;
    for (var task in tasks) {
      total += task.duration;
    }
    return total;
  }
}

final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return TimerNotifier(taskRepository: taskRepository);
});

class TimerNotifier extends StateNotifier<TimerState> {
  final TaskRepository taskRepository;
  TimerNotifier({required this.taskRepository})
      : super(TimerState(
          time: 0,
          isActivateTime: false,
          tasks: [],
        )) {
          loadTasks();
        }

  late Timer _timer;
  String _currentTaskTitle = "Nombre de la tarea";

  void loadTasks() async {
    final tasks = await taskRepository.getTasks();
    state = state.copyWith(tasks: tasks);
  }

  void startTimer() async {
    print("Inciando el timer");
    if (state.isActivateTime == false) {
      if (state.tasks.isEmpty) {
        state = state.copyWith(isActivateTime: true, tasks: [
          Task(
              title: _currentTaskTitle,
              duration: state.time,
              momentStart: DateTime.now(),
              momentEnd: DateTime.now())
        ]);
      } else {
        state.tasks.add(Task(
            title: _currentTaskTitle,
            duration: state.time,
            momentStart: DateTime.now(),
            momentEnd: DateTime.now()));
        state = state.copyWith(isActivateTime: true);
      }
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        state = state.copyWith(
          time: state.time + 1,
        );
        final Task lastTask = state.tasks.last;
        final updateLastTask = lastTask.copyWith(
          duration: state.time,
        );
        state.tasks[state.tasks.length - 1] = updateLastTask;
      });
    }
  }

  void stopTimer() async {
    if (state.isActivateTime) {
      _timer.cancel();
      final Task lastTask = state.tasks.last;
      final updateLastTask = lastTask.copyWith(
        momentEnd: DateTime.now(),
      );
      await taskRepository.createTask(updateLastTask);
      final tasks  = await taskRepository.getTasks();
      state = state.copyWith(isActivateTime: false, time: 0, tasks: tasks);
      _currentTaskTitle = "Nombre de la tarea";
    }
  }

  void changeTitle(String title) async {
    _currentTaskTitle = title;

    await taskRepository.getTasks();
    if (state.tasks.isEmpty) return;

    if (state.isActivateTime) {
      final Task lastTask = state.tasks.last;
      final updateLastTask = lastTask.copyWith(title: title);
      state.tasks[state.tasks.length - 1] = updateLastTask;
    }

  }

  get currentTitle => _currentTaskTitle;

  void resetTimer() {
    state = state.copyWith(time: 0, isActivateTime: false);
  }
}
