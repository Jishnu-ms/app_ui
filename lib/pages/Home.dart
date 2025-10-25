import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/ScrollableChips.dart';
import 'package:flutter_application_1/widgets/CryptoCard.dart';
import '../widgets/BalanceCard.dart';

final balanceCards = [
  BalanceCardItem(
    balance: 67426274,
    changePercent: 2.5,
    number: "****672",
    expiry: "08/25",
    buttonText: "Add Money",
  ),
];
final chipList = ["Top", "News", "Invest", "Socials", "Market"];
final cryptoList = [
  CryptoItem(
    name: "Ethereum",
    price1: 1297.69,
    price2: "59.47 ETH",
    price3: 1300.00,
    changePercent: 0.75,
  ),
  CryptoItem(
    name: "Bitcoin",
    price1: 23450.12,
    price2: "59.47 ETH",
    price3: 23500.00,
    changePercent: -1.23,
    imageUrl: "https://cryptoicons.org/api/icon/btc/200",
  ),
  CryptoItem(
    name: "Cardano",
    price1: 0.56,
    price2: "59.47 ETH",
    price3: 0.57,
    changePercent: 2.34,
  ),
  CryptoItem(
    name: "Ethereum",
    price1: 1297.69,
    price2: "59.47 ETH",
    price3: 1300.00,
    changePercent: 0.75,
  ),
  CryptoItem(
    name: "Bitcoin",
    price1: 23450.12,
    price2: "59.47 ETH",
    price3: 23500.00,
    changePercent: -1.23,
    imageUrl: "https://cryptoicons.org/api/icon/btc/200",
  ),
  CryptoItem(
    name: "Cardano",
    price1: 0.56,
    price2: "59.47 ETH",
    price3: 0.57,
    changePercent: 2.34,
  ),
  CryptoItem(
    name: "Cardano",
    price1: 0.56,
    price2: "59.47 ETH",
    price3: 0.57,
    changePercent: 2.34,
  ),
  CryptoItem(
    name: "Cardano",
    price1: 0.56,
    price2: "59.47 ETH",
    price3: 0.57,
    changePercent: 2.34,
  ),
];
final List<Map<String, String>> greetingList = [
  {"title": "Hi, Jishnu", "subtitle": "Have a good day!"},
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/profile.jpg'),
                backgroundColor: Colors.blueGrey,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    greetingList[0]["title"]!, // load title from list
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    greetingList[0]["subtitle"]!, // load subtitle from list
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.menu, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            // Card stack
            Column(
              children: balanceCards
                  .map(
                    (item) => BalanceCard(
                      item: item,
                      onButtonTap: () {
                        print("${item.buttonText} tapped!");
                      },
                    ),
                  )
                  .toList(),
            ),
            // Scrollable Chips
            ScrollableChips(chips: chipList, onChipSelected: (index) {}),
            const SizedBox(height: 20),
            // Crypto List
            Expanded(
              child: ListView.builder(
                itemCount: cryptoList.length,
                itemBuilder: (context, index) {
                  return CryptoRow(item: cryptoList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
