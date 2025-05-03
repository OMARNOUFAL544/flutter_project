import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatefulWidget {
  final int selectedIndex;
  CustomBottomNavbar({required this.selectedIndex});

  @override
  _CustomBottomNavbarState createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  void changeItem(index) {
    if (index == widget.selectedIndex) return;

    if (index == 0) {
      Navigator.pushReplacementNamed(context, "/home");
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, "/products");
    } else if (index == 2) {

    }else {
      Navigator.pushReplacementNamed(context, "/home");
    }

  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        selectedItemColor: const Color.fromARGB(255, 79, 76, 175),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        onTap: changeItem,
        currentIndex: widget.selectedIndex,
        backgroundColor: Colors.black,
      ),
    );
    
  }
}