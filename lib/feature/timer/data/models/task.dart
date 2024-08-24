class Task {
  final String title;
  final int duration;
  final DateTime momentStart;
  final DateTime momentEnd;

  Task(
      {required this.title,
      required this.duration,
      required this.momentStart,
      required this.momentEnd});

  Task copyWith({
    String? title,
    int? duration,
    DateTime? momentStart,
    DateTime? momentEnd,
  }) {
    return Task(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      momentStart: momentStart ?? this.momentStart,
      momentEnd: momentEnd ?? this.momentEnd,
    );
  }
}