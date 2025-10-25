import 'package:flutter/material.dart';

// Data class for card details
class BalanceCardItem {
  final double balance;
  final double changePercent;
  final String number;
  final String expiry;
  final String buttonText;

  BalanceCardItem({
    required this.balance,
    required this.changePercent,
    required this.number,
    required this.expiry,
    required this.buttonText,
  });
}

// Reusable widget
class BalanceCard extends StatelessWidget {
  final BalanceCardItem item;
  final VoidCallback? onButtonTap;

  const BalanceCard({super.key, required this.item, this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Card
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Logo/Icon on the left
                  const SizedBox(width: 8), // spacing between logo and text
                  Text(
                    "\$${item.balance.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  const Icon(
                    Icons.account_balance_wallet, // choose any icon you like
                    color: Colors.white,
                    size: 32,
                  ),
                ],
              ),

              const SizedBox(height: 4),
              Text(
                "${item.changePercent >= 0 ? '+' : ''}${item.changePercent.toStringAsFixed(2)}% from last month!",
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 38),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Number",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        item.number,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Exp.",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        item.expiry,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // Add Money Button
        Positioned(
          right: 13,
          bottom: 14,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                // Your tap logic here
                print("Add Money button tapped!");
                if (onButtonTap != null) {
                  onButtonTap!(); // call the callback if provided
                }
              },
              child: Container(
                width: 160,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF6A5ACD),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  item.buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
