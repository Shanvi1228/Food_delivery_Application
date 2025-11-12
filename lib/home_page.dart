import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

const Color kHeaderColor = Color(0xFFFFCC33);

class FoodDeliveryHeader extends StatelessWidget {
  const FoodDeliveryHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return const SafeArea(
      bottom: false,
      child: Column(
        children: [
          // 3. Top Row
          _TopActionRow(),

          // 4. Greeting Text Section
          _GreetingText(),

          // 5. Search Bar
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0), // Padding around the search bar
            child: _SearchBar(),
          ),
        ],
      ),
    );
  }
}

// --- Sub-Widgets for Organization ---

// 3. Top Row Widget (Action Icons)
class _TopActionRow extends StatelessWidget {
  const _TopActionRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Push content to the right
        children: [
          _CircularIconButton(icon: Icons.search, onPressed: () {}),
          _CircularIconButton(icon: Icons.notifications_none_sharp, onPressed: () {}),
          _CircularIconButton(icon: Icons.person_outline, onPressed: () {}),
          IconButton(
            // Use the standard menu icon
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {
              // THIS LINE OPENS the drawer assigned to the parent Scaffold
              Scaffold.of(context).openDrawer();
            },
          ),
          // The three small circular icons on the right

        ],
      ),
    );
  }
}

// Helper Widget for the circular icons
class _CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CircularIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Colors.white, // White background for the icons
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black, size: 20),
      ),
    );
  }
}

// 4. Greeting Text Widget
class _GreetingText extends StatelessWidget {
  const _GreetingText();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Text(
            'Good Morning',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900, // Extra bold
              color: Colors.black,
            ),
          ),
          Text(
            "Rise And Shine! It's Tasty Meal Time",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 102, 102, 102),
            ),
          ),
        ],
      ),
    );
  }
}

// 5. Search Bar Widget
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.grey),

        prefixIcon: const Icon(Icons.search, color: Colors.grey),

        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
          borderSide: BorderSide.none, // No border line
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.black12, width: 1.0), // Slight focus border
        ),
      ),
    );
  }
}


class _CategoryChipsRow extends StatelessWidget {
  const _CategoryChipsRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Reduces the top padding to move it up (closer to the search bar)
      // and adds horizontal padding to align with the rest of the content.
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _CategoryChip(imagePath: 'assets/snacks.jfif', label: 'Snacks'),
          _CategoryChip(imagePath: 'assets/meal.jfif', label: 'Meal'),
          _CategoryChip(imagePath: 'assets/vegan.jpg', label: 'Vegan'),
          _CategoryChip(imagePath: 'assets/dessert.jfif', label: 'Dessert'),
          _CategoryChip(imagePath: 'assets/drinks.jfif', label: 'Drinks'),

        ],
      ),
    );
  }
}

// Helper widget to combine image and text for a single category chip
class _CategoryChip extends StatelessWidget {
  final String imagePath;
  final String label;

  const _CategoryChip({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child:
            ClipOval(child:
            Image.asset(imagePath, fit: BoxFit.contain)), // Display the image
          ),
        ),

        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}

// --- Usage Example ---

class BestSellerCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const BestSellerCard({
    required this.imageUrl,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity, // Take full width of the grid cell

              errorBuilder: (context, error, stackTrace) =>
              const Center(child: Icon(Icons.broken_image, color: Colors.red)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Item Title
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
// Define this class outside your main FoodAppHome widget
class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      padding: const EdgeInsets.all(20.0),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.circular(20.0),
        image: const DecorationImage(
          image: AssetImage("assets/hehe.avif"),
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
          opacity: 0.6
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience our',
            style: TextStyle(
                fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w400),
          ),
          Text(
            '50% OFF',
            style: TextStyle(
                fontSize: 34, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          //   child: const Text('Order Now', style: TextStyle(color: Colors.red)),
          // ),
        ],
      ),
    );
  }
}



class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recommend',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          // Horizontal list of recommended items
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,

              children: const [
                FoodCard(
                  imagepath:  "assets/pizza.avif",
                  foodName: 'Olio - The Wood Fired Pizzeria',
                ),
                SizedBox(width: 15),
                FoodCard(
                  imagepath: 'assets/goodbowl.avif',
                  foodName: 'The good bowl',
                ),
                SizedBox(width: 15),
                FoodCard(
                  imagepath: 'assets/rolls.jfif',
                  foodName: 'Rolls Mania',
                ),
                SizedBox(width: 15,),
                FoodCard(
                  imagepath: 'assets/baskin.avif',
                  foodName: 'Baskin Robins',
                ),
                SizedBox(width: 15,),
                FoodCard(
                  imagepath: 'assets/momo.jfif',
                  foodName: 'WOW! MOMO',
                ),
                SizedBox(width: 15,),
                FoodCard(
                  imagepath: 'assets/IDLI.avif',
                  foodName: 'Idli & More',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Food Card Widget ---
class FoodCard extends StatelessWidget {
  final String imagepath;
  final String foodName;

  const FoodCard({
    super.key,
    required this.imagepath,
    required this.foodName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imagepath,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodAppHome extends StatefulWidget {
   FoodAppHome({super.key});

  @override
  State<FoodAppHome> createState() => _FoodAppHomeState();
}

class _FoodAppHomeState extends State<FoodAppHome> {
  int _selectedIndex = 0;

  // 2. Method to update the index when a tab is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  final List<Map<String, String>> bestSellerItems = [
    {
      'url': "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/RX_THUMBNAIL/IMAGES/VENDOR/2025/1/21/932268f8-3469-4b89-ba60-71b20a42ab66_100605.JPG",
      'title': 'Loaded Sub Sandwich'
    },
    {
      'url': "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/RX_THUMBNAIL/IMAGES/VENDOR/2025/8/8/7c8871d0-11a1-4617-a84e-a83b5939f40d_79772.JPG",
      'title': 'Domino\'s Special Pizza'
    },
    {
      'url': "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/RX_THUMBNAIL/IMAGES/VENDOR/2025/10/17/03fe408b-ace6-49c8-adf0-37b3516edf40_508469.JPG",
      'title': 'KFC Bucket Meal'
    },
    {
      'url': "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/RX_THUMBNAIL/IMAGES/VENDOR/2025/6/18/f366ad25-8410-4823-b205-68147000254c_79832.jpg",
      'title': 'Crispy Chicken Burger'
    },

  ];

  @override
  Widget build(BuildContext context) {

     return Scaffold(
       drawer: Drawer(
           backgroundColor: Colors.white,
           child: ListView(
             children: [
               DrawerHeader(
                 child: Column(
                   children: [
                     CircleAvatar(
                       backgroundImage: AssetImage("assets/profile.jfif"),
                       maxRadius: 40,
                     ),
                     Text("Shanvi", style: TextStyle(color: Colors.black45),),
                     Text("shanviofficial2202.gmail.com"),
                   ],
                 ),
               ),
               ListTile(
                 title: Text("My Orders"),
                 leading: Icon(Icons.check_box_outlined),
                 trailing: Icon(Icons.arrow_right_outlined),
               ),
               Divider(),
               ListTile(
                 title: Text("Help & FAQs"),
                 leading: Icon(Icons.chat_bubble),
                 trailing: Icon(Icons.arrow_right_outlined),
               ),
               Divider(),
               ListTile(
                 title: Text("Contact Us"),
                 leading: Icon(Icons.wifi_calling_3_rounded),
                 trailing: Icon(Icons.arrow_right_outlined),
               ),
               Divider(),
               ListTile(
                 title: Text("Settings"),
                 leading: Icon(Icons.settings),
                 trailing: Icon(Icons.arrow_right_outlined),
               ),
             ],
           )),

      body: CustomScrollView(
        slivers: <Widget>[
          // 1. The Header and Search Bar

          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: kHeaderColor,

            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero, // Remove default title padding
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  const FoodDeliveryHeader(),

                ],
              ),
            ),
          ),

          // 2. The Area below the Header
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const _CategoryChipsRow(),
                   Row(
                     children: [

                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    child: Text(
                      'Best Seller',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                       Padding(
                         // Add padding to the right so it doesn't touch the screen edge
                         padding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 5.0),
                         child: Text(
                           "view all > ",
                           style: const TextStyle(fontSize: 14, color: Colors.grey),
                         ),
                       ),
            ]
     ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // 3. The Best Seller Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverGrid.builder(

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15.0, // Vertical spacing
                crossAxisSpacing: 15.0, // Horizontal spacing
                childAspectRatio: 0.8, // Makes cards taller than they are wide
              ),
              itemCount: 4, // Example: 8 items

              // Builds each card in the grid
              itemBuilder: (context, index) {
                // Replace this with your actual card widget
                final itemData = bestSellerItems[index];
                return BestSellerCard(
                  imageUrl: itemData['url']!,
                  title: itemData['title']!,
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),

          const SliverToBoxAdapter(child: _DiscountBanner(),),
          const SliverToBoxAdapter(child: RecommendedSection(),),
          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(

         items: [
           BottomNavigationBarItem(
             icon: Icon(Icons.home_outlined),
             label: 'Home',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.favorite_border),
             label: 'Favorites',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.shopping_bag_outlined),
             label: 'Cart',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.person),
             label: 'Account',
           ),],

         currentIndex: _selectedIndex, // Highlight the current tab
         selectedItemColor: Colors.deepOrange, // primary color
         unselectedItemColor: Colors.black87,
         showUnselectedLabels: true, // Shows label for all items
         onTap: _onItemTapped, // Call the method when a tab is tapped
       ),
    );
  }
}