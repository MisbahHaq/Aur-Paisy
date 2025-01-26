import 'package:flutter/material.dart';

class WalletHomePage extends StatefulWidget {
  @override
  _WalletHomePageState createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  double walletBalance = 56678;
  List<Map<String, dynamic>> transactions = [
    {'title': 'Groceries', 'amount': -1500, 'date': '2024-12-01'},
    {'title': 'Salary', 'amount': 35000, 'date': '2024-12-05'},
    {'title': 'Coffee', 'amount': -180, 'date': '2024-12-10'},
  ];

  List<double> balanceHistory = [1000.0, 950.0, 2950.0, 2945.0];

  void addTransaction(String title, double amount) {
    setState(() {
      walletBalance += amount;
      transactions.add({
        'title': title,
        'amount': amount,
        'date': DateTime.now().toString().split(' ')[0],
      });
      balanceHistory.add(walletBalance);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(102, 42, 178, 1),
        title: const Text(
          "Reports",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromRGBO(102, 42, 178, 1),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wallet Balance: \$${walletBalance.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: CustomPaint(
                      painter: AreaChartPainter(balanceHistory),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
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
                            title: Text(transaction['title']),
                            subtitle: Text(transaction['date']),
                            trailing: Text(
                              '${transaction['amount'] > 0 ? '+' : ''}\$${transaction['amount'].toStringAsFixed(2)}',
                              style: TextStyle(
                                color: transaction['amount'] > 0
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(102, 42, 178, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _showAddTransactionDialog(),
      ),
    );
  }

  void _showAddTransactionDialog() {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Transaction'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final title = titleController.text;
                final amount = double.tryParse(amountController.text) ?? 0.0;
                addTransaction(title, amount);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class AreaChartPainter extends CustomPainter {
  final List<double> balanceHistory;

  AreaChartPainter(this.balanceHistory);

  @override
  void paint(Canvas canvas, Size size) {
    if (balanceHistory.isEmpty) return;

    final paintLine = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paintArea = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    final areaPath = Path();

    double minY = balanceHistory.reduce((a, b) => a < b ? a : b);
    double maxY = balanceHistory.reduce((a, b) => a > b ? a : b);
    double rangeY = maxY - minY == 0 ? 1 : maxY - minY;

    for (int i = 0; i < balanceHistory.length; i++) {
      double x = (i / (balanceHistory.length - 1)) * size.width;
      double y =
          size.height - ((balanceHistory[i] - minY) / rangeY) * size.height;

      if (i == 0) {
        path.moveTo(x, y);
        areaPath.moveTo(x, size.height);
        areaPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        areaPath.lineTo(x, y);
      }
    }

    areaPath.lineTo(size.width, size.height);
    areaPath.close();

    canvas.drawPath(areaPath, paintArea);
    canvas.drawPath(path, paintLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
