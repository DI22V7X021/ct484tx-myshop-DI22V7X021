import 'package:flutter/material.dart';
import 'ui/screens.dart';

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
      home: const ProductsOverviewScreen(),
      // Define named routes
      routes: {
        CartScreen.routeName: (ctx) => const SafeArea(
          child: CartScreen(),
        ),
        OrdersScreen.routeName: (ctx) => const SafeArea(
          child: OrdersScreen(),
        ),
        UserProductsScreen.routeName: (ctx) => const SafeArea(
          child: UserProductsScreen(),
        ),
      },
      // Handle dynamic routing
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return SafeArea(
                child: ProductDetailScreen(
                  ProductsManager().findById(productId)!,
                ),
              );
            },
          );
        }
        return null;
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}