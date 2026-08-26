import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InventoryScreen(),
  ));
}

class Product {
  final String name;
  final int daysLeft;
  Product(this.name, this.daysLeft);
}

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product("حليب طويل الأجل", 18),
      Product("علب تونة", 39),
      Product("أرز بسمتي", 249),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("مخزوني"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(item.name),
              trailing: Text(
                "${item.daysLeft} يوم",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
