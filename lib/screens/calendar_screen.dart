import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'success_screen.dart';

class CalendarScreen extends StatefulWidget {
  final String equipmentCode;
  final String checkpoint;

  const CalendarScreen({super.key, required this.equipmentCode, required this.checkpoint});

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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xFF0288D1),
                  onPrimary: Colors.white,
                  surface: Colors.grey[100],
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF0288D1),
              ),
            ),
          ),
          child: child!,
        );
      },
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
        SnackBar(
          content: const Text("Please select date and status"),
          backgroundColor: Colors.red[400],
        ),
      );
      return;
    }

    if (status == 'Pending' && remarkController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please add a remark for pending status"),
          backgroundColor: Colors.red[400],
        ),
      );
      return;
    }

    final dateStr = DateFormat('dd-MM-yyyy').format(selectedDate!);

    final result = {
      "equipmentCode": widget.equipmentCode,
      "checkpoint": widget.checkpoint,
      "date": dateStr,
      "status": status,
      "remark": status == 'Pending' ? remarkController.text.trim() : '',
    };

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
      appBar: AppBar(
        title: Text("Select Date & Status - ${widget.equipmentCode}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.checkpoint,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(
              "Equipment Code: ${widget.equipmentCode}",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: pickDate,
              icon: const Icon(Icons.calendar_today, size: 20),
              label: Text(
                selectedDate == null
                    ? "Pick a Date"
                    : "Date: ${DateFormat('dd-MM-yyyy').format(selectedDate!)}",
                style: const TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Select Status",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ChoiceChip(
                  label: const Text("Done"),
                  selected: status == 'Done',
                  onSelected: (_) => setState(() => status = 'Done'),
                  selectedColor: const Color(0xFFFFA000),
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: status == 'Done' ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text("Pending"),
                  selected: status == 'Pending',
                  onSelected: (_) => setState(() => status = 'Pending'),
                  selectedColor: const Color(0xFFFFA000),
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: status == 'Pending' ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (status == 'Pending')
              TextField(
                controller: remarkController,
                decoration: InputDecoration(
                  labelText: "Add Remark (if any)",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: 3,
              ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: submit,
                icon: const Icon(Icons.save),
                label: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}