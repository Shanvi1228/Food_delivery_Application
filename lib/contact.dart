import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  final Color primaryOrange = const Color(0xFFFFA726);

  final List<Map<String, dynamic>> contactOptions = [
    {'title': 'Customer service', 'icon': Icons.person_outline},
    {'title': 'Website', 'icon': Icons.language_outlined},
    {'title': 'Facebook', 'icon': Icons.facebook},
    {'title': 'Instagram', 'icon': Icons.camera_alt_outlined},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          decoration: BoxDecoration(
            color: primaryOrange,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
            child: SafeArea(child:
             Padding(
            padding: const EdgeInsets.only(top:10, left: 16.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [
                    IconButton(icon: Icon (Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                     onPressed: (){
                      Navigator.pop(context);
                     },),
                    const Spacer(),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 4),
                // Subtitle
                const Text(
                  'How Can We Help You?',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
            )
        ),
      ),


      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryOrange,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'FAQ'),
                  Tab(text: 'Contact Us'),
                ],
              ),
            ),
          ),


          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [

                const Center(child: Text('FAQ Content Goes Here')),


                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  children: contactOptions.map((option) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CustomContactTile(
                        title: option['title'],
                        iconData: option['icon'],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CustomContactTile extends StatelessWidget {
  final String title;
  final IconData iconData;

  const CustomContactTile({
    super.key,
    required this.title,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        leading: Icon(iconData, color: Colors.black54),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 70.0, right: 16.0, bottom: 8.0),
            child: Text(
              'Details for $title will appear here, e.g., a phone number, a chat link, or a support email.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}

