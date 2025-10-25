import 'package:flutter/material.dart';

class CryptoItem {
  final String name; // right heading
  final double price1;
  final String price2;
  final double price3;
  final double changePercent;
  final String? imageUrl; // optional profile image

  CryptoItem({
    required this.name,
    required this.price1,
    required this.price2,
    required this.price3,
    required this.changePercent,
    this.imageUrl,
  });
}

class CryptoRow extends StatelessWidget {
  final CryptoItem item;

  const CryptoRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Profile image
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  image: item.imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(item.imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: item.imageUrl == null
                    ? const Icon(Icons.person, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 10),
              // Left Column: price + percentage
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "\$${item.price1.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${item.changePercent >= 0 ? '+' : ''}${item.changePercent.toStringAsFixed(2)}%",
                        style: TextStyle(
                          color: item.changePercent >= 0
                              ? Colors.green
                              : Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              // Right Column: heading/name
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${item.price2}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "\$${item.price3.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
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
        // Divider
        const Divider(
          color: Colors.black12,
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}
