import 'package:flutter/material.dart';
import 'custom_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  // مسارات الصور
  final List<String> productImages = [
    'images/logo.png',
    'images/logo.png',
    'images/logo.png',
    'images/logo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 186, 74),
        title: Row(
          children: [
            Image.asset('images/logo.png', height: 50, width: 50),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: Column(
        children: [
          // حقل البحث
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search for services...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          // ليست أفقية بالـ Dismissible
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productImages.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(
                    productImages[index] + index.toString(),
                  ), // لازم Key فريد
                  direction: DismissDirection.up, // سحب للأعلى
                  onDismissed: (direction) {
                    productImages.removeAt(index);
                    (context as Element).markNeedsBuild(); // تحديث الشاشة
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Icon(Icons.delete, color: Colors.white, size: 50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        productImages[index],
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // شبكة المنتجات
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: productImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      productImages[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(selectedIndex:0),
      
    );
  }
}
