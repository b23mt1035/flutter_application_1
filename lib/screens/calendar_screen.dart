import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'success_screen.dart';

class CalendarScreen extends StatefulWidget {
  final String equipmentCode;
  final String checkpoint;

  CalendarScreen({required this.equipmentCode, required this.checkpoint});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime? selectedDate;
  String status = '';
  final TextEditingController remarkController = TextEditingController();

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void submit() {
    if (selectedDate == null || status.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select date and status")),
      );
      return;
    }

    final dateStr = DateFormat('dd-MM-yyyy').format(selectedDate!);

    final result = {
      "equipmentCode": widget.equipmentCode,
      "checkpoint": widget.checkpoint,
      "date": dateStr,
      "status": status,
      "remark": status == 'Pending' ? remarkController.text : '',
    };

    // 🔁 Normally send this result to the backend API
    print("✅ Submitted Data: $result");

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SuccessScreen()),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Date & Status")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickDate,
              child: Text(
                selectedDate == null
                    ? "Pick a Date"
                    : "Date: ${DateFormat('dd-MM-yyyy').format(selectedDate!)}",
              ),
            ),
            const SizedBox(height: 20),
            const Text("Select Status", style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceChip(
                  label: const Text("Done"),
                  selected: status == 'Done',
                  onSelected: (_) => setState(() => status = 'Done'),
                ),
                ChoiceChip(
                  label: const Text("Pending"),
                  selected: status == 'Pending',
                  onSelected: (_) => setState(() => status = 'Pending'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (status == 'Pending')
              TextField(
                controller: remarkController,
                decoration: const InputDecoration(
                  labelText: "Add Remark (if any)",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: submit,
              icon: const Icon(Icons.save),
              label: const Text("Submit"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
