import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_detail_screen.dart';

class ProductGridTile extends StatelessWidget {
  final Product product;

  const ProductGridTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            // Navigate to ProductDetailScreen
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: ProductGridFooter(
          product: product,
          onFavoritePressed: () {
            // Handle favorite button press
          },
          onAddToCartPressed: () {
            // Handle add to cart button press
          },
        ),
      ),
    );
  }
}

class ProductGridFooter extends StatelessWidget {
  final Product product;
  final void Function()? onFavoritePressed;
  final void Function()? onAddToCartPressed;

  const ProductGridFooter({
    super.key,
    required this.product,
    this.onFavoritePressed,
    this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        icon: Icon(
          product.isFavorite ? Icons.favorite : Icons.favorite_border,
        ),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: onFavoritePressed,
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: onAddToCartPressed,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}