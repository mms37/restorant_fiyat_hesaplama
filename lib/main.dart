import 'package:flutter/material.dart';

void main() => runApp(RestaurantApp());

class RestaurantApp extends StatefulWidget {
  @override
  _RestaurantAppState createState() => _RestaurantAppState();
}

class _RestaurantAppState extends State<RestaurantApp> {
  List<Map<String, dynamic>> _menuItems = [
    {"name": "Izgara Somon Filetosu", "price": 45},
    {"name": "Tavuk Şinitzel", "price": 38},
    {"name": "Sebzeli Noodle", "price": 28},
    {"name": "Biftek", "price": 50},
    {"name": "Karides Linguine", "price": 48},
    {"name": "Akdeniz Salatası", "price": 20},
    {"name": "Körili Tavuk Salatası", "price": 22},
    {"name": "Mevsim Salatası", "price": 18},
    {"name": "Mercimek Çorbası", "price": 12},
    {"name": "Tavuklu Noodle Çorbası", "price": 14},
    {"name": "Sebzeli Et Suyu Çorbası", "price": 16},
    {"name": "Çikolatalı Muhallebi", "price": 15},
    {"name": "Elmalı Turta", "price": 18},
    {"name": "Kadayıf Dolması", "price": 14},
    {"name": "Sıcak Çikolatalı Brownie", "price": 20},
  ];

  List<Map<String, dynamic>> _selectedItems = [];

  void _onItemChecked(bool value, int index) {
    setState(() {
      _menuItems[index]['selected'] = value;
      if (value) {
        _selectedItems.add(_menuItems[index]);
      } else {
        _selectedItems.remove(_menuItems[index]);
      }
    });
  }

  double _calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in _selectedItems) {
      totalPrice += item['price'];
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lezzetli Tatlar Restoranı'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_menuItems[index]['name']),
                    trailing: Checkbox(
                      value: _menuItems[index]['selected'] ?? false,
                      onChanged: (value) {
                        _onItemChecked(value!, index);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Toplam Fiyat: ${_calculateTotalPrice().toStringAsFixed(2)} TL',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
