import 'package:flutter/material.dart';
import 'equipment_code_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    "AIR HANDLING UNIT (AHU)",
    "AIR CURTAIN",
    "ARC WELDING MACHINE",
    "BOILER DAILY CHECKLIST",
    "Boiler WEEKLY CHECKLIST",
    "CHAPATI MACHINE",
    "COLD ROOM",
    "DAL TANK",
    "DAL COOKER",
    "DIESEL GENERATOR",
    "EXHAUST FANS",
    "GAS BANK AND LINES",
    "HAND DRIER",
    "HAND SANITIZING DISPENSOR",
    "HYDARULIC TROLLY",
    "JET WASHING MACHINE",
    "ATTA KNEADING MACHINE",
    "Panel Board",
    "POTATO PEELER",
    "RICE CHUTE",
    "RICE CLEANING MACHINE",
    "RICE COOKER",
    "SEASONING BHATTI",
    "TILTING WET GRINDER",
    "UPS",
    "VEGETABLE CUTTING MACHINE",
    "VEGETABLE WASHING MACHINE",
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCategories = categories
        .where((category) =>
            category.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("TAPF Maintenance"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search equipment...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    title: Text(
                      filteredCategories[index],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EquipmentCodeScreen(
                            category: filteredCategories[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}