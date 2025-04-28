import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wear_os_demo/focus_timer/controller/focus_timer_controller.dart';

class FocusTimerScreen extends StatelessWidget {
  const FocusTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FocusTimerController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.teal.shade900,
              Colors.blueGrey.shade900,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      LucideIcons.timer,
                      size: 36,
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Focus Mode",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.greenAccent.shade100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 10.0,
                      percent: controller.percent,
                      animation: true,
                      animateFromLastPercent: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.greenAccent,
                      backgroundColor: Colors.grey.shade800,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.timeFormatted,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            controller.isRunning.value ? "Keep going!" : "Paused",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: controller.toggleTimer,
                          icon: Icon(
                            controller.isRunning.value
                                ? LucideIcons.pause
                                : LucideIcons.play,
                            color: Colors.black,
                          ),
                          label: Text(
                            controller.isRunning.value ? "Pause" : "Start",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            shape: const StadiumBorder(),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: controller.reset,
                          icon: const Icon(
                            LucideIcons.rotateCw,
                            color: Colors.white70,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Settings",
                              middleText: "Not implemented yet 😅",
                              confirm: ElevatedButton(
                                onPressed: () => Get.back(),
                                child: const Text("OK"),
                              ),
                            );
                          },
                          icon: const Icon(
                            LucideIcons.settings,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => Get.toNamed('/date'),
                      icon: const Icon(
                        LucideIcons.calendar,
                        color: Colors.black,
                      ),
                      label: const Text("Today's Date"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: const StadiumBorder(),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
