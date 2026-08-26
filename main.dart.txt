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
        title: const Text('مراقب صلاحية البقالة'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          final color = item.daysLeft <= 30
              ? Colors.red
              : (item.daysLeft <= 90 ? Colors.orange : Colors.green);

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: color,
                child: Text('${item.daysLeft}', style: const TextStyle(color: Colors.white)),
              ),
              title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                item.daysLeft <= 30
                    ? '🚨 حرج: اسحبه أو بعه فوراً!'
                    : (item.daysLeft <= 90 ? '⚠️ عروض: أضفه للتخفيضات' : '✅ آمن'),
              ),
            ),
          );
        },
      ),
    );
  }
}
