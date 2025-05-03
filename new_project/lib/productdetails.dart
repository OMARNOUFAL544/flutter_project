import 'package:flutter/material.dart';
import 'product.dart'; // تأكد أنك تستورد الكلاس Product

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(product.imageUrl, height: 200),
            SizedBox(height: 20),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(product.desc, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("${product.price}", style: TextStyle(fontSize: 20, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}