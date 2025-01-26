import 'package:banking/pages/history.dart';
import 'package:banking/pages/profile.dart';
import 'package:banking/pages/report.dart';
import 'package:banking/pages/transfer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // Home Page Content
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // Header and Points section
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  const Icon(Icons.circle_sharp, color: Colors.white),
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  const Text(
                    "AurPaisy",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Container(
                    width: 90,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Center(
                      child: Text(
                        "1172 Points",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 30),

              // Balance Section
              Column(
                children: const [
                  Text(
                    'Your Balance',
                    style: TextStyle(
                        fontWeight: FontWeight.w200, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 120)),
                      Text(
                        "Rs 56,678",
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.visibility_off),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Action Buttons (Transfer, Top Up, Withdraw, More)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  height: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Transfer Button
                      Builder(
                        builder: (BuildContext innerContext) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    innerContext,
                                    MaterialPageRoute(
                                      builder: (context) => const Transfer(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.compare_arrows_outlined,
                                  size: 30,
                                  color: Color.fromRGBO(102, 42, 178, 1),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Transfer",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      ),
                      // Top Up Button
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wallet,
                            size: 30,
                            color: Color.fromRGBO(102, 42, 178, 1),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Top Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Withdraw Button
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance_wallet_rounded,
                            size: 30,
                            color: Color.fromRGBO(102, 42, 178, 1),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Withdraw",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // More Button
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu,
                            size: 30,
                            color: Color.fromRGBO(102, 42, 178, 1),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "More",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Send Again and Latest Transactions Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Send Again",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.add,
                                size: 30, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/one.jpg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/one.jpg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/one.jpg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/one.jpg'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Latest Transaction",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.green),
                        ),
                      ],
                    ),
                    // Transactions List
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        ListTile(
                          leading: Icon(Icons.account_balance_wallet_rounded,
                              size: 30, color: Color.fromRGBO(102, 42, 178, 1)),
                          title: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Withdraw",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          subtitle: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Today 05:59")),
                          trailing: Text("-Rs 54,453",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ListTile(
                          leading: Icon(Icons.wifi,
                              size: 30, color: Color.fromRGBO(102, 42, 178, 1)),
                          title: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Internet",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          subtitle: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Yesterday 15:23")),
                          trailing: Text("-Rs 2,453",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ListTile(
                          leading: Icon(Icons.tv,
                              size: 30, color: Color.fromRGBO(102, 42, 178, 1)),
                          title: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Netflix",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          subtitle: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Yesterday 02:11")),
                          trailing: Text("-Rs 800",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance_wallet_rounded,
                              size: 30, color: Color.fromRGBO(102, 42, 178, 1)),
                          title: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Withdraw",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          subtitle: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Yesterday 05:59")),
                          trailing: Text("-Rs 4,450",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance_wallet_rounded,
                              size: 30, color: Color.fromRGBO(102, 42, 178, 1)),
                          title: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Salary",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          subtitle: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Yesterday 08:00")),
                          trailing: Text("Rs 35000",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance_wallet_rounded,
                              size: 30, color: Color.fromRGBO(102, 42, 178, 1)),
                          title: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Withdraw",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          subtitle: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Yesterday 17:29")),
                          trailing: Text("-Rs 8,450",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        // Add more transactions here...
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Page 2, Page 3, etc.
      WalletHomePage(),
      const Center(child: Text("Page 3")),
      const HistoryPage(),
      ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(102, 42, 178, 1),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(102, 42, 178, 1),
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 25),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2_outlined, size: 50),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_sharp),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
