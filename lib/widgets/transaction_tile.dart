import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String name;
  final String time;
  final String amount;
  final String? imageUrl;
  final bool isCredit; // true = money added, false = deducted

  const TransactionTile({
    super.key,
    required this.name,
    required this.time,
    required this.amount,
    this.imageUrl,
    this.isCredit = true,
  });



  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
       
      ),
      child: Row(
        children: [
          // Profile picture or grey circle
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              shape: BoxShape.circle,
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl == null
                ? const Icon(Icons.person, color: Colors.white, size: 28)
                : null,
          ),

          const SizedBox(width: 16),

          // Name and Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Amount
          Text(
            (isCredit ? '+' : '-') + amount,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
