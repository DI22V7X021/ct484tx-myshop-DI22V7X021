import 'package:flutter/material.dart';
import 'ui/orders/orders_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.blue,
        onSurface: Colors.black,
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );

    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      // Hiệu chỉnh trang home
      home: const SafeArea(
        child: OrdersScreen(),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}