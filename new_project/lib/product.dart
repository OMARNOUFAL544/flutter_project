

import 'package:flutter/material.dart';
import 'custom_bottom_navbar.dart'; // تأكد من استيراد الكلاس
// void main() {
//   runApp(MyApp());
// }

// ✅ كلاس البيانات
class Product {
  int id;
  String name;
  String desc;
  double price;
  String imageUrl;
  int categoryId;

  Product(this.id, this.name, this.desc, this.price, this.imageUrl, this.categoryId);
}

// ✅ قائمة المنتجات
List<Product> products = [
  Product(1, " Technical Analysis Course", "Master the art of analyzing financial markets and making informed trading decisions with our comprehensive Technical Analysis Course. ", 299.00, "images/service-1.png", 1),
  Product(2, "Time Analysis Course", "Unlock the power of time in trading with our specialized Time Analysis Course. This course is designed to teach you how to analyze market cycles, timing strategies, and predict key turning points with greater precision.", 499.00, "images/service-2.png", 1),
  Product(3, "Price Indicators Course ", "Enhance your trading accuracy by mastering the most powerful tools in technical analysis — price indicators. This course dives deep into how price-based indicators can help you identify trends, momentum, and potential reversals with clarity and confidence.", 399.00, "images/service-5.png", 1),
  Product(3, "Risk Management Course ", "Protect your capital and trade with confidence through our Risk Management Course, designed to teach you the most critical aspect of successful trading — preserving your money. Whether you're a beginner or an experienced trader, mastering risk is essential for long-term success.", 399.00, "images/service-4.png", 1),
];

// ✅ التطبيق الأساسي
class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Grid',
      home: Scaffold(
        appBar: AppBar(title: Text('Product List')),
        body: ProductGrid(),
        bottomNavigationBar: CustomBottomNavbar(selectedIndex: 1), // تأكد من استيراد الكلاس
      ),
    );
  }
}

// ✅ ويدجت الشبكة (Grid)
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 3 / 4,
      padding: EdgeInsets.all(8),
      children: products.map((product) => ProductCard(product: product)).toList(),
    );
  }
}

// ✅ ويدجت عرض المنتج
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Image.asset(product.imageUrl, fit: BoxFit.cover)),
            SizedBox(height: 8),
            Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(product.desc, style: TextStyle(color: Colors.grey[600])),
            Text("\$${product.price}", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
        
      ),
    );
  }
}