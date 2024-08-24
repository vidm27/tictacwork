import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictac_work_app/config/theme/app_theme.dart';
import 'package:tictac_work_app/feature/timer/presentations/providers/counttime_provider.dart';

class TimerScreen extends ConsumerWidget {
  static String name = "home_screen";
  final TextEditingController _taskNameController = TextEditingController();

  TimerScreen({Key? key}) : super(key: key);

  String formatedTime(int timer) {
    print("timer: $timer");
    final hours = (timer ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((timer ~/ 60) % 60).toString().padLeft(2, '0');
    final seconds = (timer % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TimerState timer = ref.watch(timerProvider);
    final TimerNotifier timerNotifier = ref.watch(timerProvider.notifier);

    if(timer.isActivateTime == false){
      _taskNameController.clear();
    }

    return Scaffold(
      /// Título de la página
      appBar: AppBar(
        backgroundColor: AppStyle.primaryColor,
        leading: const Icon(Icons.settings_rounded, color: Colors.white),
        title: const Text(
          'Timer',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded, color: Colors.white)),
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
                    color: AppStyle.primaryColor,
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
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 50,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                    controller: _taskNameController,
                                    onChanged: (value) {
                                      _taskNameController.text = value;
                                      timerNotifier.changeTitle(value);
                                    },
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(
                                        color: AppStyle.secondaryColor,
                                      ),
                                      hintText: "Nombre de la tarea",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Text(
                                  formatedTime(timer.time),
                                  style: const TextStyle(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Wrap(
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
                                      const Text(
                                        'Total de hoy',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 215, 186, 248)),
                                      ),
                                      Text(
                                        formatedTime(timer.totalTime),
                                        style: const TextStyle(
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
                child: timer.tasks.isEmpty
                    ? const Text(
                        'No se han creado tareas',
                        style: TextStyle(
                            fontSize: 18, color: Color(0xFF7A738E)),
                      )
                    : ListView.separated(
                        itemCount: timer.tasks.length,
                        itemBuilder: (context, index) {
                          final task = timer.tasks[index];
                          return ListTile(
                            // leading: Icon(Icons.car_rental),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Text(task.title),
                            titleTextStyle: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF605879),
                                fontWeight: FontWeight.normal),
                            subtitle: Text(formatedTime(task.duration)),
                            subtitleTextStyle: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8366A1),
                                fontWeight: FontWeight.bold),
                            trailing: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color:
                                              Color.fromRGBO(214, 208, 223, 1),
                                          width: 1.0))),
                              child: IconButton(
                                  iconSize: 40,
                                  style: const ButtonStyle(
                                      iconColor: WidgetStatePropertyAll(
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
          ],
        ),
      ),
    );
  }
}
