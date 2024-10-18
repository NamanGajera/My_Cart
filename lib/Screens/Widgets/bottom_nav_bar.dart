import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast package
import 'package:my_cart/Screens/BottomBarScreens/cart_screen.dart';
import 'package:my_cart/Screens/BottomBarScreens/home_screen.dart';
import 'package:my_cart/Screens/BottomBarScreens/menu_screen.dart';
import 'package:my_cart/Screens/BottomBarScreens/wishlist_screen.dart';
import 'package:my_cart/Utils/colors.dart';

import '../../Utils/helper.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  DateTime? currentBackPressTime; // To track back press time

  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    WishlistScreen(),
    MenuScreen(),
  ];

  Future<bool> onWillPop() async {
    // If user is not on the home screen, navigate back to the home screen
    if (selectedIndex != 0) {
      setState(() {
        selectedIndex = 0;
        _pageController.jumpToPage(0);
      });
      return Future.value(false); // Prevent app from closing
    }

    // If user is already on the home screen, show toast message
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Helper.showToastMessage('Press back again to exit');
      return Future.value(false); // Prevent app from closing
    }
    return Future.value(true); // Close the app if pressed twice within 2 seconds
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop, // Assign onWillPop to handle back button press
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            controller: _pageController,
            children: screens,
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            elevation: 2,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black, // Set selected item color to black
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                _pageController.jumpToPage(selectedIndex);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/home_icon.svg',
                  height: 21,
                  width: 21,
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/home_icon.svg',
                  height: 22,
                  width: 22,
                  color: primaryGreenColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/cart_icon.svg',
                  height: 21,
                  width: 21,
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/cart_icon.svg',
                  height: 22,
                  width: 22,
                  color: primaryGreenColor,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/wishlist.svg',
                  height: 21,
                  width: 21,
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/wishlist.svg',
                  height: 22,
                  width: 22,
                  color: primaryGreenColor,
                ),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/menu_icon.svg',
                  height: 21,
                  width: 21,
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/menu_icon.svg',
                  height: 22,
                  width: 22,
                  color: primaryGreenColor,
                ),
                label: 'Menu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
