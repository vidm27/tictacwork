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
                    height: 230,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 30, top: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                const Text(
                                  "Tarea de ejemplo",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 215, 186, 248)),
                                ),
                                Text(
                                  formatedTime(timer),
                                  style: const TextStyle(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Wrap(
                                    direction: Axis.vertical,
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 2,
                                    children: [
                                      Text(
                                        'Tiempo Límite',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 215, 186, 248)),
                                      ),
                                      Text(
                                        '00:00:00',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    direction: Axis.vertical,
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 2,
                                    children: [
                                      Text(
                                        'Total de hoy',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 215, 186, 248)),
                                      ),
                                      Text(
                                        '00:00:00',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // leading: Icon(Icons.car_rental),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: const Text('Tarea de diseno'),
                      titleTextStyle: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF605879),
                          fontWeight: FontWeight.normal),
                      subtitle: const Text('00:00:00'),
                      subtitleTextStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8366A1),
                          fontWeight: FontWeight.bold),
                      trailing: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Color.fromRGBO(214, 208, 223, 1),
                                    width: 1.0))),
                        child: IconButton(
                            iconSize: 40,
                            style: const ButtonStyle(
                                iconColor: MaterialStatePropertyAll(
                                    Color(0xFF443A5F))),
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow_rounded)),
                      ),
                      tileColor: const Color(0xFFEFEDF4),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                      width: double.infinity,
                    );
                  },
                ),
              ),
            ),
            SafeArea(
              child: Container(
                color: Colors.amber,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          ref.read(timerProvider.notifier).startTimer();
                        },
                        icon: const Icon(Icons.play_arrow_rounded),
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xFFE76963),
                            ),
                            iconColor: MaterialStatePropertyAll(Colors.white)),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          ref.read(timerProvider.notifier).stopTimer();
                        },
                        icon: const Icon(Icons.stop_rounded),
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xFF443A5F),
                            ),
                            iconColor: MaterialStatePropertyAll(Colors.white)),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          // ref.read(timerProvider.notifier).stopTimer();
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              builder: (context) {
                                return const SizedBox(
                                  height: 200,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(children: [
                                      TextField(
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Nombre de tarea'
                                        ),
                                      ),
                                    ]),
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.add_rounded),
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xFF443A5F),
                            ),
                            iconColor: MaterialStatePropertyAll(Colors.white)),
                      ),
                    ]),
              ),
            )
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
