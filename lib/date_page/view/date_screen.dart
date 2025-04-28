import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(now);
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.indigo.shade900,
              Colors.purple.shade900,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 32, // Account for padding
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      LucideIcons.calendar,
                      size: 40, // Slightly smaller icon
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 12), // Reduced spacing
                    Text(
                      "Today's Date",
                      style: TextStyle(
                        fontSize: 16, // Smaller font
                        color: Colors.amber.shade200,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8), // Reduced spacing
                    Text(
                      formattedDate,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14, // Smaller font
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20), // Reduced spacing
                    ElevatedButton.icon(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        LucideIcons.arrowLeft,
                        color: Colors.black,
                        size: 18, // Smaller icon
                      ),
                      label: const Text(
                        "Back",
                        style: TextStyle(fontSize: 12), // Smaller text
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6, // Smaller padding
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