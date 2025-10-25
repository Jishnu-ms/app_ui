import 'package:flutter/material.dart';
import '../widgets/transaction_tile.dart';
import 'package:intl/intl.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {
        "name": "Albert Flores",
        "time": "2025-10-25 00:00", // yyyy-MM-dd HH:mm format
        "amount": "520.00",
        "imageUrl": null,
        "isCredit": true,
      },
      {
        "name": "Cody Fisher",
        "time": "2025-10-24 18:15",
        "amount": "210.00",
        "imageUrl":
            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
        "isCredit": false,
      },
      {
        "name": "Jane Cooper",
        "time": "2025-10-23 20:45",
        "amount": "999.00",
        "imageUrl":
            "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
        "isCredit": true,
      },
      {
        "name": "Albert Flores",
        "time": "2025-10-25 00:00", // yyyy-MM-dd HH:mm format
        "amount": "520.00",
        "imageUrl": null,
        "isCredit": true,
      },
      {
        "name": "Cody Fisher",
        "time": "2025-10-24 18:15",
        "amount": "210.00",
        "imageUrl":
            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
        "isCredit": false,
      },
      {
        "name": "Jane Cooper",
        "time": "2025-10-23 20:45",
        "amount": "999.00",
        "imageUrl":
            "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
        "isCredit": true,
      },
    ];

    String _monthName(int month) {
      const months = [
        '', // month starts at 1
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      return months[month];
    }

    final Map<String, List<Map<String, dynamic>>> groupedTransactions = {};
    for (var t in transactions) {
      DateTime dt = DateTime.parse(t['time']); // parse string to DateTime
      String dateHeading =
          "${dt.day.toString().padLeft(2, '0')} "
          "${_monthName(dt.month)} ${dt.year}"; // e.g., 25 Oct 2025

      if (!groupedTransactions.containsKey(dateHeading)) {
        groupedTransactions[dateHeading] = [];
      }
      groupedTransactions[dateHeading]!.add(t);
    }

    String formatTransactionTime(String dateTimeStr) {
      DateTime dt = DateTime.parse(dateTimeStr);
      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime yesterday = today.subtract(const Duration(days: 1));
      DateTime dtDate = DateTime(dt.year, dt.month, dt.day);

      String time = DateFormat.jm().format(dt); // 12:20 PM

      if (dtDate == today) {
        return "Today $time";
      } else if (dtDate == yesterday) {
        return "Yesterday $time";
      } else {
        String monthDay = DateFormat('MMM d').format(dt); // Aug 11
        return "$monthDay $time";
      }
    }

    // Helper function to get month name

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            // Back button
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 50),
            const Text(
              "Transaction History",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),

      // ✅ Body fixed
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: groupedTransactions.entries.map((entry) {
            String date = entry.key; // e.g., "25 Oct 2025"
            List<Map<String, dynamic>> items = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                ...items.map(
                  (t) => TransactionTile(
                    name: t["name"].toString(),
                    time: formatTransactionTime(t["time"]),
                    amount: t["amount"].toString(),
                    imageUrl: t["imageUrl"]?.toString(),
                    isCredit: t["isCredit"] as bool,
                  ),
                ),

                const SizedBox(height: 12),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
