import 'package:flutter/material.dart';
import 'calendar_screen.dart';

class ChecklistScreen extends StatelessWidget {
  final String equipmentCode;
  final String category;

  ChecklistScreen({required this.equipmentCode, required this.category});

  final Map<String, List<String>> checklistItems = {
    '500601': [
      "Check the operation of the fans without noise (smoothly).",
      "Check the power cord and plug top for any damage.",
      "Check the body frames for any damage or rust.",
      "Check the fixtures on which the machine is hanging for tightness.",
    ],
  };

  @override
  Widget build(BuildContext context) {
    final items = checklistItems[equipmentCode] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("Checklist - $equipmentCode"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(items[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CalendarScreen(
                      equipmentCode: equipmentCode,
                      checkpoint: items[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
