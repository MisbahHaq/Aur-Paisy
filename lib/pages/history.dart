import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF662AB2),
        title: const Text(
          "Transaction History",
          style: TextStyle(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF662AB2),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    transactionItem(
                      icon: Icons.account_balance_wallet_rounded,
                      title: "Withdraw",
                      subtitle: "Today 05:59",
                      amount: "-Rs 54,453",
                      amountColor: Colors.red,
                    ),
                    transactionItem(
                      icon: Icons.wifi,
                      title: "Internet",
                      subtitle: "Yesterday 15:23",
                      amount: "-Rs 2,453",
                      amountColor: Colors.red,
                    ),
                    transactionItem(
                      icon: Icons.tv,
                      title: "Netflix",
                      subtitle: "Yesterday 02:11",
                      amount: "-Rs 800",
                      amountColor: Colors.red,
                    ),
                    transactionItem(
                      icon: Icons.account_balance_wallet_rounded,
                      title: "Withdraw",
                      subtitle: "Yesterday 05:59",
                      amount: "-Rs 4,450",
                      amountColor: Colors.red,
                    ),
                    transactionItem(
                      icon: Icons.account_balance_wallet_rounded,
                      title: "Salary",
                      subtitle: "Yesterday 08:00",
                      amount: "Rs 35,000",
                      amountColor: Colors.green,
                    ),
                    transactionItem(
                      icon: Icons.account_balance_wallet_rounded,
                      title: "Withdraw",
                      subtitle: "Yesterday 17:29",
                      amount: "-Rs 8,450",
                      amountColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget transactionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        leading:
            Icon(icon, size: 30, color: const Color.fromRGBO(102, 42, 178, 1)),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(subtitle),
        ),
        trailing: Text(
          amount,
          style: TextStyle(
            color: amountColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
