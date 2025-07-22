import 'package:flutter/material.dart';
import 'checklist_screen.dart';

class EquipmentCodeScreen extends StatelessWidget {
  final String category;

  const EquipmentCodeScreen({super.key, required this.category});

  final Map<String, List<String>> equipmentCodes = const {
    "AIR HANDLING UNIT (AHU)": ['600101', '600102'],
    "AIR CURTAIN": ['600201', '600202', '600203'],
    "ARC WELDING MACHINE": ['600301', '600302'],
    "BOILER DAILY CHECKLIST": ['600401'],
    "Boiler WEEKLY CHECKLIST": ['600402'],
    "CHAPATI MACHINE": ['600501', '600502'],
    "COLD ROOM": ['600601', '600602'],
    "DAL TANK": ['600701', '600702'],
    "DAL COOKER": ['600801', '600802'],
    "DIESEL GENERATOR": ['600901', '600902'],
    "EXHAUST FANS": ['601001', '601002', '601003'],
    "GAS BANK AND LINES": ['601101'],
    "HAND DRIER": ['601201', '601202'],
    "HAND SANITIZING DISPENSOR": ['601301'],
    "HYDARULIC TROLLY": ['601401', '601402'],
    "JET WASHING MACHINE": ['601501'],
    "ATTA KNEADING MACHINE": ['601601', '601602'],
    "Panel Board": ['601701', '601702'],
    "POTATO PEELER": ['601801'],
    "RICE CHUTE": ['601901'],
    "RICE CLEANING MACHINE": ['602001'],
    "RICE COOKER": ['602101', '602102'],
    "SEASONING BHATTI": ['602201'],
    "TILTING WET GRINDER": ['602301'],
    "UPS": ['602401', '602402'],
    "VEGETABLE CUTTING MACHINE": ['602501', '602502'],
    "VEGETABLE WASHING MACHINE": ['602601', '602602'],
  };

  @override
  Widget build(BuildContext context) {
    final List<String> codes = equipmentCodes[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: codes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                "Equipment Code: ${codes[index]}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                category,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
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
            ),
          );
        },
      ),
    );
  }
}