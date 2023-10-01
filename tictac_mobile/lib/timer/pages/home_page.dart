import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictac_mobile/timer/providers/counttime_provider.dart';

class HomeScreen extends ConsumerWidget {
  static String name = "home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  String formatedTime(int timer) {
    final hours = (timer ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((timer ~/ 60) % 60).toString().padLeft(2, '0');
    final seconds = (timer % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int timer = ref.watch(timerProvider);

    return Scaffold(
      /// Título de la página
      appBar: AppBar(
        backgroundColor: const Color(0xFF443A5F),
        title: const Text(
          'Timer',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ///TODO Reiniciar el timer
              },
              icon: const Icon(Icons.restart_alt_outlined))
        ],
      ),

      /// Contador
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: const Color(0xFF443A5F),
                    height: 200,
                    child: Center(
                      child: Text(
                        formatedTime(timer),
                        style: const TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              IconButton(
                onPressed: () {
                  ref.read(timerProvider.notifier).startTimer();
                },
                icon: const Icon(Icons.play_arrow_rounded),
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFE76963),),
                        iconColor: MaterialStatePropertyAll(Colors.white)),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  ref.read(timerProvider.notifier).stopTimer();
                },
                icon: const Icon(Icons.stop_rounded),
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF443A5F),),
                        iconColor: MaterialStatePropertyAll(Colors.white)),
              ),
            ])
          ],
        ),
      ),

      /// Play - Stop
    );
  }
}

// class _CounterLabel extends StatelessWidget {
//   final String time;
//   const _CounterLabel({
//     Key? key,
//     required this.time,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.expand(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Icon(Icons.timer_outlined, color: Colors.blue, size: 60),
//           const SizedBox(width: 10),
//           Text(
//             time,
//             style: const TextStyle(fontSize: 50),
//           ),
//         ],
//       ),
//     );
//   }
// }
