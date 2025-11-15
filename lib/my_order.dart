import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // tabs: Active, Completed, Cancelled
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: const Color(0xFFFFCC33),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'My Orders',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            _buildNoOrdersMessage(),
            const Center(child: Text('Completed Orders List')),
            const Center(child: Text('Cancelled Orders List')),
          ],
        ),
      ),
    );
  }


  Widget _buildNoOrdersMessage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.article_outlined,
            size: 80,
            color: Color(0xFFFFCC38),
          ),
          SizedBox(height: 20),
          Text(
            "You don't have any\nactive orders at this time",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.redAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
  }

