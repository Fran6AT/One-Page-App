import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Page App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PlaceholderWidget(Colors.white), // Home
    PlaceholderWidget(Colors.green), // Send
    HistoryPage(),
    PlaceholderWidget(Colors.yellow), // Scheduled
    TransactionSummaryPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('One Page App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'History'),
              Tab(text: 'Transaction Summary'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(),
                SizedBox(height: 16),
                _buildDateDisplay(),
                SizedBox(height: 24),
                _buildTransactionSection(),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Expanded(
                    child: _pages[_selectedIndex],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1),
                  color:
                      _selectedIndex == 0 ? Colors.green : Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.home,
                    color: _selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send, color: Colors.black),
              label: 'Send',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, color: Colors.black),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule, color: Colors.black),
              label: 'Scheduled',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Icon(Icons.filter_list),
        ],
      ),
    );
  }

  Widget _buildDateDisplay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300], // Gray box background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 4),
                Text(
                  'May 25, 2022',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        _buildTransactionSection(),
      ],
    );
  }

  Widget _buildTransactionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        _buildTransactionItem(
          name: 'Emmanuel Rockson',
          phoneNumber: '024 123 4567',
          amount: '\GHS 500',
          isSuccess: true,
        ),
        SizedBox(height: 16),
        _buildTransactionItem(
          name: 'ABSA Bank',
          phoneNumber: '024123 4567',
          amount: '\GHS 500',
          isSuccess: false,
        ),
        SizedBox(height: 24),
        _buildDateHeader('June 1, 2022'),
        SizedBox(height: 8),
        _buildTransactionItem(
          name: 'Emmanuel Rockson',
          phoneNumber: '024 123 4567',
          amount: '\GHS 500',
          isSuccess: true,
        ),
        SizedBox(height: 16),
        _buildTransactionItem(
          name: 'Emmanuel Rockson',
          phoneNumber: '024 123 4567',
          amount: '\GHS 500',
          isSuccess: false,
        ),
      ],
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, size: 16),
            SizedBox(width: 4),
            Text(
              date,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String name,
    required String phoneNumber,
    required String amount,
    required bool isSuccess,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      SizedBox(height: 4),
                      Text(phoneNumber,
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isSuccess ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isSuccess ? Icons.check : Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              isSuccess ? 'Successful' : 'Failed',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(amount,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey), // Divider line
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.person, color: Colors.white, size: 12),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'cool your heart wai',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: Colors.yellow, size: 12),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('History Page'),
    );
  }
}

class TransactionSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Transaction Summary Page'),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
