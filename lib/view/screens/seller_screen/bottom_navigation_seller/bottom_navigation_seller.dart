import 'package:flutter/material.dart';
import '../account_screen_seller/seller_account_screen.dart';
import '../chat_screen/seller_chat_sceen.dart';
import '../home_page_seller/seller_home_screen.dart';
import '../manage_orders/seller_manage_orders.dart';

class BottomNavigationSeller extends StatefulWidget {
  const BottomNavigationSeller({Key? key}) : super(key: key);

  @override
  State<BottomNavigationSeller> createState() => _BottomNavigationSellerState();
}

class _BottomNavigationSellerState extends State<BottomNavigationSeller> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = const [
    SellerHomeScreen(),
    SellerChatScreen(),
    SellerManageOrders(),
    SellerAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 50, 50, 51),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.grey[200],
              label: "Home",
              icon: const Icon(
                Icons.home_outlined,
                size: 32,
              ),
            ),
            const BottomNavigationBarItem(
              label: "Chat",
              icon: Icon(
                Icons.message_rounded,
                size: 30,
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_outlined),
              label: 'User',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 101, 144, 209),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: const Color.fromARGB(255, 107, 105, 105),
          iconSize: 30,
        ),
      ),
    );
  }
}
