import 'package:flutter/material.dart';
import 'checklist_screen.dart'; // This screen we'll build next

class EquipmentCodeScreen extends StatelessWidget {
  final String category;

  EquipmentCodeScreen({required this.category});

  final Map<String, List<String>> equipmentCodes = {
    "AIR CURTAIN": ['500601', '500602', '500603', '500604', '500605'],
    "ARC WELDING MACHINE": ['500701', '500702'],
    "BOILER": ['500801', '500802'],
    "CHAPATI MACHINE": ['501001', '501002'],
    "COLD ROOM": ['501101', '501102'],
    "DAL TANK": ['501201', '501202'],
    "DAL COOKER": ['501301', '501302'],
  };

  @override
  Widget build(BuildContext context) {
    final List<String> codes = equipmentCodes[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: codes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChecklistScreen(
                      equipmentCode: codes[index],
                      category: category,
                    ),
                  ),
                );
              },
              child: Text("Equipment Code: ${codes[index]}", style: const TextStyle(fontSize: 16)),
            ),
          );
        },
      ),
    );
  }
}
